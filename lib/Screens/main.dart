import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahyog/Screens/AddTrainer.dart';
import 'package:sahyog/bindings/ProjectBindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: ProjectBindings(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: "Poppins",
        useMaterial3: true,
      ),
      home: AddTrainer(),
    );
  }
}

