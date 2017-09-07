//
//  ViewController.m
//  WaterFallDemo
//
//  Created by Mac on 2017/9/7.
//  Copyright © 2017年 袁书辉. All rights reserved.
//

#import "YSHWaterFallyout.h"
#import "CellModel.h"
#import "CeshiCell.h"
#import "ViewController.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,YSHWaterFallyoutDelegate>

@property (weak, nonatomic) IBOutlet YSHWaterFallyout *waterFallyout;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray<CellModel *> *images;

@end

@implementation ViewController
- (NSMutableArray *)images {
    //从plist文件中取出字典数组，并封装成对象模型，存入模型数组中
    if (!_images) {
        _images = [NSMutableArray array];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"1.plist" ofType:nil];
        NSArray *imageDics = [NSArray arrayWithContentsOfFile:path];
        for (NSDictionary *imageDic in imageDics) {
            CellModel *image = [CellModel imageWithImageDic:imageDic];
            [_images addObject:image];
        }
    }
    return _images;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.images.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath

{
    CeshiCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CeshiCell" forIndexPath:indexPath];
    cell.imageURL = self.images[indexPath.item].imageURL;
    return cell;
}

//根据item的宽度与indexPath计算每一个item的高度
- (CGFloat)waterfallLayout:(YSHWaterFallyout *)waterfallLayout itemHeightForWidth:(CGFloat)itemWidth atIndexPath:(NSIndexPath *)indexPath {
    //根据图片的原始尺寸，及显示宽度，等比例缩放来计算显示高度
    CellModel *image = self.images[indexPath.item];
    return image.imageH / image.imageW * itemWidth;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
