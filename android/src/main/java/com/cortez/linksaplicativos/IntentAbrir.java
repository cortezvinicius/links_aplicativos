package com.cortez.linksaplicativos;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.widget.Toast;

import androidx.annotation.Nullable;

public class IntentAbrir
{
    private final Context applicationContext;
    @Nullable private Activity activity;



    public IntentAbrir(Context applicationContext, @Nullable Activity activity)
    {
        this.applicationContext = applicationContext;
        this.activity = activity;
    }

    public void initActivity(@Nullable Activity activity)
    {
        this.activity = activity;
    }

    public void abrirPaginaWeb(String url)
    {
        //Toast.makeText(applicationContext, url, Toast.LENGTH_LONG).show();
        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
        activity.startActivity(intent);
    }

    public void telefoneAbrir(String telefone)
    {
        Uri uri = Uri.parse("tel:" + telefone);
        Intent intent = new Intent(Intent.ACTION_DIAL, uri);
        activity.startActivity(intent);
    }

    public void whatsappAbrir(String whatsapp, String mensagem)
    {
        Uri uri = Uri.parse("https://wa.me/55" + whatsapp +"?text=" + mensagem);
        Intent intent = new Intent(Intent.ACTION_VIEW, uri);
        activity.startActivity(intent);
    }
    public void abrirMapas(String latitude, String longitude ,String gpsInit)
    {
        if (gpsInit.equals("iniciado"))
        {

            String destino = latitude +","+ longitude;

            Uri uri = Uri.parse("google.navigation:q=" + destino + "&mode=d");
            Intent intent = new Intent(Intent.ACTION_VIEW, uri);
            intent.setPackage("com.google.android.apps.maps");
            activity.startActivity(intent);

        }else
        {
            String uri = "http://maps.google.com/maps?daddr=" + latitude + "," + longitude;
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(uri));
            intent.setPackage("com.google.android.apps.maps");
            activity.startActivity(intent);
        }
    }
    public void emailAbrir(String email, String titulo, String mensagem)
    {
        Intent intent = new Intent(Intent.ACTION_SENDTO);
        intent.setType("text/plain");
        intent.setData(Uri.parse("mailto:" + email));
        intent.putExtra(Intent.EXTRA_SUBJECT, titulo);
        intent.putExtra(Intent.EXTRA_TEXT, mensagem);
        activity.startActivity(intent);
    }
}

