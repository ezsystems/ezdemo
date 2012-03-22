YUI(YUI3_config).use('event', function (Y) {
    Y.on('domready', function () {
        var h = Y.one('html');

        if ( h.hasClass('ie') ) {
            // conditional comments did the job
            return;
        }
        // Y.UA is based on the user agent string,
        // this is bad... but should be used only to fix "small" CSS issues
        if ( Y.UA.ie ) {
            h.addClass('ie').addClass('ie-gt9');
        } else if ( Y.UA.webkit ) {
            h.addClass('webkit');
        } else if ( Y.UA.gecko ) {
            h.addClass('gecko');
        }
    });
});
