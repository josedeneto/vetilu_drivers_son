import 'package:flutter/material.dart';

import '../pages/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vetilu Motorista Filhos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RoutePage(),
    );
  }
}
