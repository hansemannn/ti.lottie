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
        
        if ([mode isEqualToString:@"aspectFit"]) {
            animationView.contentMode = UIViewContentModeScaleAspectFit;
        } else if ([mode isEqualToString:@"aspectFill"]) {
            animationView.contentMode = UIViewContentModeScaleAspectFill;
        } else if ([mode isEqualToString:@"scaleFill"]) {
            animationView.contentMode = UIViewContentModeScaleToFill;
        } else {
            NSLog(@"[ERROR] The \"contentMode\" property is not valid (one of: CONTENT_MODE_ASPECT_FIT, CONTENT_MODE_ASPECT_FILL or CONTENT_MODE_SCALE_FILL), defaulting to CONTENT_MODE_ASPECT_FIT");
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
