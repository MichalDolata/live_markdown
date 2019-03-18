// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"
import LiveSocket from "phoenix_live_view"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

document.write = function(content) {
  if (document.currentScript) {
    var src = document.currentScript.src
        .replace(/\#.*$/, '')
        .replace(/\?.*$/, '')
        .replace(/^.*\/\//, '');
    setTimeout(function() {
      var script = $('script').filter(function() {
        var scriptSrc = $(this).attr('src');
        return scriptSrc && scriptSrc.indexOf(src) !== -1;
      });
      $('<div></div>')
          .addClass('doc-write')
          .html(content)
          .insertAfter(script);
    }, 0);
  } else {
    HTMLDocument.prototype.write.apply(document, arguments);
  }
};

let liveSocket = new LiveSocket("/live")
liveSocket.connect()
