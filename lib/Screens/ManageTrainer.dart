import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahyog/Screens/AddTrainer.dart';
import 'package:sahyog/controller/ManageTrainerController.dart';


class ManageTrainer extends GetView<ManageTrainerController> {
  ManageTrainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Trainer"),
          leading: IconButton(onPressed: (){
            Get.back();
          }, icon: const Icon(Icons.arrow_back_ios)),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 10.0,
        onPressed: (){
          Get.to(AddTrainer());
        },
      ),
      body: Column(

        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Search Trainer"),
                prefixIcon:Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(vertical: 10.0)
                ),
              ),
          ),

        ],
      ),
    );
  }
}
