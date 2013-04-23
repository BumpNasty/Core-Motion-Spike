//
//  BumpNastyAppDelegate.m
//  Bump Nasty Core Motion Spike
//
//  Created by Tim Flapper on 23-04-13.
//  Copyright (c) 2013 Tim Flapper. All rights reserved.
//

#import "BumpNastyAppDelegate.h"

@interface BumpNastyAppDelegate ()
{
    CMMotionManager *motionmanager;
}
@end

@implementation BumpNastyAppDelegate
- (CMMotionManager *)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        motionmanager = [[CMMotionManager alloc] init];
    });
    
    return motionmanager;
}
@end
