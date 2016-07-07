//
//  ViewController.m
//  popFirst
//
//  Created by genilex3 on 16/7/4.
//  Copyright © 2016年 wei63w. All rights reserved.
//

#import "ViewController.h"
#import "POP.h"
//#import "CustomView.h"
@interface ViewController (){
    
    CGFloat tempw ;
    CGFloat temph ;
    CGFloat tempx ;
    CGFloat tempy ;
}

@property (nonatomic, strong) UIView *customView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    tempw = 100;
    temph = 100;
    tempx = [UIScreen mainScreen].bounds.size.width / 2 - tempw / 2;
    tempy = [UIScreen mainScreen].bounds.size.height / 2 - temph / 2;
    self.customView.layer.cornerRadius =  tempw;
    
    self.customView = [[UIView alloc]initWithFrame:CGRectMake(tempx, tempy, tempw, temph)];
    self.customView.backgroundColor = [UIColor redColor];
    self.customView.layer.cornerRadius = tempw / 2;
    [self.view addSubview:self.customView];
  
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self popOne];
    [self popTwo];
    
}

-(void)popTwo{
    //1.Spring动画可以用来给对象一个令人愉悦的弹跳效果
    
//    POPSpringAnimation *anima = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
//    anima.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 400, 400)];
//    
//    [self.customView.layer pop_addAnimation:anima forKey:@"size"];

    
    //2.Decay动画能用于逐渐减慢一个对象直至停止
//    POPDecayAnimation *anim = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionX];
//    anim.velocity = @(1000.);
//    [self.customView.layer pop_addAnimation:anim forKey:@"slide"];
    
    
    //3.基本动画能用于在指定的时间段插入值。使用一个淡入淡出动画在默认时间段将视图的透明度从0.0设置为1.0。----报错
//    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
//    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    anim.fromValue = @(0.0);
//    anim.toValue = @(1.0);
//    [self.customView.layer pop_addAnimation:anim forKey:@"slide"];
    
    
    
    
}






/**
 *  果冻回弹效果
 */
-(void)popOne{
   
    
    
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    //
    NSInteger height = CGRectGetHeight(self.view.bounds);
    //    NSInteger width = CGRectGetWidth(self.view.bounds);
    //
    //    CGFloat centerX = arc4random() % width;
    //    CGFloat centerY = arc4random() % height;
    
    CGFloat centerX = CGRectGetMaxX(self.customView.bounds);
    CGFloat tempY = CGRectGetMaxY(self.customView.bounds);
    
    
    CGFloat centerY = arc4random() % height;
    
    
    
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(centerX, centerY)];
    anim.springBounciness = 16;
    anim.springSpeed = 6;
    [self.customView pop_addAnimation:anim forKey:@"center"];
    
    
    
    
}































@end
