import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:go_router/go_router.dart';

import '../widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 83, 105),
        title: Text(
          FlutterI18n.translate(context, "profile.title"),
        ),
        //flecha para regresar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go("/");
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ImgProfile(),

            // vamos a poner algo de informacion que seria nombre y correo
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(left: 30),
              width: 350,
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        width: 100,
                        child: Text(
                          '${FlutterI18n.translate(context, "profile.name")}: ',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 83, 105),
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        alignment: Alignment.topLeft,
                        width: 200,
                        child: const Text(
                          "Esteban Rodriguez Marles",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        width: 100,
                        child: Text(
                          '${FlutterI18n.translate(context, "profile.nick")}: ',
                          textAlign: TextAlign.center,
                           style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 83, 105),
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                     Container(
                      alignment: Alignment.topLeft,
                        width: 200,
                        child: const Text(
                          "Baneste Codes",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
