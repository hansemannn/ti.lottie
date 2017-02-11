/**
 * ti.lottie
 *
 * Created by Hans Knoechel
 * Copyright (c) 2017 Your Company. All rights reserved.
 */

#import "TiLottieModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "LOTAnimationView.h"

@implementation TiLottieModule

#pragma mark Internal

-(id)moduleGUID
{
	return @"85a96b4e-a642-4dee-ae20-a0949b521a54";
}

-(NSString*)moduleId
{
	return @"ti.lottie";
}

#pragma mark Lifecycle

-(void)startup
{
	[super startup];
	NSLog(@"[DEBUG] %@ loaded",self);
}

#pragma mark Constants

MAKE_SYSTEM_STR(CONTENT_MODE_ASPECT_FIT, @"aspectFit");
MAKE_SYSTEM_STR(CONTENT_MODE_ASPECT_FILL, @"aspectFill");
MAKE_SYSTEM_STR(CONTENT_MODE_SCALE_FILL, @"scaleFill");

@end
