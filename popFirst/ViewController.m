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
    CGFloat tempw = 100;
    CGFloat temph = 100;
    CGFloat tempx = [UIScreen mainScreen].bounds.size.width / 2 - tempw / 2;
    CGFloat tempy = [UIScreen mainScreen].bounds.size.height / 2 - temph / 2;

    
    
    self.customView = [[UIView alloc]initWithFrame:CGRectMake(tempx, tempy, tempw, temph)];
    self.customView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.customView];
    
  
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
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
