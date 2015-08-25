//
//  AppTabbar
//  yichao
//
//  Created by Chenyun on 15/4/1.
//  Copyright (c) 2015年 geek-zoo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppTabbarCell.h"

@interface AppTabbar : UIView

@property (nonatomic, copy) void (^whenSelectCell)( id );

+ (AppTabbar *)sharedInstance;

- (void)initView;

- (void)unSelectAll;
- (void)selectView:(NSInteger)tag;

@end