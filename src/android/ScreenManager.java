package com.benkesmith.screenmanager;

import android.app.Activity;
import android.content.pm.ActivityInfo;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;
import org.json.JSONArray;
import org.json.JSONException;

public class ScreenManager extends CordovaPlugin {

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if (action.equals("rotate")) {
            String orientation = args.getString(0);
            this.setOrientation(orientation);
            callbackContext.success();
            return true;
        } else if (action.equals("lock")) {
            String orientation = args.getString(0);
            this.lockOrientation(orientation);
            callbackContext.success();
            return true;
        } else if (action.equals("unlock")) {
            this.unlockOrientation();
            callbackContext.success();
            return true;
        }
        return false;
    }

    private void setOrientation(String orientation) {
        Activity activity = this.cordova.getActivity();
        switch (orientation) {
            case "landscape-left":
                activity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);
                break;
            case "landscape-right":
                activity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_REVERSE_LANDSCAPE);
                break;
            case "portrait":
                activity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
                break;
            default:
                activity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED);
                break;
        }
    }

    private void lockOrientation(String orientation) {
        this.setOrientation(orientation);
    }

    private void unlockOrientation() {
        Activity activity = this.cordova.getActivity();
        activity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED);
    }
}
