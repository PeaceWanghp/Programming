//
//  CUContentModeViewController.m
//  Programming
//
//  Created by wangheping on 2021/5/11.
//  Copyright © 2021 Peace. All rights reserved.
//

#import "CUContentModeViewController.h"

@interface CUContentModeViewController ()
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UIView *framView;
@end

@implementation CUContentModeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGRect rect = CGRectMake(50, 220, 187, 300);
    
    self.framView = [[UIView alloc] initWithFrame:rect];
    self.framView.backgroundColor = [UIColor blueColor];
//    self.framView.layer.borderColor = [UIColor blackColor].CGColor;
//    self.framView.layer.borderWidth = 1;
    [self.view addSubview:self.framView];
    
    self.imageView = [[UIImageView alloc] initWithFrame:rect];
    self.imageView.backgroundColor = [UIColor redColor];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.clipsToBounds = YES;
    [self.imageView setImage:[UIImage imageNamed:@"912f77f36e0c4b13a761fa46af0ec674.jpg"]];
    [self.view addSubview:self.imageView];
    
    NSLog(@"----%@",NSStringFromCGRect(self.imageView.layer.contentsRect));
    NSLog(@"----%@",NSStringFromCGRect(self.imageView.frame));
    
//    self.imageView.layer.contentsRect = CGRectMake(0, -0.2, 1, 1);
    [self updateImageViewContentsRect];
    
    NSLog(@"----%@",NSStringFromCGRect(self.imageView.layer.contentsRect));
    NSLog(@"====%@",NSStringFromCGRect(self.imageView.frame));
}

- (void)buttonAction:(UIButton *)sender {
    if (sender.tag == 1) {
        
    }
    else if (sender.tag == 2) {
        
    }
    else if (sender.tag == 3) {
        
    }
    else if (sender.tag == 4) {
        
    }
}

- (void)updateImageViewContentsRect {
    CGRect imageViewContentsRect = CGRectMake(0, 0, 1, 1);

        CGRect imageViewBounds = self.imageView.bounds;
        CGSize imageSize = self.imageView.image.size;

//        CGFloat imageViewFactor = imageViewBounds.size.width / imageViewBounds.size.height;
        CGFloat imageFactor = imageSize.width / imageSize.height;

//        if (imageFactor > imageViewFactor) {
            //Image is wider than the view, so height will match
//            CGFloat scaledImageWidth = imageViewBounds.size.height * imageFactor;
//            CGFloat xOffset = 0.0;
//            if (BM_CONTAINS_BIT(self.alignmentMode, AHTImageAlignmentModeLeft)) {
//                xOffset = -(scaledImageWidth - imageViewBounds.size.width) / 2;
//            } else if (BM_CONTAINS_BIT(self.alignmentMode, AHTImageAlignmentModeRight)) {
//                xOffset = (scaledImageWidth - imageViewBounds.size.width) / 2;
//            }
//            imageViewContentsRect.origin.x = (xOffset / scaledImageWidth);
//        }
//        else if (imageFactor < imageViewFactor) {
            CGFloat scaledImageHeight = imageViewBounds.size.width / imageFactor;

            CGFloat yOffset = 0.0;
//            if (BM_CONTAINS_BIT(self.alignmentMode, AHTImageAlignmentModeTop)) {
                yOffset = -(scaledImageHeight - imageViewBounds.size.height) / 2;
//            } else if (BM_CONTAINS_BIT(self.alignmentMode, AHTImageAlignmentModeBottom)) {
//                yOffset = (scaledImageHeight - imageViewBounds.size.height) / 2;
//            }
            imageViewContentsRect.origin.y = (yOffset / scaledImageHeight);
//        }
    
    self.imageView.layer.contentsRect = imageViewContentsRect;
}

@end
