import 'package:flutter/services.dart';

class Linksaplicativos {
  static const MethodChannel _channel =
  const MethodChannel('linksaplicativos');

  static paginaWeb(String url)
  {
    _channel.invokeMethod("paginaWeb.abrir", {"url": url});
  }

  static telefone(String numero)
  {
    _channel.invokeMethod("telefone.abrir", {"numero": numero});
  }

  static whatasapp(String whatsapp, String mensagem)
  {
    _channel.invokeMethod("whatsapp.abrir", {"whatsapp": whatsapp, "mensagem": mensagem});
  }
  static mapa(String latitude, String longitude, String nomeLocal, String androidGPSConfig)
  {
    _channel.invokeMethod("mapas.abrir", {"latitude": latitude, "longitude": longitude, "nomeLocal": nomeLocal, "gpsInit": androidGPSConfig});
  }

  static email(String email, String titulo, String mensagem)
  {
    _channel.invokeMethod("email.abrir", {"email": email, "titulo": titulo, "mensagem": mensagem});
  }
}
