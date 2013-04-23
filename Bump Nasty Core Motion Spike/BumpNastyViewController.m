//
//  BumpNastyViewController.m
//  Bump Nasty Core Motion Spike
//
//  Created by Tim Flapper on 23-04-13.
//  Copyright (c) 2013 Tim Flapper. All rights reserved.
//

#import "BumpNastyViewController.h"
#import "BumpNastyAppDelegate.h"
#import "BumpNastyGraphView.h"

static const NSTimeInterval accelerometerMin = 0.01;

@interface BumpNastyViewController ()
@property (weak, nonatomic) IBOutlet BumpNastyGraphView *graphView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation BumpNastyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    NSTimeInterval delta = 0.005;
    NSTimeInterval updateInterval = accelerometerMin + delta * 0.5;
    
    CMMotionManager *mManager = [(BumpNastyAppDelegate *)[[UIApplication sharedApplication] delegate] sharedManager];
    
    BumpNastyViewController * __weak weakSelf = self;
    
    if ([mManager isAccelerometerAvailable] == YES) {
        [mManager setAccelerometerUpdateInterval:updateInterval];
        [mManager startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
            [weakSelf.graphView addX:accelerometerData.acceleration.x y:accelerometerData.acceleration.y z:accelerometerData.acceleration.z];
            
            if (accelerometerData.acceleration.x > 1) {
                self.label.text = @"BUMPED!";
            }
        }];
    }
    
    //self.updateIntervalLabel.text = [NSString stringWithFormat:@"%f", updateInterval];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
