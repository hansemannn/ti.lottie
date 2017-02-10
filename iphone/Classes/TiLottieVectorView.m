/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2017 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiLottieVectorView.h"
#import "Lottie.h"

@implementation TiLottieVectorView

- (LOTAnimationView *)animationView
{
    if (animationView == nil) {
        id resource = [[self proxy] valueForKey:@"resource"];
        id mode = [[self proxy] valueForKey:@"contentMode"];
        ENSURE_TYPE(resource, NSString);
        ENSURE_TYPE(mode, NSString);
        
        animationView = [LOTAnimationView animationNamed:resource];
        
        if ([mode isEqual: @"aspectFit"]) {
            animationView.contentMode = UIViewContentModeScaleAspectFit;
        } else if ([mode isEqual: @"aspectFill"]) {
            animationView.contentMode = UIViewContentModeScaleAspectFill;
        } else if ([mode isEqual: @"scaleFill"]) {
            animationView.contentMode = UIViewContentModeScaleToFill;
        } else {
            TiLogMessage(@"contentMode not valid (aspectFit, aspectFill or scaleFill), defaulting to aspectFit");
            animationView.contentMode = UIViewContentModeScaleAspectFit;
        }
        
        animationView.frame = self.bounds;
        
        [self addSubview:animationView];
    }
    
    return animationView;
}

#pragma mark Layout utilities

#ifdef TI_USE_AUTOLAYOUT
- (void)initializeTiLayoutView
{
    [super initializeTiLayoutView];
    [self setDefaultHeight:TiDimensionAutoFill];
    [self setDefaultWidth:TiDimensionAutoFill];
}
#endif

#pragma mark Layout helper

- (void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
    for (UIView *child in [[self animationView] subviews]) {
        [TiUtils setView:child positionRect:bounds];
    }
    
    [super frameSizeChanged:frame bounds:bounds];
}

@end
