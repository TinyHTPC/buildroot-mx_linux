
// This uses require.js to structure javascript:
// http://requirejs.org/docs/api.html#define

define(function(require) {
    // Zepto provides nice js and DOM methods (very similar to jQuery,
    // and a lot smaller):
    // http://zeptojs.com/
    var $ = require('zepto');
    var rpc = require('jsonrpc');
    window.rpc = rpc;
    //window.xbm = rpc.openServer("http://localhost:8080/jsonrpc");
    window.xbm = rpc.openServer("http://10.102.180.42:3920/jsonrpc");

    var xbmc = {
    	"JSON_RPC" : "/jsonrpc",
    	"player_id" : null,
        "control" : {
            "play" :         document.getElementById('xbmc-playpause'),
            "next" :         document.getElementById('xbmc-next'),
            "previous" :     document.getElementById('xbmc-previous')
        },
        "manage" : {
        	"home" : document.getElementById('xbmc-home'),
        	"up" : document.getElementById('xbmc-up'),
        	"right" : document.getElementById('xbmc-right'),
        	"ok" : document.getElementById('xbmc-ok'),
        	"bottom" : document.getElementById('xbmc-bottom'),
        	"left" : document.getElementById('xbmc-left')
        },

    	request : function(url,method,player_id,callback) {

    		if(method === 'init_xbmc') {
    			$.post(base_url+this.JSON_RPC + '?'+url,'{"jsonrpc": "2.0", "method": "Player.GetActivePlayers", "id": 1}', callback);
    			return;
    		}

    		$.post(base_url+this.JSON_RPC + '?'+url,'{"jsonrpc": "2.0", "method": "'+method+'", "params": { "playerid": '+player_id+'}, "id": 1}', callback);
    	},

        init : function() {

        	var that = this;
        	window.xbm.request("Player.GetActivePlayers",undefined,function(data) {
            console.log(data)
        		if("undefined" !== typeof data.result[0].playerid) {
        			that.player_id  = data.result[0].playerid;
        		}else{
        			alert('Votre Serveur XBMC n\'est pas actif');
        		}
        	});

        },

    	playPause : function() {
    		window.xbm.request('Player.PlayPause',{ "playerid": xbmc.player_id}, function(data) {

    			if("undefined" == typeof data.result.speed) {
    				alert('Une erreur est survenue');
    				return;
    			}

    			if(data.result.speed == 0) {
    				xbmc.control.play.classList.add('status_paused');
            xbmc.control.play.classList.remove('status_playing');
    			}else {
    				xbmc.control.play.classList.add('status_playing');
    				xbmc.control.play.classList.remove('status_paused');
    			}

    		});
    	},

    	next : function() {
    		window.xbm.request('Player.GoNext',{ "playerid": xbmc.player_id}, function(data) {
    			console.log("success next");
    		});
    	},

    	previous : function() {
    		window.xbm.request('Player.GoPrevious',{ "playerid": xbmc.player_id}, function(data) {
    			console.log("success previous");
    		});
    	},

    	up : function() {
        xbmc.volume += 5;
    		window.xbm.request('Application.SetVolume',{"volume":xbmc.volume}, function(data) {
    			console.log(data);
    		});
    	},

    	down : function() {
        xbmc.volume -= 5;
    		window.xbm.request('Application.SetVolume',{"volume":xbmc.volume}, function(data) {
    			console.log(data);
    		});
    	}
    };

    window.xbm.request("Application.GetProperties", { properties: ["volume"] }, function(d) {
      xbmc.volume = d.result.volume;
    });

    xbmc.init();
    xbmc.control.play.addEventListener('click',xbmc.playPause);
    xbmc.control.next.addEventListener('click',xbmc.next);
    xbmc.control.previous.addEventListener('click',xbmc.previous);
    xbmc.manage.up.addEventListener('click', xbmc.up);
    xbmc.manage.bottom.addEventListener('click', xbmc.down);
});

