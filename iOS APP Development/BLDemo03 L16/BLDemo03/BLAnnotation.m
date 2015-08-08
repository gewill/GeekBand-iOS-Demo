//
//  BLAnnotaton.m
//  BLDemo03
//
//  Created by Will Ge on 8/4/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "BLAnnotation.h"

@implementation BLAnnotation

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title subtitle:(NSString *)subtitle index:(NSInteger)index {
    
    self = [super init];
    
    if (self) {
        self.coordinate = coordinate;
        self.title = title;
        self.subtitle = subtitle;
        self.index = index;
    }
    
    return self;
}

@end
