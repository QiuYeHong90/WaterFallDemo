//
//  CellModel.m
//  WaterFallDemo
//
//  Created by Mac on 2017/9/7.
//  Copyright © 2017年 袁书辉. All rights reserved.
//

#import "CellModel.h"

@implementation CellModel
+ (instancetype)imageWithImageDic:(NSDictionary *)imageDic {
    CellModel *image = [[CellModel alloc] init];
    image.imageURL = [NSURL URLWithString:imageDic[@"img"]];
    image.imageW = [imageDic[@"w"] floatValue];
    image.imageH = [imageDic[@"h"] floatValue];
    return image;
}
@end
