import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../ViewModel/VmImage.dart';

class VwImage extends StatefulWidget {
  const VwImage({super.key});

  @override
  State<VwImage> createState() => _VwImageState();
}

class _VwImageState extends State<VwImage> {
  @override
  final  l_VmImage = Get.put(VmImage());

  Widget build(BuildContext context) {
    Widget _WidgetportraitMode(double PrHeight, PrWidth) {
      return Scaffold(
          body: Column(
               children: [

                 Padding(
                   padding: EdgeInsets.only(
                     top: PrHeight * 0.01,
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       ElevatedButton(
                           onPressed: () async {
                             if ( await l_VmImage.FncPermissions() == true )
                               {

                               }
                           },
                           child: const FittedBox(
                             fit: BoxFit.scaleDown,
                             child: Text(
                               'Upload Image',
                               style: TextStyle(fontSize: 15),
                             ),
                           )),
                       ElevatedButton(
                           onPressed: () async {

                           },
                           child: const FittedBox(
                             fit: BoxFit.scaleDown,
                             child: Text(
                               'Fetch Image',
                               style: TextStyle(fontSize: 15),
                             ),
                           )),

                     ],

                   ),
                 ),

                    ],

 ),

      );


    }
    return GestureDetector(
      onTap: () {
        //when tap anywhere on screen keyboard dismiss
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              //Get device's screen height and width.
              double height = constraints.maxHeight;
              double width = constraints.maxWidth;

              if (width >= 300 && width < 500) {
                return _WidgetportraitMode(height, width);
              } else {
                return _WidgetportraitMode(height, width);
              }
            },
          );
        },
      ),
    );
  }
}
