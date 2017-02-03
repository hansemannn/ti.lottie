/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2017 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiLottieVectorViewProxy.h"
#import "TiLottieVectorView.h"
#import "Lottie.h"
#import "TiUtils.h"

@implementation TiLottieVectorViewProxy

- (LAAnimationView *)animationView
{
    return [(TiLottieVectorView *)[self view] animationView];
}

#pragma mark Public APIs

- (void)startAnimation:(id)args
{
    ENSURE_UI_THREAD(startAnimation, args);
    
    if ([args count] == 1) {
        KrollCallback *callback = nil;
        ENSURE_ARG_AT_INDEX(callback, args, 0, KrollCallback);
        
        [[self animationView] playWithCompletion:^(BOOL animationFinished) {
            NSDictionary *propertiesDict = @{@"finished": NUMBOOL(animationFinished)};
            NSArray *invocationArray = [[NSArray alloc] initWithObjects:&propertiesDict count:1];
            
            [callback call:invocationArray thisObject:self];
        }];
    } else {
        [[self animationView] play];
    }
}

- (void)pauseAnimation:(id)unused
{
    ENSURE_UI_THREAD(pauseAnimation, unused);
    [[self animationView] pause];
}

- (void)addViewToLayer:(id)args
{
    ENSURE_UI_THREAD(addViewToLayer, args);
    ENSURE_SINGLE_ARG(args, NSDictionary);
    
    id viewProxy = [args objectForKey:@"view"];
    id layerName = [args objectForKey:@"layer"];
    
    ENSURE_TYPE(viewProxy, TiViewProxy);
    ENSURE_TYPE(layerName, NSString);
    
    [self rememberProxy:viewProxy];
    
    [[self animationView] addSubview:[viewProxy view]
                        toLayerNamed:layerName];
}

- (void)setAnimationProgress:(id)progress
{
    ENSURE_UI_THREAD(setAnimationProgress, progress);
    ENSURE_TYPE(progress, NSNumber);
    
    [[self animationView] setAnimationProgress:[TiUtils floatValue:progress]];
    [self replaceValue:progress forKey:@"progress" notification:NO];
}

- (id)animationProgress
{
    return NUMFLOAT([[self animationView] animationProgress]);
}

- (void)setAnimationSpeed:(id)speed
{
    ENSURE_UI_THREAD(setAnimationSpeed, speed);
    ENSURE_TYPE(speed, NSNumber);

    [[self animationView] setAnimationSpeed:[TiUtils floatValue:speed]];
    [self replaceValue:speed forKey:@"speed" notification:NO];
}

- (id)animationSpeed
{
    return NUMFLOAT([[self animationView] animationSpeed]);
}

- (void)setLoopAnimation:(id)loopAnimation
{
    ENSURE_UI_THREAD(setLoopAnimation, loopAnimation);
    ENSURE_TYPE(loopAnimation, NSNumber);
    
    [[self animationView] setLoopAnimation:[TiUtils boolValue:loopAnimation]];
    [self replaceValue:loopAnimation forKey:@"loopAnimation" notification:NO];
}

- (id)loopAnimation
{
    return NUMBOOL([[self animationView] loopAnimation]);
}

- (id)isAnimationPlaying:(id)unused
{
    return NUMBOOL([[self animationView] isAnimationPlaying]);
}

- (id)animationDuration
{
    return NUMFLOAT([[self animationView] animationDuration]);
}

@end
