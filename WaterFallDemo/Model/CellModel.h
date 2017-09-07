//
//  CellModel.h
//  WaterFallDemo
//
//  Created by Mac on 2017/9/7.
//  Copyright © 2017年 袁书辉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface CellModel : NSObject
@property (nonatomic, strong) NSURL *imageURL;
@property (nonatomic, assign) CGFloat imageW;
@property (nonatomic, assign) CGFloat imageH;

+ (instancetype)imageWithImageDic:(NSDictionary *)imageDic;
@end
