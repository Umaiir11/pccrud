import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

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
                     top: PrHeight * 0.10,
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Center(
                             child: InkWell(
                               onTap: () async {


                                 if ( await l_VmImage.FncPermissions() == true )

                                 {
                                   if (await l_VmImage.FncUserImage() == true) {

                                   } else {
                                     Get.snackbar("ALert", "Upload image");
                                   }
                                 }
                                 else{

                                   Get.snackbar(
                                     'Permission Alert',
                                     '',
                                     messageText: Text(
                                       'Permission denied',
                                       style: const TextStyle(color: Colors.white),
                                     ),
                                     snackStyle: SnackStyle.FLOATING,
                                     snackPosition: SnackPosition.BOTTOM,
                                     backgroundColor: Colors.black87,
                                     colorText: Colors.white,
                                     margin: const EdgeInsets.all(10),
                                     borderRadius: 10,
                                     animationDuration: const Duration(milliseconds: 800),
                                     overlayBlur: 0,
                                     isDismissible: true,
                                     mainButton: TextButton(
                                       onPressed: () {
                                         // Do something when main button is pressed
                                       },
                                       child: const Text(
                                         'OK',
                                         style: TextStyle(color: Colors.white),
                                       ),
                                     ),
                                     icon: const Icon(
                                       Icons.info_outline,
                                       color: Colors.white,
                                     ),
                                   );
                                 }


                               },
                               child: Obx(
                                     () =>
                                 l_VmImage.G_compressedImage.value != null
                                     ? Container(
                                   width: 120,
                                   height: 120,
                                   decoration: BoxDecoration(
                                     shape: BoxShape.circle,
                                     image: DecorationImage(
                                       image: FileImage(File(l_VmImage.G_compressedImage.value!.path)),
                                       fit: BoxFit.cover,
                                     ),
                                   ),
                                 )
                                     : SizedBox(
                                   width: 140,
                                   height: 120,
                                   child: Lottie.asset(
                                     'assets/upload.json',
                                     fit: BoxFit.cover,
                                   ),
                                 ),
                               ),
                             ),
                           ),
                           Center(
                             child: Obx(() => Text(l_VmImage.Pr_imageName.value)),
                           ),
                         ],
                       ),

                       Column(
                         children: [
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
