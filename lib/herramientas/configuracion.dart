import 'package:flutter/material.dart';
import 'package:mq04f/herramientas/variables_globales.dart';
import 'package:shared_preferences/shared_preferences.dart';

final direccion = TextEditingController();


class configuracion extends StatefulWidget {
  const configuracion({Key? key}) : super(key: key);

  @override
  _configuracionState createState() => _configuracionState();
}

class _configuracionState extends State<configuracion> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor :Colors.purple,
        title: Text("Orden de Compra"),
      ),
      body:
      Center(child:
      ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/fondogris_solo.png'),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
            alignment: Alignment.center,
            child: Image.asset("images/logo.png"),
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/fondogris_solo.png'),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.all(15),
            child:  TextField(
              style: const TextStyle(
                color: Colors.black,
              ),
              //ahora conecto con lo que quiero poner
              controller : direccion,
              decoration: InputDecoration(
                  hintText: "URL",
                  hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/fondogris_solo.png'),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.all(25),
            child: ElevatedButton(
              child: const Text(
                  "SAVE",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: "bold"
                  )
              ),
              onPressed: () async {
                //toma lo que agregaste y lo coloca en los strings
                var  dir = direccion.text;
                urlGlobal =direccion.text;
                if (dir != "") {
                  Navigator.pushNamed(context, "/login");
                }else{
                  showDialog(context: context, builder: (BuildContext context){
                    return AlertDialog(
                      title: Text("Error "),
                      content: SingleChildScrollView(
                        //es como un listView
                        child: ListBody(
                          children:[
                            Text ("debes completar los campos"),
                          ],
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                          child: Text("aceptar"),
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                        ),
                        ElevatedButton(
                          child: Text("cancelar"),
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    );
                  });
                }
              },
            ),
          )
        ],
      ),
      ),
    );
  }
}