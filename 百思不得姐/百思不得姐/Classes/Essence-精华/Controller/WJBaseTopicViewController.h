//
//  WJBaseTopicViewController.h
//  百思不得姐
//
//  Created by wangju on 16/3/24.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    WJTopeTypeAll = 1,
    WJTopeTypeVideo = 41,
    WJTopeTypePicture = 10,
    WJTopeTypeSound = 31,
    WJTopeTypeWord = 29

}WJTopicType;

@interface WJBaseTopicViewController : UITableViewController

- (WJTopicType)type;

@end
