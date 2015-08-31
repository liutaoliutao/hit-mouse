//
//  TRMouse.m
//  打地鼠
//
//  Created by dlw on 15/8/7.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRMouse.h"

@implementation TRMouse

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor grayColor];
        self.frame=CGRectMake(arc4random()%290, arc4random()%500, 30,30);
        [self setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
         [self addTarget:self action:@selector(remove:) forControlEvents:UIControlEventTouchUpInside];
        [NSThread detachNewThreadSelector:@selector(titleText) toTarget:self withObject:nil];
       
    }return self;
}
-(void)titleText{
    for (int i=3; i>=0; i--) {
        [NSThread sleepForTimeInterval:0.5];
        [self performSelectorOnMainThread:@selector(showTitle:) withObject:@(i) waitUntilDone:NO];
        
    }
    [self removeFromSuperview];////////这个写在子线程中执行视图页面修改，后面没有耗时的代码
    
}
-(void)showTitle:(NSNumber*)num{ ///NSnumber 和int 有区别的
    [self setTitle:[NSString stringWithFormat:@"%@",num] forState:UIControlStateNormal];
   
    }
-(void)remove:(TRMouse *)mouse{
    
  

    [mouse removeFromSuperview];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"click" object:nil];
    
    
    
    
  
}


@end
