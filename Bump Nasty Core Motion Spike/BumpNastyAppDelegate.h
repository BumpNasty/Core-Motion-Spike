//
//  BumpNastyAppDelegate.h
//  Bump Nasty Core Motion Spike
//
//  Created by Tim Flapper on 23-04-13.
//  Copyright (c) 2013 Tim Flapper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface BumpNastyAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic, readonly) CMMotionManager *sharedManager;

@end
