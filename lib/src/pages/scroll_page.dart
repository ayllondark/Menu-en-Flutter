import 'package:flutter/material.dart';

//Escribimos stless y crea el widhet 
class ScrollPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(  // PageView = muestra 2 pantallas una al costado de otro haciendo scroll a la izkierda
        scrollDirection: Axis.vertical,  // Muestra las pantallas o divs hacia arriba y ahcian abajo ya sin esto x defecto seran a los costados
        children: <Widget>[
          _pagina1(),
          _pagina2(),
        ],
      )
    );
  }

  Widget _pagina1() {
    return Stack(
      children: <Widget>[
        _colorFondo(),
        _imagenFondo(),
        _textos(),
      ],
    );
  }

  Widget _colorFondo() {
    return Container(
      width: double.infinity,  // Que ocupe todo el ancho posible
      height: double.infinity, // Que ocupe todo el alto posible
      color: Color.fromRGBO(108, 192, 218, 1.0),
    );
  }

  Widget _imagenFondo() {
    return Container(
      width: double.infinity,  // Que ocupe todo el ancho posible
      height: double.infinity, // Que ocupe todo el alto posible
      child: Image(
        image: AssetImage('assets/scroll-1.png'),
        fit: BoxFit.cover,  // Para que la imagen ocupe toda la pantalla
      ),
    );
  }

  Widget _textos() {

    final estiloTexto = TextStyle(color: Colors.white, fontSize: 50.0);
    return SafeArea(  // Envolvemos toda nuestra columna en un "SafeArea" para que de espacio para ese NOTCH q traen algunos moviles cuadro negro arriba
      child: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          Text('11º', style: estiloTexto),
          Text('Miércoles', style: estiloTexto),
          Expanded(child: Container() ),  // Expanded ocupa todo el espacio entre estos dos y respeta los tamalos de los mismos
          Icon( Icons.keyboard_arrow_down, size: 70.0, color: Colors.white)
        ],
      ),
    );
  }

  Widget _pagina2() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
      child: Center(
        child: RaisedButton( // Creamos boton
          shape: StadiumBorder(),
          color: Colors.blue,
          textColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Text('Bienvenidos', style: TextStyle(fontSize: 20.0 )),
          ),
          onPressed: () {},
        ),
      ),
    );
  }

}