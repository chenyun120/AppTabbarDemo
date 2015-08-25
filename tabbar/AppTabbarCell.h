//
//  AppTabbarCell.h
//  yichao
//
//  Created by Chenyun on 15/4/1.
//  Copyright (c) 2015年 geek-zoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppTabbarCell : UIView
@property (nonatomic, copy) void (^whenSetBg)( id );
- (void)initViewWithTitle:(NSString *)title imageName:(NSString *)imageName;

- (void)selectStatus;
- (void)unSelectStatus;

@end
