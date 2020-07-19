import 'package:disenos/src/pages/basico_page.dart';
import 'package:disenos/src/pages/botones_page.dart';
import 'package:disenos/src/pages/scroll_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter/services.dart';  // mateapp y tab crea todo lo de abajo incluso el immport matrial.dart
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // Cambiar los colores de la barra de abajo que aparece una linea blanca difuminada
    // Importar services.dart para que funcione SystemChrome y no marque error
   SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent
    ) );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños',
      initialRoute: 'Botones',

      routes: {
        'basico'  : (BuildContext context) => BasicoPage(),  // BasicoPage() hace referencia a mi pagina basico_page.dart
        'scroll'  : (BuildContext context) => ScrollPage(),
        'Botones' : (BuildContext context) => BotonesPage(),
      },
    );
  }

}