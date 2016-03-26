//
//  WJConstant.h
//  百思不得姐
//
//  Created by wangju on 16/3/23.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    WJTopeTypeAll = 1,
    WJTopeTypeVideo = 41,
    WJTopeTypePicture = 10,
    WJTopeTypeSound = 31,
    WJTopeTypeWord = 29
    
}WJTopicType;

UIKIT_EXTERN CGFloat const WJTitleViewHeight;

UIKIT_EXTERN CGFloat const WJTopicTextX;
UIKIT_EXTERN CGFloat const WJTopicBottonHeight;
UIKIT_EXTERN CGFloat const WJTopicMargin;
/**
 *  精华cell里面图片帖子的最大高度
 */
UIKIT_EXTERN CGFloat const WJTopicPictureMaxHeight;
/**
 *  精华cell里面图片帖子的大图压缩后的图片高度
 */
UIKIT_EXTERN CGFloat const WJTopicPictureNormalHeight;




