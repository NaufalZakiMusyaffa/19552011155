import 'package:flutter/material.dart';
import 'package:naufalzakimusyaffa_19552011155/pages/menu_utama.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MenuUtama(),
    );
  }

}
