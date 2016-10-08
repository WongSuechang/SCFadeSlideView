//
//  ViewController.m
//  SCFadeSlideViewDemo
//
//  Created by WongSuechang on 2016/10/8.
//  Copyright © 2016年 suechang. All rights reserved.
//

#import "ViewController.h"
#import "SCSlidePageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //添加新的view
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    SCFadeSlideView *slideView = [[SCFadeSlideView alloc] initWithFrame:CGRectMake(0, 0, width, 400)];
    slideView.backgroundColor = [UIColor redColor];
    slideView.delegate = self;
    slideView.datasource = self;
    slideView.minimumPageAlpha = 0.4;
    slideView.minimumPageScale = 0.85;
    
    slideView.orginPageCount = 4;
    slideView.orientation = SCFadeSlideViewOrientationHorizontal;
    
    /****************************
     使用导航控制器(UINavigationController)
     如果控制器中不存在UIScrollView或者继承自UIScrollView的UI控件
     请使用UIScrollView作为NewPagedFlowView的容器View,才会显示正常,如下
     *****************************/
    
    //    UIScrollView *bottomScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    //    [bottomScrollView addSubview:slideView];
    //
    //    [self.view addSubview:bottomScrollView];
    [self.view addSubview:slideView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - SCFadeSlideView delegate
- (CGSize)sizeForPageInSlideView:(SCFadeSlideView *)slideView {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    return CGSizeMake(width-84, 400);
}

#pragma mark - SCFadeSlideView datasource
- (NSInteger)numberOfPagesInSlideView:(SCFadeSlideView *)slideView {
    return 4;
}

- (UIView *)slideView:(SCFadeSlideView *)slideView cellForPageAtIndex:(NSInteger)index {
    SCSlidePageView *pageView = (SCSlidePageView *)[slideView dequeueReusableCell];
    if (!pageView) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        pageView = [[SCSlidePageView alloc] initWithFrame:CGRectMake(0, 0, width - 84, 400)];
        pageView.layer.cornerRadius = 4;
        pageView.layer.masksToBounds = YES;
        switch (index) {
            case 0:
                pageView.backgroundColor = [UIColor blackColor];
                break;
            case 1:
                pageView.backgroundColor = [UIColor whiteColor];
                break;
            case 2:
                pageView.backgroundColor = [UIColor grayColor];
                break;
            case 3:
                pageView.backgroundColor = [UIColor greenColor];
                break;
            default:
                break;
        }
        
    }
    return pageView;
}
- (void)didScrollToPage:(NSInteger)pageNumber inSlideView:(SCFadeSlideView *)slideView {
    
    NSLog(@"ViewController 滚动到了第%ld页",(long)pageNumber);
}
@end
