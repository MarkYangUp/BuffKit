//
//  LoopViewController.m
//  BuffDemo
//
//  Created by BoWang(r4l.xyz) on 16/6/28.
//  Copyright © 2016年 BoWang(r4l.xyz). All rights reserved.
//

#import "LoopViewController.h"

@interface LoopViewController ()

@end

@implementation LoopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];

    NSMutableArray *btnArr=[NSMutableArray new];
    
    for (int i=0; i<2; i++) {
        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 220)];
        [btn setTitle:[NSString stringWithFormat:@"Button:%d",i] forState:UIControlStateNormal];
        UIImage *img=[UIImage imageNamed:[NSString stringWithFormat:@"loop%d.jpg",i+1]];
        [btn setBackgroundImage:img forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(loopViewClickAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTag:i];
        [btnArr addObject:btn];
    }
    bfLoopView=[BFLoopView loopViewWithItems:btnArr frame:CGRectMake(0, 64, self.view.width, 220) loopPeriod:4 animationDuration:1 animationStyle:BuffLoopViewAnimationStyleEasyInOut indexChanged:^(NSInteger loopIndex) {
    }];
    [self.view addSubview:bfLoopView];
    [bfLoopView setShouldAnimation:YES];
    
    // Do any additional setup after loading the view.
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [bfLoopView setShouldAnimation:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    
}
-(void)loopViewClickAction:(UIButton *)sender{
    NSLog(@"Tag:%d",sender.tag);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
