//
//  BLThreeViewController.m
//  BLDemo03
//
//  Created by Will Ge on 7/29/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "BLThreeViewController.h"

@interface BLThreeViewController ()

@end

@implementation BLThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"three";
    self.bgImageView.image = [UIImage imageNamed:@"bg3"];
    
    // add _scrollView
    CGFloat scrollViewWidth = self.view.frame.size.width - 20;
    CGFloat scrollViewHeight = self.view.frame.size.height - 10 - 49 - 37;
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 10, scrollViewWidth, scrollViewHeight)];
    _scrollView.backgroundColor = [UIColor colorWithRed:0.8493 green:0.1182 blue:0.0 alpha:0.0];
    _scrollView.contentSize = CGSizeMake(scrollViewWidth * 5, scrollViewHeight);
    _scrollView.pagingEnabled = YES;
    _scrollView.maximumZoomScale = 3;
    _scrollView.minimumZoomScale = 0.5;
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    
    // add _contentView
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, scrollViewWidth * 5, scrollViewHeight)];
    [_scrollView addSubview:_contentView];
    
    for (int i = 0; i < 5; i++) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake( i * scrollViewWidth, 0, scrollViewWidth, scrollViewHeight)];
        
        NSString *imageName = [NSString stringWithFormat:@"bg%i.png", i +1 ];
        UIImage *image = [UIImage imageNamed:imageName];
        imageView.image = image;
        
        [_contentView addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(i * scrollViewWidth, 0, scrollViewWidth, scrollViewHeight)];
        label.font = [UIFont boldSystemFontOfSize:100];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = [NSString stringWithFormat:@"%i", i + 1];
        [_contentView addSubview:label];

    }
    
    
    // add _pageControl
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(10, _scrollView.frame.origin.y + scrollViewHeight - 80, scrollViewWidth, 37)];
    _pageControl.numberOfPages = 5;
    _pageControl.backgroundColor = [UIColor colorWithRed:0.9716 green:0.9965 blue:0.9031 alpha:0.13];
    [_pageControl addTarget:self
                     action:@selector(pageControlClicked:)
           forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_pageControl];
    
    
}

#pragma amrk - UIScrollViewDelegate methods

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _contentView;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat width = self.view.frame.size.width;
    CGFloat scrollViewWidth = width - 20;
    _pageControl.currentPage = scrollView.contentOffset.x / scrollViewWidth;
}


#pragma mark - Custom UIPageControl methods

- (void)pageControlClicked:(UIPageControl *)pageControl {
    CGFloat width = self.view.frame.size.width;
    CGFloat scrollViewWidth = width - 20;
    [_scrollView setContentOffset:CGPointMake(pageControl.currentPage * scrollViewWidth, 0) animated:YES];
}

#pragma mark - Memory management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
