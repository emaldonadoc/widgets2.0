(function(){
  var JavaScript = {
    load: function(src, callback) {
      var script = document.createElement('script');
      var loaded;
      script.setAttribute("type","text/javascript");
      script.setAttribute('src', src);
      if (callback) {
        if (script.readyState) {
          script.onreadystatechange = function () { // For old versions of IE
            if (this.readyState == 'complete' || this.readyState == 'loaded') {
              callback();
            }
          };
        } else { // Other browsers
          script.onload = callback;
        }
      }
      (document.getElementsByTagName("head")[0] || document.documentElement).appendChild(script);
    }
  };
  var head= document.getElementsByTagName('head')[0];
  var css= document.createElement('link');
  css.setAttribute("rel", "stylesheet");
  css.setAttribute("type", "text/css");
  css.setAttribute("href", "http://widgetdev.winbits.com/stylesheets/app.css");
  head.appendChild(css);

  JavaScript.load('//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js', function() {
    var $winbitsScript = $("script[src$='winbits.js']");
    var userConfig = { verticalId: $winbitsScript.data('vertical'), proxyUrl: $winbitsScript.data('proxy')};
    userConfig.providerUrl = "https://apici.winbits.com/provider/";
    var Winbits = { userConfig: userConfig };
    Winbits.$ = $.noConflict(true);
    window.Winbits = Winbits;
    window.w$ = Winbits.$;
    JavaScript.load('http://widgetdev.winbits.com/javascripts/vendor.js', function() {
      window.Backbone.$ = Winbits.$;
      JavaScript.load('http://widgetdev.winbits.com/javascripts/app.js', function() {
        // TODO: No esperar a que se cargue todo el DOM para renderizar el widget. Esperar a que se rederize el container del widget.
        Winbits.$(document).ready(function($) {
            require('initialize');
        });
      });
    });
  });

if (!Array.prototype.reduce)
{
Array.prototype.reduce = function(fun /*, initial*/)
{
var len = this.length;
if (typeof fun != "function")
throw new TypeError();

// no value to return if no initial value and an empty array
if (len == 0 && arguments.length == 1)
throw new TypeError();

var i = 0;
if (arguments.length >= 2)
{
var rv = arguments[1];
}
else
{
do
{
if (i in this)
{
rv = this[i++];
break;
}

// if array contains no values, no initial value to return
if (++i >= len)
throw new TypeError();
}
while (true);
}

for (; i < len; i++)
{
if (i in this)
rv = fun.call(null, rv, this[i], i, this);
}

return rv;
};
}
})();
