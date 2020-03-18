import 'package:flutter/material.dart';
import 'package:linksaplicativos/linksaplicativos.dart';


void main()=>runApp(Aplicativo());


class Aplicativo extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget
{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exemplo"),
      ),
      body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("Pagina Web", style: TextStyle(color: Colors.white)),
                  color: Colors.blue,
                  onPressed: ()
                  {
                    Linksaplicativos.paginaWeb("https://www.sitedesejado.com.br");
                  },
                ),
                RaisedButton(
                  child: Text("Telefone", style: TextStyle(color: Colors.white)),
                  color: Colors.blue,
                  onPressed: ()
                  {
                    Linksaplicativos.telefone("1223334455");
                  },
                ),
                RaisedButton(
                  child: Text("Whatsapp", style: TextStyle(color: Colors.white)),
                  color: Colors.blue,
                  onPressed: ()
                  {
                    Linksaplicativos.whatasapp("00122334455", "Olá Mundo");
                  },
                ),
                RaisedButton(
                  child: Text("mapa", style: TextStyle(color: Colors.white)),
                  color: Colors.blue,
                  onPressed: ()
                  {
                    Linksaplicativos.mapa("-8.413441", "-55.600508", "Local Name", "iniciar");
                  },
                ),
                RaisedButton(
                  child: Text("email", style: TextStyle(color: Colors.white)),
                  color: Colors.blue,
                  onPressed: ()
                  {
                    Linksaplicativos.email("email@gmail.com", "teste", "Olá Mundo");
                  },
                ),
              ],
            ),
          )
      ),
    );
  }
}


