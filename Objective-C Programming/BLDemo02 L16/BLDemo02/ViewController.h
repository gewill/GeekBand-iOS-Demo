//
//  ViewController.h
//  BLDemo02
//
//  Created by Will Ge on 8/3/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BLDragonViewDelegate.h"
#import "BLDragonView+Hide.h"

// ViewController conform the BLDragonViewDelegate
@interface ViewController : UIViewController <BLDragonViewDelegate>
{
    UILabel        *_dragonStatusLabel;
    BLDragonView   *_dragonView;
}


- (void)backButtonClicked:(BLDragonView *)dragonView;

- (void)forwardButtonClicked:(BLDragonView *)dragonView;


@end

