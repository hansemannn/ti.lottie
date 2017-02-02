/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2017 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#import "TiViewProxy.h"

@interface TiLottieVectorViewProxy : TiViewProxy {

}

- (void)startAnimation:(id)args;

- (void)pauseAnimation:(id)unused;

- (void)setAnimationProgress:(NSNumber *)progress;

- (void)addViewToLayer:(id)args;

- (NSNumber *)animationProgress;

- (void)setAnimationSpeed:(NSNumber *)progress;

- (NSNumber *)animationSpeed;

- (void)setLoopAnimation:(NSNumber *)progress;

- (NSNumber *)loopAnimation;

- (NSNumber *)isAnimationPlaying:(id)unused;

- (NSNumber *)animationDuration;

@end
