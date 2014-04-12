/**
 * JSON RPC helpers
 */

define(function(require) {
  var $ = require("zepto");
  var _ = { };

  _.openServer = function(url) {
    var self = { };
    var currentId = 1;

    self.request = function(method, params, handler) {
      var req = {
        "jsonrpc": "2.0",
        "method": method,
        "params": params,
        "id": currentId++
      };


      // currently we can't send raw XHR request as host is different
      // this hack depends on force CORS Firefox addon
      var xhr = new XMLHttpRequest();
      xhr.open('POST', url);
      xhr.onreadystatechange = function () {
        if (this.readyState != 4) {
          return;
        } else if (this.status == 200) {
          handler(JSON.parse(this.responseText));
        } else {
          console.log("JSON ERROR: ("+this.status+") "+this.responseText)
        }
      };
      xhr.send(JSON.stringify(req));
    }

    return self;
  }

  return _;
});
