//
//  CUOffScreenController.m
//  Programming
//
//  Created by Peace on 7/2/20.
//  Copyright © 2020 Peace. All rights reserved.
//

#import "CUOffScreenController.h"

#import "CGGradientView.h"

@interface CUOffScreenController ()

@end

@implementation CUOffScreenController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addLabel];
}

- (void)addLabel {
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 200)];
    textView.backgroundColor = [UIColor lightGrayColor];
    textView.font = [UIFont systemFontOfSize:17];
    textView.text = @"OpenGL中,GPU屏幕渲染有两种方式:\n1.On-Screen Rendering: (当前屏幕渲染):\n指的是GPU的渲染操作是在当前用于显示的屏幕缓冲区进行.\n2.Off-Screen Rendering (离屏渲染):\n指的是在GPU在当前屏幕缓冲区以外开辟一个缓冲区进行渲染操作.\n\n说下缓冲区.要明白缓冲区,首先就得要知道图像显示出来的原理,本文的第一篇博客里面介绍的很详细.显示器 显示出来的图像是经过 CRT电子枪一行一行的扫描.(可以是横向的也可以是纵向 ,具体CRT电子枪又是什么,百度文库介绍的很详细.),扫描出来就呈现了一帧画面,随后电子枪又会回到初始位置循环扫描,为了让显示器的显示跟视频控制器同步,当电子枪新扫描一行的时候.准备扫描的时候,会发送一个 水平同步信号(HSync信号),而当一帧画面绘制完成后,电子枪回复到原位，准备画下一帧前，显示器会发出一个垂直同步信号（vertical synchronization简称 VSync），显示器一般是固定刷新频率的,这个刷新的频率其实就是VSync信号产生的频率. 然后CPU计算好frame等属性,就将计算好的内容提交给GPU去渲染,GPU渲染完成之后就会放入帧缓冲区,然后视频控制器会按照VSync信号逐行读取帧缓冲区的数据,经过可能的数模转换传递给显示器.就显示出来了.原理图就不放了,过一遍概念.\n离屏渲染的代价很高,想要进行离屏渲染,首选要创建一个新的缓冲区,屏幕渲染会有一个上下文环境的一个概念,离屏渲染的整个过程需要切换上下文环境,先从 当前屏幕切换到离屏,等结束后,又要将上下文环境切换回来.这也是为什么会消耗性能的原因了.。由于垂直同步的机制，如果在一个 VSync 时间内，CPU 或者 GPU 没有完成内容提交，则那一帧就会被丢弃，等待下一次机会再显示，而这时显示屏会保留之前的内容不变。这就是界面卡顿的原因。\n\n那有个问题: 为什么离屏渲染这么耗性能,为什么有这套机制呢?\n\n当使用圆角，阴影，遮罩的时候，图层属性的混合体被指定为在未预合成之前(下一个VSync信号开始前)不能直接在屏幕中绘制，所以就需要屏幕外渲染。 你可以这么理解. 老板叫我短时间间内做一个 app.我一个人能做,但是时间太短,所以我得让我朋友一起来帮着我做.(性能消耗: 也就是耗 你跟你朋友之间沟通的这些成本,多浪费啊).但是没办法 谁让你做不完呢.这么一讲会不会比较明白点.";
    [self.view addSubview:textView];
    
    [self testGradientLayer];
    
    UIImageView *imageView = [self firstCircle];
    [self.view addSubview:imageView];
    imageView.frame = CGRectMake(0, 400, 200, 200);
    imageView.center = CGPointMake(CGRectGetWidth(self.view.bounds) / 2.0, CGRectGetHeight(self.view.bounds) / 2.0);
    CGFloat firsCircleWidth = 5;
    CAShapeLayer *shapeLayer = [self generateShapeLayerWithLineWidth:firsCircleWidth];
    shapeLayer.path = [self generateBezierPathWithCenter:CGPointMake(100, 100) radius:100].CGPath;
    imageView.layer.mask = shapeLayer;
}

- (CAShapeLayer *)generateShapeLayerWithLineWidth:(CGFloat)lineWidth
{
    CAShapeLayer *waveline = [CAShapeLayer layer];
    waveline.lineCap = kCALineCapButt;
    waveline.lineJoin = kCALineJoinRound;
    waveline.strokeColor = [UIColor redColor].CGColor;
    waveline.fillColor = [[UIColor clearColor] CGColor];
    waveline.lineWidth = lineWidth;
    waveline.backgroundColor = [UIColor clearColor].CGColor;
    
    return waveline;
}

- (UIBezierPath *)generateBezierPathWithCenter:(CGPoint)center radius:(CGFloat)radius
{
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:2*M_PI clockwise:NO];
    
    return circlePath;
}

- (UIImageView *)firstCircle
{
    UIImageView *firstCircle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"circleBackground"]];
    firstCircle.layer.masksToBounds = YES;
    firstCircle.alpha = 1.0;
    
    return firstCircle;
}

#pragma mark -
#pragma mark -- Offscreen Rendering Operation
- (void)testShouldRastering {
    
}

- (void)testMasks {
    
}

- (void)testShodows {
    
}

- (void)testEdgeAntialiasing {
    
}

- (void)testGroupOpacity {
    
}

- (void)testCornerRadiusMaskToBounds {
    
}

- (void)testGradientLayer {
//    CGGradientView *view = [[CGGradientView alloc] initWithFrame:CGRectMake(0, 400, 200, 20)];
//    view.backgroundColor = [UIColor brownColor];
//    [self.view addSubview:view];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor yellowColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
    gradientLayer.locations = @[@0.3, @0.5, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = CGRectMake(0, 300, 300, 100);
    [self.view.layer addSublayer:gradientLayer];
}

- (void)testDrawRect {
    
}

@end
