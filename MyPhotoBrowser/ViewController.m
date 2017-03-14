//
//  ViewController.m
//  MyPhotoBrowser
//
//  Created by apple on 17/3/14.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"
#import "MYPhotoBrowser.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *imgArr;
@property (nonatomic, strong) NSMutableArray *imageViewArr;
@property (nonatomic, strong) NSArray *handleArr;
@end

@implementation ViewController

- (NSMutableArray *)imageViewArr{
    if (!_imageViewArr) {
        _imageViewArr = [NSMutableArray array];
    }
    return _imageViewArr;
}

- (NSArray *)imgArr{
    if (!_imgArr) {
        _imgArr = [NSArray arrayWithObjects:@"ladder.jpeg",
                   @"blueSky.jpeg",
                   @"opensea.jpeg",
                   @"timg.jpeg",nil];
    }
    return _imgArr;
}

- (NSArray *)handleArr{
    if (!_handleArr) {
        _handleArr = [NSArray arrayWithObjects:@"发给朋友",@"收藏",@"保存图片", nil];
    }
    return _handleArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    for (NSInteger index = 0; index < 4; index ++) {
        NSInteger row   = index%2;
        NSInteger colum = index/2;
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake((self.view.frame.size.width - 310) / 2.0 + row *(150 + 10), 200 + colum *(150 + 10), 150, 150);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.userInteractionEnabled = YES;
        imageView.backgroundColor = [UIColor grayColor];
        [imageView setImage:[UIImage imageNamed:self.imgArr[index]]];
        [self.view addSubview:imageView];
        [self.imageViewArr addObject:imageView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click:)];
        [imageView addGestureRecognizer:tap];
    }

}

- (void)click:(UITapGestureRecognizer *)tap
{
    
    UIImageView *currentImageView = (UIImageView *)tap.view;
    NSInteger index = [self.imageViewArr indexOfObject:currentImageView];
    MYPhotoBrowser *photoBrowser = [[MYPhotoBrowser alloc]initWithUrls:self.imgArr imgViews:self.imageViewArr placeholder:nil currentIdx:index handleNames:self.handleArr callback:^(UIImage *handleImage,NSInteger handleType) {
        
        NSLog(@"-------------图片对象-%@----操作类型-%@",handleImage, self.handleArr[handleType]);
        
    }];
    [photoBrowser showWithAnimation:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
