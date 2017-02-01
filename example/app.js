var TiLottie = require('ti.lottie');

var win = Ti.UI.createWindow({
    backgroundColor: '#fff',
    title: 'Ti.Lottie Demo'
});

var nav = Ti.UI.iOS.createNavigationWindow({
    window: win
});

var offset = 0;

var view = TiLottie.createVectorView({
	resource: 'sample_logo'
});

win.add(view);

win.add(createButtonWithAction('Start animation', startAnimation));
win.add(createButtonWithAction('Pause animation', pauseAnimation));

win.add(view);
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
