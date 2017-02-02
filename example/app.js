var TiLottie = require('ti.lottie');
var offset = 0;

var win = Ti.UI.createWindow({
    backgroundColor: '#fff',
    title: 'Ti.Lottie Demo'
});

var nav = Ti.UI.iOS.createNavigationWindow({
    window: win
});

var view = TiLottie.createVectorView({
    resource: 'PinJump',
  
    // Not required, but recommended for better sizing
    // Check the "w" and "h" params in the JSON file to get the source rect
    width: 150,
    height: 150,
    backgroundColor: "#f0f0f0",
    borderRadius: 75
});

win.add(view);

win.add(createButtonWithAction('Start animation!', startAnimation));
win.add(createButtonWithAction('Pause animation!', pauseAnimation));

nav.open();

function createButtonWithAction(title, action) {
    offset += 40;

    var btn = Ti.UI.createButton({
        title: title,
        top: offset
    });

    btn.addEventListener('click', action);

    return btn;
}

function startAnimation() {
    view.startAnimation();
}

function pauseAnimation() {
    view.pauseAnimation();
}
