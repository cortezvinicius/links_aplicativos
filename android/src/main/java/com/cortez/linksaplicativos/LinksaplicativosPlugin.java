package com.cortez.linksaplicativos;

import androidx.annotation.Nullable;


import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.PluginRegistry.Registrar;

public class LinksaplicativosPlugin implements FlutterPlugin, ActivityAware
{

    @Nullable private MetodoCallHandle metodoCallHandle;
    @Nullable private IntentAbrir intentAbrir;

    public static void registerWith(Registrar registrar)
    {
        MetodoCallHandle handler = new MetodoCallHandle(new IntentAbrir(registrar.context(), registrar.activity()));
        handler.setChannel(registrar.messenger());
    }


    @Override
    public void onAttachedToEngine(FlutterPluginBinding binding)
    {
        intentAbrir = new IntentAbrir(binding.getApplicationContext(), /*activity=*/ null);
        metodoCallHandle = new MetodoCallHandle(intentAbrir);
        metodoCallHandle.setChannel(binding.getFlutterEngine().getDartExecutor());
    }

    @Override
    public void onDetachedFromEngine(FlutterPluginBinding binding)
    {
        if (metodoCallHandle == null) {
            return;
        }

        metodoCallHandle.stopChannell();
        metodoCallHandle = null;
        intentAbrir = null;
    }

    @Override
    public void onAttachedToActivity(ActivityPluginBinding binding)
    {
        if (metodoCallHandle == null) {
            return;
        }

        intentAbrir.initActivity(binding.getActivity());
    }

    @Override
    public void onDetachedFromActivityForConfigChanges()
    {
        if (metodoCallHandle == null) {
            return;
        }

        intentAbrir.initActivity(null);
    }

    @Override
    public void onReattachedToActivityForConfigChanges(ActivityPluginBinding binding)
    {
        onAttachedToActivity(binding);
    }

    @Override
    public void onDetachedFromActivity()
    {
        onDetachedFromActivity();
    }
}