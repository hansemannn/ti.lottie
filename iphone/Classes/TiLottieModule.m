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

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"85a96b4e-a642-4dee-ae20-a0949b521a54";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"ti.lottie";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];

	NSLog(@"[DEBUG] %@ loaded",self);
}

@end
