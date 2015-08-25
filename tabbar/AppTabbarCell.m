//
//  AppTabbarCell.m
//  yichao
//
//  Created by Chenyun on 15/4/1.
//  Copyright (c) 2015年 geek-zoo. All rights reserved.
//

#import "AppTabbarCell.h"

@interface AppTabbarCell ()

@property (nonatomic, strong) UIButton * button;
@property (nonatomic, strong) UIImageView * imageView;
@property (nonatomic, strong) UILabel * label;

@end

@implementation AppTabbarCell

- (void)initViewWithTitle:(NSString *)title imageName:(NSString *)imageName
{
	self.button = [UIButton buttonWithType:UIButtonTypeCustom];
	self.button.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
	[self.button addTarget:self action:@selector(updataView:) forControlEvents:UIControlEventTouchUpInside];

	[self addSubview:self.button];

	self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake( self.button.frame.size.width/2 - 13, 4, 26, 26 )];
	self.imageView.image = [UIImage imageNamed:imageName];
	[self.button addSubview:self.imageView];

	self.label = [[UILabel alloc] initWithFrame:CGRectMake( 0, self.button.frame.size.height  - 18, self.button.frame.size.width, 13 )];
	self.label.text = title;
	self.label.font = [UIFont systemFontOfSize:13];
	self.label.textAlignment = NSTextAlignmentCenter;
	self.label.textColor = [UIColor grayColor];

	[self.button addSubview:self.label];
}

- (void)updataView:(UIButton *)send
{
	if ( self.whenSetBg )
	{
		self.whenSetBg(self);
	}
}

- (void)selectStatus
{
	NSString * selectImageName = [NSString stringWithFormat:@"tabbar_sel_%ld",self.tag];

	self.imageView.image = [UIImage imageNamed:selectImageName];
	self.label.textColor = [UIColor redColor];
}

- (void)unSelectStatus
{
	NSString * imageName = [NSString stringWithFormat:@"tabbar_%ld",self.tag];
	self.imageView.image = [UIImage imageNamed:imageName];
	self.label.textColor = [UIColor grayColor];
}

@end
