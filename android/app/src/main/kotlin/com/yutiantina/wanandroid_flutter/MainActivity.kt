package com.yutiantina.wanandroid_flutter

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    companion object{
        const val CHANNEL = "samples.flutter.io/battery";
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        MethodChannel(flutterEngine?.dartExecutor?.binaryMessenger, CHANNEL).setMethodCallHandler(object : MethodChannel.MethodCallHandler{
            override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
                if(call.method == "getBatteryLevel"){
                    val batteryLevel = getBatteryLevel()
                    if(-1 != batteryLevel){
                        result.success(batteryLevel)
                    }else{
                        result.error("UNAVAILABLE", "Battery level not available", null)
                    }
                }else{
                    result.notImplemented()
                }
            }

        })

    }
    
    private fun getBatteryLevel() : Int{
        var batteryLevel = -1
        if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP){
            val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        }else{
            val intent = ContextWrapper(applicationContext).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
            batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) / (intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1))
        }
        return batteryLevel;
    }  
}
