//
//  WJUser.h
//  百思不得姐
//
//  Created by wangju on 16/4/5.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJUser : NSObject

/** 用户的id */
@property (nonatomic,copy) NSString *id;

/** 用户的头像 */
@property (nonatomic,copy) NSString *profile_image;

/** 是否为vip */
@property (nonatomic,assign,getter=isVip) BOOL is_vip;

/** 性别 */
@property (nonatomic,copy) NSString *sex;

/** 用户名 */
@property (nonatomic,copy) NSString *username;

/** 用户的个人主页 */
@property (nonatomic,copy) NSString *personal_page;

@end
