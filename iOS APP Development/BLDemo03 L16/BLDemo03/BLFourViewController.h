//
//  BLFourViewController.h
//  BLDemo03
//
//  Created by Will Ge on 7/29/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BLBaseViewController.h"

@interface BLFourViewController : BLBaseViewController <UIWebViewDelegate>
{
    UIWebView                *_webView;
    UIActivityIndicatorView  *_activityView;
    
}
@end
