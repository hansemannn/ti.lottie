/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2017 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiLottieVectorViewProxy.h"
#import "TiLottieVectorView.h"
#import "LAAnimationView.h"
#import "TiUtils.h"

@implementation TiLottieVectorViewProxy

- (LAAnimationView *)animationView
{
    return [(TiLottieVectorView *)[self view] animationView];
}

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

- (void)setAnimationProgress:(NSNumber *)progress
{
    ENSURE_UI_THREAD(setAnimationProgress, progress);
    [[self animationView] setAnimationProgress:[TiUtils floatValue:progress]];
}

- (NSNumber *)animationProgress
{
    return NUMFLOAT([[self animationView] animationProgress]);
}

- (void)setAnimationSpeed:(NSNumber *)progress
{
    ENSURE_UI_THREAD(setAnimationSpeed, progress);
    [[self animationView] setAnimationSpeed:[TiUtils floatValue:progress]];
}

- (NSNumber *)animationSpeed
{
    return NUMFLOAT([[self animationView] animationSpeed]);
}

- (void)setLoopAnimation:(NSNumber *)progress
{
    ENSURE_UI_THREAD(setLoopAnimation, progress);
    [[self animationView] setLoopAnimation:[TiUtils boolValue:progress]];
}

- (NSNumber *)loopAnimation
{
    return NUMBOOL([[self animationView] loopAnimation]);
}

- (NSNumber *)isAnimationPlaying:(id)unused
{
    return NUMBOOL([[self animationView] isAnimationPlaying]);
}

- (NSNumber *)animationDuration
{
    return NUMFLOAT([[self animationView] animationDuration]);
}

@end
