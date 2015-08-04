//
//  BLDragonView+Hide.m
//  BLDemo02
//
//  Created by Will Ge on 8/4/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "BLDragonView+Hide.h"

@implementation BLDragonView (Hide)

- (void)hideOrShow {
    self.dragonImageView.hidden = !self.dragonImageView.hidden;
}

@end
