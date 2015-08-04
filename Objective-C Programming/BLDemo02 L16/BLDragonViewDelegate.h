//
//  BLDragonViewDelegate.h
//  BLDemo02
//
//  Created by Will Ge on 8/4/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BLDragonView;

@protocol BLDragonViewDelegate <NSObject>

@optional
- (void)backButtonClicked:(BLDragonView *)dragonView;

@required
- (void)forwardButtonClicked:(BLDragonView *)dragonView;


@end
