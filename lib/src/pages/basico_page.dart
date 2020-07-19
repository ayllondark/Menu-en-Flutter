import 'package:flutter/material.dart';

// stles y tab crea nuestros StatelessWidget
class BasicoPage extends StatelessWidget {

  final estiloTitulo = TextStyle( fontSize: 20.0, fontWeight: FontWeight.bold );
  final estiloSubTitulo = TextStyle( fontSize: 18.0, color: Colors.grey );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(  // LISTVIEW mejor que COLUMN en caso sea muchos pararfos y el column no tiene scroll o barrita y saldra error de pixel xk el alto del texto es mas alto que el de la pantalla
        // SingleChildScrollView = quita el cuadro o borde en la parte superior y deja q nuestra imagen este al top de la pantalla
        child: Column(
          children: <Widget>[
            _crearImagen(),
            _crearTitulo(),
            _crearAcciones(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
        ],
        ),
      )
    );
  }

  Widget _crearImagen() {
    return Container(
          width: double.infinity,
          child: Image(
            image: NetworkImage('https://media.sproutsocial.com/uploads/2016/02/Landscape-Launch-Animation-Blog-Alt-Loop.gif'),
            height: 180.0,
            fit: BoxFit.cover,  // Ocupa todo el ancho de la pantalla
      ),
    );
  }

  Widget _crearTitulo() {
    return SafeArea(  // SafeArea = Separa ejemplo ara los iphone q tienen la pantalla cuabierta en la parte inferior y aleja el texto de esa parte para que se pueda leer la info
          child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),  // sera symmetric porque quiero cambiar la posicion horizontal y vertical iguales
                child: Row( // Los Rows sirven para ordenar elementos en forma HORIZONTAL
                  children: <Widget>[
                    Expanded(  // Widget Expanded ocupa todo el espacio que queda , sin robarle espacio a la estrella y numero
                        child: Column( // Column = Para alinear elementos uno abajo del otro en forma vertical dentro del ROW
                        crossAxisAlignment: CrossAxisAlignment.start ,  // en un ROW el mainAxilsAligment es horizontal, por lo cual es crossAxisAligment seria vertical
                        children: <Widget>[
                          Text('Lago con un Puente', style: estiloTitulo),
                          SizedBox(height: 7.0 ),
                          Text('Un Lago en Alemania', style: estiloSubTitulo)
                        ],
                      ),
                    ),

                    Icon(  Icons.star, color: Colors.red, size: 30.0 ),
                    Text('41', style: TextStyle( fontSize: 20.0,))
                  ],
                ),
              ),
    );
  }

  Widget _crearAcciones() {
    return Row( // Los Rows sirven para ordenar elementos en forma HORIZONTAL
      mainAxisAlignment: MainAxisAlignment.spaceEvenly ,  // mainAxisalignment en un ROW ordena de forma horizontal
      children: <Widget>[
       _accion( Icons.call, 'CALL' ),
       _accion( Icons.near_me, 'ROUTE' ),
       _accion( Icons.share, 'Share' ),
      ],
    );
  }

  Widget _accion(IconData icon, String texto){   // Widget de tipo Icono para reutilizarlo arriba en _crearAcciones
    return Column( // Column = Para alinear elementos uno abajo del otro en forma vertical dentro del ROW
          children: <Widget>[
            Icon( icon, color: Colors.blue, size: 30.0 ),
            SizedBox( height: 5.0 ),
            Text( texto, style: TextStyle( fontSize: 15.0, color: Colors.blue ), )
          ],
        );
  }

  Widget _crearTexto() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 0.0),
        child: Text(
          'Magna quis esse anim ad pariatur voluptate dolor laboris irure amet minim sunt dolore qui. Velit do mollit fugiat eu amet dolor cupidatat incididunt et occaecat. Officia ea est proident id deserunt ut amet id excepteur.',
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }


}