//
//  AppTabbar
//  yichao
//
//  Created by Chenyun on 15/4/1.
//  Copyright (c) 2015年 geek-zoo. All rights reserved.
//

#import "AppTabbar.h"

@interface AppTabbar ()
@property (nonatomic, strong) UIView * topLine;
//@property (nonatomic, strong) UIView * bg;
@property (nonatomic, strong) NSMutableArray * views;
@property (nonatomic, strong) NSArray * titleArray;
@property (nonatomic, strong) NSArray * imageArray;
@end

@implementation AppTabbar

+ (AppTabbar *)sharedInstance
{
	static dispatch_once_t onceToken;
	static AppTabbar * sharedInstance;
	
	dispatch_once(&onceToken, ^{
		sharedInstance = [[AppTabbar alloc] init];
	});

	return sharedInstance;
}

- (instancetype)init
{
	self = [super init];

	if ( self )
	{
		// 顶部线
		self.topLine = [[UIView alloc] init];
		self.topLine.backgroundColor = [UIColor blackColor];
		self.topLine.alpha = 0.2;
		[self addSubview:self.topLine];

		self.views = [NSMutableArray array];

		self.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1];
	}

	return self;
}

- (void)initView
{
	self.titleArray = @[@"首页",@"医院",@"日租房",@"个人"];
	self.imageArray = @[@"tabbar_0",@"tabbar_1",@"tabbar_2",@"tabbar_3"];

	CGFloat buttonWidth = self.frame.size.width / self.titleArray.count;
	CGFloat buttonHeight = self.frame.size.height;

	for ( int i = 0; i < self.titleArray.count; i++ )
	{
		AppTabbarCell * cell = [[AppTabbarCell alloc] initWithFrame:CGRectMake( i*buttonWidth, 0, buttonWidth, buttonHeight )];
		cell.tag = i;
		__weak AppTabbar * weakSelf = self;
		cell.whenSetBg = ^(AppTabbarCell * send){
			if ( weakSelf.whenSelectCell )
			{
				weakSelf.whenSelectCell(send);
				[self selectView:send.tag];
			}
		};

		[cell initViewWithTitle:self.titleArray[i] imageName:self.imageArray[i]] ;
		[self addSubview:cell];

		[self.views addObject:cell];
	}

	[self selectView:0];
}

- (void)layoutSubviews
{
	self.topLine.frame = CGRectMake(0, 0, self.frame.size.width, 1);
}

- (void)unSelectAll
{
	for ( AppTabbarCell * cell  in self.views )
	{
		[cell unSelectStatus];
	}
}

- (void)selectView:(NSInteger)tag
{
	[self unSelectAll];
	AppTabbarCell * cell = self.views[tag];
	[cell selectStatus];
}

@end
