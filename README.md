# 🖼 Ti.Lottie

 Summary
---------------
Ti.Lottie is an open-source project to support the Airbnb Lottie library in Appcelerator Titanium. 
The module supports all available API's, like starting, pausing and interacting with the view.

Requirements
---------------
- Titanium Mobile SDK 5.0.0.GA or later
- iOS 7.1 or later
- Xcode 7 or later

Features
---------------
- [x] Create a new vector view:
```js
var vectorView = Lottie.createVectorView({
    resource: 'PinJump' // In this case a JSON file, without prefix
})
```

- [x] Start a new animation:
```js
vectorView.startAnimation();
```

- [x] Start a new animation and watch the completion:
```js
vectorView.startAnimation(function(e) {
    Ti.API.info('Finished: ' + e.finished);
});
```

- [x] Pause a running animation:
```js
vectorView.pauseAnimation();
```

- [x] (Advanced) Add a view to a layer class:
```js
vectorView.addViewToLayer({
    view: myTitaniumView
    layer: "JumpLayer"
});
```

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
Code contributions are greatly appreciated, please submit a new [pull request](https://github.com/hansemannn/ti.lottie/pull/new/master)!
