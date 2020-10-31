import 'package:flutter/material.dart';
class Resultados extends StatelessWidget {
  const Resultados({Key key}) : super (key:key);
  @override
  Widget build(BuildContext context) {
    Datos arguments  = ModalRoute.of(context).settings.arguments;
    String _tonicaFundamental=arguments.tonicaFundamental.toString();
    String _tonicaDiaria=arguments.tonicaDiaria.toString();
    String _urgencia=arguments.urgencia.toString();
    String _dia=arguments.dia;
    String _mes=arguments.mes;
    String _epoca=arguments.epoca.toString();
      String a0= arguments.cabala[0].toString();
      String a1=arguments.cabala[1].toString();
      String a2=arguments.cabala[2].toString();
      String a3=arguments.cabala[3].toString();
      String b0=arguments.cabala[4].toString();
      String b1=arguments.cabala[5].toString();
      String b2=arguments.cabala[6].toString();
      String b3=arguments.cabala[7].toString();
    return Scaffold(
        appBar: AppBar(
          title: Text('Resultados'),
        ),
        body:Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[

            Text(arguments.nombre,
            style: TextStyle(
            fontSize: 25,
            color: Colors.pink[900],
          ),
        ),
        Text('\n\n Fecha de nacimiento :$_dia de$_mes del $_epoca \n ',
            style: TextStyle(
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
         Text('Numeros que nos rigen durante la vida',
            style: TextStyle(
            fontSize: 20,
            color: Colors.pink[800],
          ),
        ),
        Text('Urgencia interior : $_urgencia\n''Tonica Fundamental: $_tonicaFundamental\n',
            style: TextStyle(
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
         Text('cabala del año ', 
            style: TextStyle(
            fontSize: 15,
            color: Colors.black87,
          ),
        ),
        Text('Año : $a0 , numero regente: $a1\n'
        'Año : $a2 , numero regente: $a3\n'
        'Año : $b0 , numero regente: $b1\n'
        'Año : $b2, numero regente: $b3\n',
        
            style: TextStyle(
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
        Text('Regencia del día de hoy',
            style: TextStyle(
            fontSize: 20,
            color: Colors.pink[800],
          ),
        ),
        Text('Tonica del dia : $_tonicaDiaria',
            style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      
          ]),
          
    ),
    
    );
  }
}
class Datos{
  String nombre;
  int tonicaFundamental;
  int tonicaDiaria;
  List cabala;
  int urgencia;
  String dia;
  String mes;
  String epoca;
  int acontecimiento;

  Datos({this.nombre, this.cabala, this.acontecimiento,this.dia, this.epoca, this.mes, this.tonicaDiaria, this.tonicaFundamental,this.urgencia});
}