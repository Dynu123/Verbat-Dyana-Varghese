//
//  ViewController.m
//  GIF
//
//  Created by Integralsoft on 5/15/17.
//  Copyright © 2017 Integralsoft. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>
#import <ImageIO/ImageIO.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController ()
{
    UIView *Mainview;
    UIView *view;
    UIView *view1;
}

@end

@implementation ViewController


#pragma mark - VIewFunctions
- (void)viewDidLoad {
    Mainview = [[UIView alloc] initWithFrame:CGRectMake(100, 200, self.view.frame.size.width-200, self.view.frame.size.height-400)];
    Mainview.backgroundColor = [UIColor whiteColor];
    [self setBorders:Mainview];
    [self.view addSubview:Mainview];
    [self rotate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Methods
-(void)rotate
{
    Mainview.backgroundColor = [UIColor colorWithRed:168.0/255.0 green:42.0/255.0 blue:33.0/255.0 alpha:1.0];
    [UIView animateWithDuration:2.0f animations:^{
                        view1 = nil;
                        view = [[UIView alloc] initWithFrame:CGRectMake(100, 200, self.view.frame.size.width-200, self.view.frame.size.height-400)];
                        view.backgroundColor = [UIColor redColor];
                        [self setBorders:view];
                        [self.view addSubview:view];
                        view.transform = CGAffineTransformMakeRotation(-M_PI/2);
                        view.frame = CGRectMake(-self.view.frame.size.width-200, 200, self.view.frame.size.width-200, self.view.frame.size.height-400);
                     }completion:^(BOOL finished){
                                Mainview.backgroundColor = [UIColor whiteColor];
                                [UIView animateWithDuration:3.0f animations:^{
                                view = nil;
                                view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 200, self.view.frame.size.width-200, self.view.frame.size.height-400)];
                                view1.backgroundColor = [UIColor colorWithRed:168.0/255.0 green:42.0/255.0 blue:33.0/255.0 alpha:1.0];
                                [self setBorders:view1];
                                [self.view addSubview:view1];
                                view1.transform = CGAffineTransformMakeRotation(M_PI/2);
                                view1.frame = CGRectMake(self.view.frame.size.width+200, 200, self.view.frame.size.width-200, self.view.frame.size.height-400);
                                }completion:^(BOOL finished){
                                        // call the same function again.
                                        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(rotate) object:nil];
                                        [self performSelector:@selector(rotate) withObject:nil afterDelay:0.0f];
                                }];
                     }];
}

-(void)setBorders : (UIView *)onView{
    onView.layer.shadowColor = [UIColor blackColor].CGColor;
    onView.layer.shadowOpacity = 0.4;
    onView.layer.shadowOffset = CGSizeMake(0, 0);
    onView.layer.cornerRadius = 10.0f;
}



@end


