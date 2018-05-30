//
//  ViewController.m
//  RXQCoreAnimation
//
//  Created by Shevchenko on 2018/5/30.
//  Copyright © 2018年 Shevchenko. All rights reserved.
//

#import "ViewController.h"
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
#define WEAKSELF __weak typeof(self) weakSelf = self

@interface ViewController ()<CAAnimationDelegate>
@property (nonatomic, strong) UIView *demoView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat myViewWidth = 100;
    CGFloat myViewHeight = 100;
    CGFloat myViewX = (SCREENWIDTH - myViewWidth) / 2;
    CGFloat myViewY = (SCREENWIDTH - myViewHeight) / 3;
    self.demoView = [[UIView alloc] initWithFrame:CGRectMake(myViewX, myViewY, myViewWidth, myViewHeight)];
    [self.view addSubview:_demoView];
    self.demoView.backgroundColor = [UIColor greenColor];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    /*Core Animation调用
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setFromValue:[NSValue valueWithCGPoint:CGPointMake(0, SCREENHEIGHT/2 - 75)]];
    [animation setToValue:[NSValue valueWithCGPoint:CGPointMake(SCREENWIDTH, SCREENHEIGHT/2 - 75)]];
    [animation setDuration:1.0f];
    [animation setFillMode:kCAFillModeRemoved];
    [self.demoView.layer addAnimation:animation forKey:@"positionAnimation"];
     */
    
    /*代码块调用
    [_demoView setFrame:CGRectMake(0, SCREENHEIGHT / 2 - 50, 100, 100)];
    [UIView animateWithDuration:1.0f animations:^{
        [self.demoView setFrame:CGRectMake(SCREENWIDTH, SCREENHEIGHT / 2 - 50, 100, 100)];
    } completion:^(BOOL finished) {
        [self.demoView setFrame:CGRectMake(SCREENWIDTH / 2 - 50, SCREENHEIGHT / 2 - 50, 100, 100)];
    }];
     */
    
    /* begin commit 模式
    [_demoView setFrame:CGRectMake(0, SCREENHEIGHT / 2 - 50, 100, 100)];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0f];
    [_demoView setFrame:CGRectMake(SCREENWIDTH, SCREENHEIGHT / 2 - 50, 100, 100)];
    [UIView commitAnimations];
     */
    
    /* 透明度动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    [animation setFromValue:[NSNumber numberWithFloat:1.0f]];
    [animation setToValue:[NSNumber numberWithFloat:0.1f]];
    [animation setDuration:1.0f];
    [_demoView.layer addAnimation:animation forKey:@"opacityAnimation"];
     */
    
    /*缩放动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [animation setFromValue:[NSNumber numberWithFloat:2.0]];
    [animation setToValue:[NSNumber numberWithFloat:1.0f]];
    [animation setDuration:1.0f];
    [_demoView.layer addAnimation:animation forKey:@"scaleAnimation"];
     */
    
    /*旋转动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//    [animation setFromValue:[NSNumber numberWithFloat:M_PI]];
    [animation setToValue:[NSNumber numberWithFloat:3*M_PI]];
    [animation setDuration:1.0f];
    [_demoView.layer addAnimation:animation forKey:@"rotateAnimation"];
     */
    
    /* 渐变动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    [animation setToValue:(id)[UIColor redColor].CGColor];
    [animation setDuration:4.0f];
    [_demoView.layer addAnimation:animation forKey:@"backgroundAnimation"];
     */
    
    /* 关键帧动画
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(0, SCREENHEIGHT / 2 - 50)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(SCREENWIDTH/3, SCREENHEIGHT/2-50)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(SCREENWIDTH/3, SCREENHEIGHT/2+50)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(SCREENWIDTH*2/3, SCREENHEIGHT/2+50)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(SCREENWIDTH*2/3, SCREENHEIGHT/2-50)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(SCREENWIDTH, SCREENHEIGHT/2-50)];
    [animation setValues:[NSArray arrayWithObjects:value0,value1,value2,value3,value4,value5, nil]];
    [animation setDuration:2.0f];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName :kCAMediaTimingFunctionEaseOut]];
    [animation setDelegate:self];
    [_demoView.layer addAnimation:animation forKey:@"keyFrameAnimation"];
     */
    
    /* path动画
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(SCREENWIDTH / 2 - 100, SCREENHEIGHT / 2 - 100, 200, 200)];
    [animation setPath:path.CGPath];
    [animation setDuration:2.0f];
    [_demoView.layer addAnimation:animation forKey:@"pathAnimation"];
    */
    
    /*
    // 位移动画
    CAKeyframeAnimation *anima1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(0, SCREENHEIGHT/2-50)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(SCREENWIDTH/3, SCREENHEIGHT/2-50)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(SCREENWIDTH/3, SCREENHEIGHT/2+50)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(SCREENWIDTH*2/3, SCREENHEIGHT/2+50)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(SCREENWIDTH*2/3, SCREENHEIGHT/2-50)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(SCREENWIDTH, SCREENHEIGHT/2-50)];
    anima1.values = [NSArray arrayWithObjects:value0,value1,value2,value3,value4,value5, nil];
    
    //缩放动画
    CABasicAnimation *anima2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anima2.fromValue = [NSNumber numberWithFloat:0.8f];
    anima2.toValue = [NSNumber numberWithFloat:2.0f];
    
    //旋转动画
    CABasicAnimation *anima3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anima3.toValue = [NSNumber numberWithFloat:M_PI*4];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = [NSArray arrayWithObjects:anima1,anima2,anima3,nil];
    [group setDuration:4.0f];
    [_demoView.layer addAnimation:group forKey:@"groupAnimation"];
     */
    
    [UIView beginAnimations:@"postion" context:nil];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:_demoView cache:YES];
    [_demoView setFrame:CGRectMake(SCREENWIDTH / 2 - 50, SCREENHEIGHT / 2 - 50, 100, 100)];
    [UIView commitAnimations];
    
}

- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"动画开始了");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSLog(@"动画结束了");
}

- (void)pasueLayer:(CALayer *) layer {
    CFTimeInterval pauseTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    [layer setSpeed:0.0];
    [layer setTimeOffset:pauseTime];
}

- (void)resumeLayer:(CALayer *) layer {
    CFTimeInterval pausedTime = layer.timeOffset;
    [layer setSpeed:1.0];
    [layer setTimeOffset:0.0];
    [layer setBeginTime:0.0];
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    [layer setBeginTime:timeSincePause];
    
}
- (IBAction)pause:(id)sender {
    [self pasueLayer:self.demoView.layer];
}
- (IBAction)restart:(id)sender {
    [self resumeLayer:self.demoView.layer];
}


@end
