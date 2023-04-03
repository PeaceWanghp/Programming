//
//  ALListReverseString.c
//  Programming
//
//  Created by heping wang on 2023/3/27.
//  Copyright © 2023 Peace. All rights reserved.
//

#include "ALListReverseString.h"

int plus1(int a, int b)
{
    int count = 0;
    
    if(a<=b){
        count = a + plus1(a+1,b);
    }

    return count;
}
