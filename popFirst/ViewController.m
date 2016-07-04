//
//  ViewController.m
//  popFirst
//  弹簧效果
//  Created by genilex3 on 16/7/4.
//  Copyright © 2016年 wei63w. All rights reserved.
//

#import "ViewController.h"
#import "POP.h"
@interface ViewController ()

@property (nonatomic, strong) UIView *customView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    
  
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    //    [self springCustom];
    
//    [self pageChange];
    
    [self CATransitionOne];
}


-(void)CATransitionOne{
    UIView *uv = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    uv.backgroundColor = [UIColor blueColor];
    [self.view addSubview:uv];
    
    CATransition *transition = [CATransition animation];
    transition.duration = 2.0f;
    /**
     *  kCATransitionPush 向上推   揭开
     *  kCATransitionFade   淡化
     *  kCATransitionMoveIn 向上推 推开
     *  kCATransitionReveal 向上推 覆盖
     *
     *  kCATransitionFromRight  效果方向从右开始
     *  kCATransitionFromLeft,kCATransitionFromTop,kCATransitionFromBottom
     *  cube
     *
     *
     */
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromRight;
    [self.view exchangeSubviewAtIndex:1 withSubviewAtIndex:0];
    [self.view.layer addAnimation:transition forKey:@"animation"];
    
}

/**
 *  改变坐标
 */
-(void)CATransitionCustom{
    UIView *movieView = [[UIView alloc]initWithFrame:CGRectMake(10, 180, 200, 40)];
    movieView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:movieView];
    
    
    [UIView animateWithDuration:3 animations:^{
        movieView.frame = CGRectMake(10, 270, 200, 40);
        
    }completion:^(BOOL finished) {
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 40, 40)];
        lab.backgroundColor = [UIColor yellowColor];
        [self.view addSubview:lab];
    }];
    
    
}







-(void)pageChange{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"改变" forState:UIControlStateNormal];
    btn.frame = CGRectMake(10, 10, 60, 40);
    [btn addTarget:self  action:@selector(changeUiView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
/**
 *  原地旋转门切换
 */
-(void)changeUiView{
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    /**
     *  UIViewAnimationTransitionFlipFromRight 原地旋转门切换
     *  UIViewAnimationTransitionCurlUp 向上翻书页
     *  UIViewAnimationTransitionCurlDown   向xia翻书页
     *  UIViewAnimationTransitionNone   无效果
     *  UIViewAnimationTransitionFlipFromLeft   原地旋转门切换
     */
    
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
    [UIView commitAnimations];
}






/**
 *  弹簧效果
 */
-(void)springCustom{
    CGFloat tempw = 100;
    CGFloat temph = 100;
    CGFloat tempx = [UIScreen mainScreen].bounds.size.width / 2 - tempw / 2;
    CGFloat tempy = [UIScreen mainScreen].bounds.size.height / 2 - temph / 2;
    
    self.customView = [[UIView alloc]initWithFrame:CGRectMake(tempx, tempy, tempw, temph)];
    self.customView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.customView];
    
    
    
    
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    //
    NSInteger height = CGRectGetHeight(self.view.bounds);
    //    NSInteger width = CGRectGetWidth(self.view.bounds);
    //
    //    CGFloat centerX = arc4random() % width;
    //    CGFloat centerY = arc4random() % height;
    
    CGFloat centerX = CGRectGetMaxX(self.customView.bounds);
    //    CGFloat tempY = CGRectGetMaxY(self.customView.bounds);
    
    
    CGFloat centerY = arc4random() % height;
    
    
    
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(centerX, centerY)];
    anim.springBounciness = 16;
    anim.springSpeed = 6;
    [self.customView pop_addAnimation:anim forKey:@"center"];
    
}





































@end
