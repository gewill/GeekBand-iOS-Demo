//
//  BLFiveViewController.m
//  BLDemo03
//
//  Created by Will Ge on 7/29/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "BLFiveViewController.h"
#import "BLAnnotation.h"

@interface BLFiveViewController ()

@end

@implementation BLFiveViewController

#pragma mark - viewDidLoad

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"five";
    self.bgImageView.image = [UIImage imageNamed:@"bg5"];
    
    
    // get _mapView's whidth and height
    // if user Ruler cocoapod will great,
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height - 20 - 40 - 49;
    
    // add MapView
    _mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    _mapView.delegate = self;
    [self.view addSubview:_mapView];
    
    CLLocationCoordinate2D coordinate = {31.19316, 121.43154};
    MKCoordinateSpan span = {0.005, 0.005};
    MKCoordinateRegion region = {coordinate, span};
    [_mapView setRegion:region];
    
    // a set of Annotaions
    _annotations = [[NSMutableArray alloc] initWithCapacity:3];
    
    CLLocationCoordinate2D coordinate1 = {31.19434, 121.43203};
    BLAnnotation *annotation1 = [[BLAnnotation alloc] initWithCoordinate:coordinate1
                                                                 title:@"Xuhui"
                                                              subtitle:@"Guangxi Rd"
                                                                 index:0];
    [_annotations addObject:annotation1];
    
    CLLocationCoordinate2D coordinate2 = {31.19190, 121.43304};
    BLAnnotation *annotation2 = [[BLAnnotation alloc] initWithCoordinate:coordinate2
                                                                 title:@"Xuhui"
                                                              subtitle:@"Guilin Rd"
                                                                 index:1];
    [_annotations addObject:annotation2];
    
    CLLocationCoordinate2D coordinate3 = {31.19223, 121.42847};
    BLAnnotation *annotation3 = [[BLAnnotation alloc] initWithCoordinate:coordinate3
                                                                 title:@"Xuhui"
                                                              subtitle:@"Jiaxing Rd"
                                                                 index:2];
    [_annotations addObject:annotation3];
    
    
    // add 3 UIBarButtonItems
    UIBarButtonItem *locationButton = [[UIBarButtonItem alloc] initWithTitle:@"Locate"
                                                                       style:(UIBarButtonItemStylePlain)
                                                                      target:self
                                                                      action:@selector(locationButtonCliked:)];
    self.navigationItem.leftBarButtonItem = locationButton;
    
    UIBarButtonItem *reverseButton = [[UIBarButtonItem alloc] initWithTitle:@"Reverse"
                                                                       style:(UIBarButtonItemStylePlain)
                                                                      target:self
                                                                      action:@selector(reverseButtonCliked:)];
    
    
    UIBarButtonItem *flagButton = [[UIBarButtonItem alloc] initWithTitle:@"Flag"
                                                                       style:(UIBarButtonItemStylePlain)
                                                                      target:self
                                                                      action:@selector(flagButtonCliked:)];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:reverseButton, flagButton, nil];
    
    
    // add a UILabel
    _locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, height - 50, width, 50)];
    _locationLabel.backgroundColor = [UIColor colorWithRed:0.3294 green:0.251 blue:0.0 alpha:0.24];
    _locationLabel.textAlignment = NSTextAlignmentCenter;
    _locationLabel.text = @"User's Location.";
    [self.view addSubview:_locationLabel];
    
}

#pragma mark - Custom 3 UIBarButtonItems' methods

- (void)locationButtonCliked:(id)sender {
    
    if (self.locationManager == nil) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
    }
    
    if ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    [self.locationManager startUpdatingLocation];
    
}

typedef void (^UserInfoBlock)(NSString *);

- (void)test:(UserInfoBlock)uBlock {
    uBlock(@"abc");
}


- (void)reverseButtonCliked:(id)sender {
    
    [self test:^(NSString *name) {
        NSLog(@"%@", name);
    }];
    
    self.geocoder = [[CLGeocoder alloc] init];
    
    [self.geocoder reverseGeocodeLocation:self.currentLocation
                        completionHandler:^(NSArray *placemarks, NSError *error) {
                            if (error) {
                                NSLog(@"%@", error.description);
                            } else if ([placemarks count] > 0) {
                                CLPlacemark *placemark = [placemarks objectAtIndex:0];
                                _locationLabel.text = placemark.country;
                            }
                        }];
}

- (void)flagButtonCliked:(id)sender {
    
    [_mapView removeAnnotations:_mapView.annotations];
    [_mapView addAnnotations:_annotations];
}
#pragma mark - CLLocationManagerDelegate methods

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusNotDetermined) {
        NSLog(@"Wait for authorization.");
    } else if (status == kCLAuthorizationStatusAuthorizedAlways || status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self.locationManager startUpdatingLocation];
    } else {
        NSLog(@"Failed to authorization.");
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    [self.locationManager stopUpdatingLocation];
    NSLog(@"%@", error.description);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    self.currentLocation = newLocation;
    _locationLabel.text = [NSString stringWithFormat:@"(%f, %f)", newLocation.coordinate.latitude, newLocation.coordinate.longitude];
}


#pragma mark - MKMapViewDelegate methods

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    
    if (![[annotation class] isSubclassOfClass:[BLAnnotation class]]) {
        return nil;
    }
    
    BLAnnotation *blAnnotation = (BLAnnotation *)annotation;
    static NSString *kReuseIdentifier = @"blannotation";
    
    MKPinAnnotationView *pinAnnotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:kReuseIdentifier];
    
    if (pinAnnotationView == nil) {
        pinAnnotationView = [[MKPinAnnotationView alloc] initWithAnnotation:(id<MKAnnotation>)blAnnotation
                                                            reuseIdentifier:kReuseIdentifier];
        pinAnnotationView.animatesDrop = YES;
        pinAnnotationView.canShowCallout = YES;
        
        UIButton *leftButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        leftButton.frame = CGRectMake(0, 0, 30, 30);
        leftButton.backgroundColor = [UIColor colorWithRed:0.1255 green:0.5059 blue:0.3451 alpha:1.0];
        pinAnnotationView.leftCalloutAccessoryView = leftButton;
        
        
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        pinAnnotationView.rightCalloutAccessoryView = rightButton;
    }
    
    switch (blAnnotation.index) {
        case 0: {
            pinAnnotationView.pinColor = MKPinAnnotationColorGreen;
            pinAnnotationView.leftCalloutAccessoryView.tag = 0;
        }
        case 1: {
            pinAnnotationView.pinColor = MKPinAnnotationColorPurple;
            pinAnnotationView.leftCalloutAccessoryView.tag = 1;
        }
        case 2: {
            pinAnnotationView.pinColor = MKPinAnnotationColorRed;
            pinAnnotationView.leftCalloutAccessoryView.tag = 2;
        }
        default:
            break;
    }
    
    pinAnnotationView.tag = blAnnotation.index;
    
    return pinAnnotationView;
    
    
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    if (view.tag) {
        NSLog(@"%li", view.tag);
    }
}


#pragma mark - didReceiveMemoryWarning

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
