//
//  ViewController.m
//  打地鼠
//
//  Created by dlw on 15/8/7.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "TRMouse.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *allMouse;
@property (weak, nonatomic) IBOutlet UILabel *beKelledMouse;
@property(nonatomic)NSInteger integer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [NSThread detachNewThreadSelector:@selector(createMouse) toTarget:self withObject:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(kelledMouse) name:@"click" object:nil];
    UILabel *label = [[UILabel alloc]init];
    label.text  = @"w我是一个";
    label.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:label];
}

-(void)kelledMouse{
   int  num = [self.beKelledMouse.text intValue];
    self.beKelledMouse.text = [NSString stringWithFormat:@"%d",num+1];
    
}
-(void)createMouse{
    for (int i=0; i<100;i++) {
        [NSThread sleepForTimeInterval:1];
        TRMouse * mouse = [[TRMouse  alloc]init];
        [NSThread detachNewThreadSelector:@selector(updateUI:) toTarget:self withObject:mouse];
        
    }
}

-(void)updateUI:(TRMouse *)mouse{
    self.integer++;
    [self.view addSubview:mouse];
    self.allMouse.text = [NSString stringWithFormat:@"%ld",self.integer];
    
}












@end
