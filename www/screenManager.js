var exec = require('cordova/exec');

var ScreenManager = {
    rotate: function(orientation, successCallback, errorCallback) {
        exec(successCallback, errorCallback, "ScreenManager", "rotate", [orientation]);
    },
    lock: function(orientation, successCallback, errorCallback) {
        exec(successCallback, errorCallback, "ScreenManager", "lock", [orientation]);
    },
    unlock: function(successCallback, errorCallback) {
        exec(successCallback, errorCallback, "ScreenManager", "unlock", []);
    }
};

module.exports = ScreenManager;
