package com.cortez.linksaplicativos;

import androidx.annotation.Nullable;

import io.flutter.Log;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;

public class MetodoCallHandle implements MethodCallHandler
{

    private final IntentAbrir intentAbrir;
    @Nullable private MethodChannel channel;




    public MetodoCallHandle(IntentAbrir intentAbrir)
    {
        this.intentAbrir = intentAbrir;
    }

    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result)
    {
        String url = call.argument("url");
        String telefone = call.argument("numero");
        String whatsapp = call.argument("whatsapp");
        String mensagem = call.argument("mensagem");
        String latitude = call.argument("latitude");
        String longitude = call.argument("longitude");
        String gpsInit = call.argument("gpsInit");
        String email = call.argument("email");
        String titulo = call.argument("titulo");
        if (call.method.equals("paginaWeb.abrir"))
        {
            intentAbrir.abrirPaginaWeb(url);
        }else if (call.method.equals("telefone.abrir"))
        {
            intentAbrir.telefoneAbrir(telefone);
            Log.d("certo", "deu certo");
        }else if (call.method.equals("whatsapp.abrir"))
        {
            intentAbrir.whatsappAbrir(whatsapp, mensagem);
        }else if (call.method.equals("mapas.abrir"))
        {
            intentAbrir.abrirMapas(latitude, longitude ,gpsInit);
        }else if (call.method.equals("email.abrir"))
        {
            intentAbrir.emailAbrir(email,titulo, mensagem);
        }
    }


    public void setChannel(BinaryMessenger messenger) {
        if (channel != null) {
            stopChannell();
        }

        channel = new MethodChannel(messenger, "linksaplicativos");
        channel.setMethodCallHandler(this);
    }

    void stopChannell() {
        if (channel == null) {
            return;
        }

        channel.setMethodCallHandler(null);
        channel = null;
    }

}
