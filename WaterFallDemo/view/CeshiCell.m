//
//  yshCollecCell.m
//  WaterFallDemo
//
//  Created by Mac on 2017/9/7.
//  Copyright © 2017年 袁书辉. All rights reserved.
//
#import <UIImageView+WebCache.h>
#import "CeshiCell.h"

@implementation CeshiCell
- (void)setImageURL:(NSURL *)imageURL {
    _imageURL = imageURL;
    [self.imageView sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"placeholder"]];
}
@end
