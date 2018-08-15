//
//  ViewController.m
//  transform
//
//  Created by Ben Lv on 2018/8/15.
//  Copyright © 2018年 avatar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDefaultAnchorPointforView:self.btn];
    [NSTimer scheduledTimerWithTimeInterval:0.5 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [UIView animateWithDuration:2.5 animations:^{
            self.btn.transform = CGAffineTransformRotate(self.btn.transform, M_PI);
//            self.btn.transform = CGAffineTransformScale(self.btn.transform, 1.1, 1.1);
        }];
    }];
    
}


- (IBAction)rotate {
    [UIView animateWithDuration:2.5 animations:^{
        self.btn.transform = CGAffineTransformRotate(self.btn.transform, M_PI);
        self.btn.transform = CGAffineTransformScale(self.btn.transform, 1.1, 1.1);
    }];
    
   
    
}

- (IBAction)scale {
    self.btn.transform = CGAffineTransformScale(self.btn.transform, 1.5, 1.5);
}

- (IBAction)goback {
    self.btn.transform = CGAffineTransformIdentity;
}

- (IBAction)move {
    self.btn.transform = CGAffineTransformTranslate(self.btn.transform, 10, 10);
//    self.btn.transform = CGAffineTransformMakeTranslation(10, 10);
}

- (void)setAnchorPoint:(CGPoint)anchorPoint forView:(UIView *)view {
    
    CGPoint oldOrigin = view.frame.origin;
    view.layer.anchorPoint = anchorPoint;
    CGPoint newOrigin = view.frame.origin;
    
    CGPoint transition;
    transition.x = newOrigin.x - oldOrigin.x;
    transition.y = newOrigin.y - oldOrigin.y;
    
    view.center = CGPointMake (view.center.x - transition.x, view.center.y - transition.y);
}

- (void)setDefaultAnchorPointforView:(UIView *)view {
    
    [self setAnchorPoint:CGPointMake(0, 0) forView:view];
}

@end
