import 'package:flutter/material.dart';

class my extends StatefulWidget {
  const my({super.key});

  @override
  State<my> createState() => _myState();
}

class _myState extends State<my> {
  @override
  Widget build(BuildContext context) {


    Widget MyWidget(){

      return  Scaffold(
        appBar: AppBar(title: Text("Test"),),
        body:
        Text("HI"),
      ) ;
    }
    return GestureDetector(

      onTap: (){  FocusManager.instance.primaryFocus?.unfocus();},
          
          child: OrientationBuilder(builder: (BuildContext c , Orientation or ){
            return LayoutBuilder(builder: ( BuildContext c ,BoxConstraints bc  ){
                double h = bc.maxHeight;
                double w = bc.maxWidth;
                 if(h>=300  && h<750 ){
                   return MyWidget();
                     }
                   else{
                   return MyWidget();
                 }



                 }

            );

          })
    );
  }
}
