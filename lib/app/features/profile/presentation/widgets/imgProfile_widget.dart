// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ImgProfile extends StatelessWidget {
  const ImgProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(100),
       boxShadow: const [
         BoxShadow(
           color: Color.fromARGB(255, 179, 175, 175),
           blurRadius: 10,
           offset: Offset(0, 5),
         ),
       ],
       //ponerle un borde al contenedor de la imagen
       border: Border.all(
         color: //#005369
         const Color.fromARGB(255, 0, 83, 105),
         width: 4,
       ),
     ),
      child: ClipRRect(
       borderRadius: BorderRadius.circular(100),
           child: const Image(
             image: AssetImage('assets/img/banesteCodesIcon.jpeg'),
             width: 150,
             height: 150,
             fit: BoxFit.cover,
           ),
         // ),
       ),
    );
  }
}
