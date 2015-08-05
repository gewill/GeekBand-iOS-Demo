//
//  BLFiveViewController.h
//  BLDemo03
//
//  Created by Will Ge on 7/29/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "BLBaseViewController.h"


@interface BLFiveViewController : BLBaseViewController <CLLocationManagerDelegate, MKMapViewDelegate>
{
    MKMapView        *_mapView;
    UILabel          *_locationLabel;
    NSMutableArray   *_annotations;
}

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLLocation *currentLocation;
@property (nonatomic, strong) CLGeocoder *geocoder;


@end
