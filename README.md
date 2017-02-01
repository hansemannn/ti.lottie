# 🖼 Ti.Keyframes

 Summary
---------------
Ti.Keyframes is an open-source project to support the Facebook Keyframes library in Appcelerator's 
Titanium Mobile. The module is currently supports starting, pausing, resuming and seeking a keyframe.

Requirements
---------------
- Titanium Mobile SDK 6.0.0.GA or later
- iOS 8.0 or later
- Xcode 8 or later

Features
---------------
- [x] Create a new vector view using `var vectorView = Keyframes.createVectorView({resource: 'my_json'})`
- [x] Start a keyframe animation using `vectorView.startAnimation()`
- [x] Pause a keyframe animation using `vectorView.pauseAnimation()`
- [x] Resume a keyframe animation using `vectorView.resumeAnimation()`
- [x] Seek to a certain progress of a keyframe animation using `vectorView.seekToProgress(0.5)`

Example
---------------
Please see the full-featured example in `example/app.js`.

Author
---------------
Hans Knoechel ([@hansemannnn](https://twitter.com/hansemannnn) / [Web](http://hans-knoechel.de))

License
---------------
Apache 2.0

Contributing
---------------
Code contributions are greatly appreciated, please submit a new [pull request](https://github.com/hansemannn/ti.keyframes/pull/new/master)!
