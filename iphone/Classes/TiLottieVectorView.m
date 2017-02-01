/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2017 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiLottieVectorView.h"

@implementation TiLottieVectorView

- (LAAnimationView *)animationView
{
    if (animationView == nil) {
        id resource = [self valueForKey:@"resource"];
        ENSURE_TYPE(resource, NSString);
        
        animationView = [LAAnimationView animationNamed:resource];
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
