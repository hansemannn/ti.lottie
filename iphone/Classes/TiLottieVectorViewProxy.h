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

- (void)setAnimationProgress:(id)progress;

- (void)addViewToLayer:(id)args;

- (id)animationProgress;

- (void)setAnimationSpeed:(id)speed;

- (id)animationSpeed;

- (void)setLoopAnimation:(id)loopAnimation;

- (id)loopAnimation;

- (id)isAnimationPlaying:(id)unused;

- (id)animationDuration;

@end
