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

- (TiLottieVectorView *)vectorView
{
    return (TiLottieVectorView *)[self view];
}

- (void)startAnimation:(id)args
{
    ENSURE_UI_THREAD(startAnimation, args);
    
    if ([args count] == 1) {
        KrollCallback *callback = nil;
        ENSURE_ARG_AT_INDEX(callback, args, 0, KrollCallback);
        
        [[[self vectorView] animationView] playWithCompletion:^(BOOL animationFinished) {
            NSDictionary *propertiesDict = @{@"finished": NUMBOOL(animationFinished)};
            NSArray *invocationArray = [[NSArray alloc] initWithObjects:&propertiesDict count:1];
            
            [callback call:invocationArray thisObject:self];
        }];
    } else {
        [[[self vectorView] animationView] play];
    }
}

- (void)pauseAnimation:(id)unused
{
    ENSURE_UI_THREAD(pauseAnimation, unused);
    [[[self vectorView] animationView] pause];
}

@end
