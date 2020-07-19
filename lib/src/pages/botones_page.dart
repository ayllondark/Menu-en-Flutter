
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class BotonesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(  // Stack recibe una coleccion de hijos, en este caso una colecciond e widget
        children: <Widget>[
          _fondoApp(),

          SingleChildScrollView(  // Es como un ListView pero podras poner varios elementos y seran scroll para vizualizarlos y iran subiendo hasta la posicion 0 arriba
            child: Column(
              children: <Widget>[
                _titulos(),
                _botonesRedondeados()
              ],
            ),
          )
        ],
    ),

    bottomNavigationBar: _bottomNavigationBar(context)

  );

  }

  Widget _fondoApp() {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.6),
          end: FractionalOffset(0.0, 1.0),
          colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
          ]
        )
      ),
    );

    final cajaRosada = Transform.rotate(  // Rotamos nuestra imagen cuadrado de fondo
      angle: -pi / 5.0,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80.0),
          //color: Colors.pink
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1.0),
              Color.fromRGBO(241, 142, 172, 1.0)
            ]
          )
        ),
    )
      );

    return Stack(
      children: <Widget>[
        gradiente,
        Positioned(
          top: -100.0,  // Subimos nuestro cuadrado mas arriba del top
          child: cajaRosada
          )
        
      ],
    );
  }

  Widget _titulos(){
    return SafeArea(  // Deja espacio para los elementos q cubren parte superior en el movil
      child: Container(
        padding: EdgeInsets.all(20.0),  // Espacio entre todoslos lados para que no este pegadoa las eskinas
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Classify Transaction', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold) ),
            SizedBox(height: 10.0),
            Text('Classify this Transaction into a particular category', style: TextStyle(color: Colors.white, fontSize: 18.0)),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationBar( BuildContext context ) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(55, 57, 84, 1.0),  // Cambiamos el color d enuestros barra de abajo y lo ponemos semitransparente
        primaryColor: Colors.pinkAccent, // Cambiamos el cloro del icono que este seleccionado o el primario
        textTheme: Theme.of(context).textTheme.copyWith( caption: TextStyle( color: Color.fromRGBO(116, 117, 152, 1.0) ) )
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon( Icons.calendar_today, size: 30.0 ),
            title: Container()
            ),
          BottomNavigationBarItem(
            icon: Icon( Icons.bubble_chart, size: 30.0 ),
            title: Container()
            ),
          BottomNavigationBarItem(
            icon: Icon( Icons.supervised_user_circle, size: 30.0 ),
            title: Container()
            ),
        ],
      ),
    );
  }

Widget _botonesRedondeados() {
  return Table(  // Este widget TABLE hace que ya tenga espacio entre los cuadros personalziados, separados
    children: [  // El children es la lista de TABLEROWS
      TableRow(  // el children TABLEROW es toda la fila
        children: [ // Este children son los elementos o cuadrados que vana  estar en formal horizontal
          _crearBotonRedondeado( Colors.blue, Icons.border_all, 'General'),
          _crearBotonRedondeado( Colors.purpleAccent, Icons.directions_bus, 'Bus'),
        ]
      ),
      TableRow(
        children: [
          _crearBotonRedondeado( Colors.pinkAccent, Icons.shop, 'Buy'),
          _crearBotonRedondeado( Colors.orange, Icons.insert_drive_file, 'File'),
        ]
      ),
      TableRow(
        children: [
          _crearBotonRedondeado( Colors.blueAccent, Icons.movie_filter, 'Entertaiment'),
          _crearBotonRedondeado( Colors.green, Icons.cloud, 'Grocery'),
        ]
      ),
      TableRow(
        children: [
          _crearBotonRedondeado( Colors.red, Icons.collections, 'Fotos'),
          _crearBotonRedondeado( Colors.teal, Icons.help_outline, 'General'),
        ]
      ),
    ],
  );
}

Widget _crearBotonRedondeado(Color color, IconData icono, String texto) {
  return ClipRect(
    child: BackdropFilter(  // BackdropFilter = Widget que hace borroso algun elemento, en este caso la caja
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),  // ImageFilter para utilizar las propiedades . debe importar 'dart:ui'
      child: Container(
        height: 110.0,
        margin: EdgeInsets.all(15.0),  // Damos mas espacio entre todos sus lados entre cuadros
        decoration: BoxDecoration(
          color: Color.fromRGBO(62, 66, 107, 0.7),
          borderRadius: BorderRadius.circular(20.0)
        ),
        child: Column(  // Implementamos el contenido de las cajas y ponemos columna porque dentro de la caja sera un icono y un texto
                        // una debajo de otra por eso utilizamos un COLUMN
          mainAxisAlignment: MainAxisAlignment.spaceAround, // Centra el circulo del Icono y el Texto en medio o al centro de la caja
          children: <Widget>[
            SizedBox(height: 5.0),
            CircleAvatar(
              //backgroundColor: Colors.pinkAccent,
              backgroundColor: color, // color
              radius: 35.0,  // Agranda el circulo rosado donde esta el Icono
              child: Icon( icono, color: Colors.white, size: 30.0), // icono = es el argumento de nuestro widget
            ),
            //Text('Item', style: TextStyle(color: Colors.pinkAccent) ),
            Text(texto, style: TextStyle(color: color) ), // color = es el argumento de nuestro widget
            SizedBox(height: 5.0)  // Agregamos un espacio abajo del texto para que deje un espacio y el texto no este apegado al final de la caja
          ],
        ),
      ),
    ),
  );
}

}