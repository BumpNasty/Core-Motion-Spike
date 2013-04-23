//
//  BumpNastyGraphView.h
//  Bump Nasty Core Motion Spike
//
//  Created by Tim Flapper on 23-04-13.
//  Copyright (c) 2013 Tim Flapper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface BumpNastyGraphView : UIView
-(void)addX:(double)x y:(double)y z:(double)z;
@end
