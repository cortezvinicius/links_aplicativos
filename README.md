# linksaplicativos

linksaplicativos é um plugin que permite você usar serviços de email,whastsapp,apple maps, google maps, chamadas telefônicas e site no navegador.

## Instalação

Para instalar basta abrir o arquivo pubspec.yaml e adicionar a seguinte dependência.

```bash
dependencies:
  linksaplicativos: ^0.1.2
```

# Como Usar


## Pagina Web

**obs:** pode ser passado protocolo http no lugar de https

```Dart
Linksaplicativos.paginaWeb("https://www.sitedesejado.com.br");
```

## Telefone

**obs:** não pode conter máscaras.  


```Dart
Linksaplicativos.telefone("número");
```

## Whatsapp

**obs:** não pode conter máscaras e caso não queira enviar mensagem passa um valor vazio ex: "".  


```Dart
Linksaplicativos.whatsapp("número", "mensagem desejada");

````

## Mapa
 
**obs:** A ação é somente para o Android, pode ser definida como "iniciar" ou vazio "".
```Dart
Linksaplicativos.mapa("latitude", "longitude", "nome do local", "Ação");
````

## E-mail
 
**obs:** Se não querer enviar nenhuma mensagem e título basta passar o valor "" vazio.
```Dart
Linksaplicativos.email("email", "titulo", "mensagem");
````

## Projeto Exemplo

```Dart
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
```

## Contribuições
Sugestões e ideias são bem vindas para futuras versões.

## licença
[MIT](https://github.com/cortezvinicius/links_aplicativos/blob/master/LICENSE)
