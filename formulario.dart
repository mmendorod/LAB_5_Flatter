import 'package:flutter/material.dart';
import 'package:componentes/src/paginas/resultado.dart';
class Formulario extends StatefulWidget{
  FormularioPageState createState() => FormularioPageState();
  
}
class FormularioPageState extends State<Formulario> {
  String _nombre = '';
  String _epoca='';
  String _seleccionDia = '1';
  String _seleccionMes='Enero';
  int mes= 0 ;
  int epoca=0;
  int dia=0;
  List <String> _listaMes = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Setiembre', 'Octubre', 'Noviembre', 'Diciembre'];

  List<String> _listaDia = ['1', '2', '3', '4','5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31'];

int sumaCabal(int numero){
  int resultado=0;
          while(numero > 0) {
    resultado += numero % 10;
    numero = numero ~/ 10;
        }
  if (resultado>10 || resultado ==10){
    resultado= ( resultado%10)+ (resultado~/10);
    return resultado;
  }else{
    return resultado;
}
}
int acontecimiento(int tonicaDiaria){
  int hora= 9; // no sabiamos como hacer para sacar la hora por ello solo le pusimos un valor fijo
  return hora + tonicaDiaria;

}
List cabalEpoca( int epoca){
  int year=0;

  List <int>cabala = [];
  for (int i = 0;i<4;i++) {
    year=sumaCabal(epoca);
    epoca +=year;
    cabala.add(epoca);
    cabala.add(year);
  }
  return cabala;

}

int tonicaFundamental(int urgencia, String _nombre, int dia, int mes, int epoca) {
  int sumaNombre = 0;
  int sub = 0;
  String letra;
  for (int i = 0;i< (_nombre.length);i++) {
    letra=_nombre.substring(i,i+1);
    if (letra!='')
      sub++;
    else {
      if (sub>9)
       sub=sumaCabal(sub); //Suma cabalistica a cada palabra del nombre
      sumaNombre+=sub;
    }
  }
  sumaNombre=sumaCabal(sumaNombre);//Suma Cabalistica antes de calcular tonica
  int tonicaFundamental= urgencia+sumaNombre;
  tonicaFundamental= sumaCabal(tonicaFundamental);
  return tonicaFundamental;

     }

  int tonicaDiaria(int tonicaFundamental, int day,int month,int year){ //no se como trabajaron la fecha x2
  dia=sumaCabal(dia);
    mes=sumaCabal(mes);
    epoca=sumaCabal(epoca);
    int fecha = dia + mes + epoca;
  fecha=sumaCabal(fecha);
  int tonicaDiaria=fecha+tonicaFundamental;
  tonicaDiaria=sumaCabal(tonicaDiaria);
  return tonicaDiaria;
}
  int urgenciaInterior(int dia, int mes, int epoca){
    dia=sumaCabal(dia);
    mes=sumaCabal(mes);
    epoca=sumaCabal(epoca);
    int suma = dia + mes + epoca;
    suma= sumaCabal(suma);
    return suma;

  }



  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        
      ),
      body:
       ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
           _titulo(),
          _crearInput(),
          Divider(),
          _crearDia(),
          Divider(),
           _crearMes(),
          Divider(),
           _crearTiempo(),
          Divider(),
          _calculo(),
           Divider(),
          
        ],
      ),
    );
  }
  Widget _titulo(){
    return  Center(
          child: Text('Estudio Numerologico' ,
                              style: TextStyle(
                                  color: Colors.red[800],
                                  fontSize: 25,
                                fontWeight: FontWeight.w900)
          ),
    );
  }
  Widget _crearInput() {

    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${ _nombre.length }'),
        hintText: 'Nombres y Apellidos',
        labelText: 'Nombre',
        
        suffixIcon: Icon( Icons.accessibility ),
        icon: Icon( Icons.account_circle )
      ),
      onChanged: (valor){
        setState(() {
          _nombre = valor;
        });
      },
    );

  }


  Widget _crearTiempo() {

    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Año',
        labelText: '0000',
        helperText: 'Coloque el año',
        suffixIcon: Icon( Icons.perm_contact_calendar ),
        icon: Icon( Icons.calendar_today )
      ),
      onChanged: (valor) =>setState(() {
        _epoca = valor;
      })
    );

  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> listado= new List();
    _listaDia.forEach( (dia){
      listado.add( DropdownMenuItem(
        child: Text(dia),
        value: dia,
      ));
    });
    return listado;

  }
  

   Widget _crearDia() {

    return Row(
      children: <Widget>[
        Icon(Icons.calendar_today),
        SizedBox(width: 30.0),   
        Expanded(
          child: DropdownButton(
            value: _seleccionDia,
            items: getOpcionesDropdown(),
            onChanged: (opt) {
              setState(() {
                _seleccionDia = opt;
              });
            },
          ),
        )

      ],
    );
    
   }
  
  List<DropdownMenuItem<String>> getOpciones() {
    List<DropdownMenuItem<String>> lista= new List();
    _listaMes.forEach( (mes){
      lista.add( DropdownMenuItem(
        child: Text(mes),
        value: mes,
      ));
    });
    return lista;

  }
    
   Widget _crearMes() {

    return Row(
      children: <Widget>[
        Icon(Icons.calendar_today),
        SizedBox(width: 30.0),   
        Expanded(
          child: DropdownButton(
            value: _seleccionMes,
            items: getOpciones(),
            onChanged: (opt) {
              setState(() {
                _seleccionMes = opt;
              });
              mes=_listaMes.indexOf(_seleccionMes);
            },
          ),
        )
      ],
    ); 
}
// calculos de las funciones principales

    
  Widget _calculo(){
     return RaisedButton(
      color: Colors.pink[900],
      shape: new RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0)),
      onPressed: () { 
        _segundaPagina(context);
        
  },   
  child: SizedBox(
              width: 80,
              height: 80,
              child: Center(
              child: Text("Calcular",
              textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.white,fontSize: 20,
                                  ),
                            ),
                          ),
                        ),
                         );
  }
void _segundaPagina(BuildContext context){
        epoca= int.parse(_epoca);
        dia=int.parse(_seleccionDia);
        mes=(_listaMes.indexOf(_seleccionMes))+1;
        int urgencia= urgenciaInterior(dia, mes, epoca);
        int tonicaFundamenta= tonicaFundamental(urgencia,_nombre, dia, mes, epoca);
        int tonicaDiar=tonicaDiaria(tonicaFundamenta, dia, mes, epoca);
        int acontencimiento=acontecimiento(tonicaDiar);
        List  cabalaEpoca= cabalEpoca(int.parse(_epoca));
  Navigator.of(context).pushNamed('/resultado',  arguments: Datos(nombre:_nombre, urgencia: urgencia ,acontecimiento: acontencimiento, tonicaDiaria: tonicaDiar,tonicaFundamental: tonicaFundamenta, 
  dia: _seleccionDia, mes: _seleccionMes, epoca: _epoca,  cabala: cabalaEpoca ));
}

}