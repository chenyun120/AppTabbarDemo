//
//  ViewController.m
//  AppTabbarDemo
//
//  Created by Chenyun on 15/8/25.
//  Copyright (c) 2015年 geek-zoo. All rights reserved.
//

#import "ViewController.h"
#import "AppTabbar.h"


@interface ViewController ()
@property (nonatomic, strong) AppTabbar * appTabbar;
@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];

	self.appTabbar = [AppTabbar sharedInstance];

	self.appTabbar.frame = CGRectMake(0, self.view.frame.size.height - 44, self.view.frame.size.width, 44);

	[self.appTabbar initView];

	self.appTabbar.whenSelectCell = ^( AppTabbarCell * cell){
//		self.selectIndex = cell.tag;
	};

	[self.view addSubview:self.appTabbar];
}

- (IBAction)showTabbar:(id)sender
{
	[self showTabbar];
}

- (IBAction)hideTabbar:(id)sender
{
	[self hideTabbar];
}

- (void)showTabbar
{
	CGRect tabbarFrame = self.appTabbar.frame;
	tabbarFrame.origin.y = self.view.frame.size.height - 49 + 1;
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.3];
	[UIView setAnimationDelay:0.2];
	[UIView setAnimationBeginsFromCurrentState:YES];
	
	self.appTabbar.frame = tabbarFrame;
	
	[UIView commitAnimations];
}

- (void)hideTabbar
{
	CGRect tabbarFrame = self.appTabbar.frame;
	tabbarFrame.origin.y = self.view.frame.size.height;
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.3];
	[UIView setAnimationDelay:0.2];
	[UIView setAnimationBeginsFromCurrentState:YES];

	self.appTabbar.frame = tabbarFrame;
	
	[UIView commitAnimations];
}

@end
