
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sahyog/controller/AddTrainerController.dart';


class AddTrainer extends GetView<AddTrainerController> {
   AddTrainer({super.key});

  final addTrainerController = Get.put(AddTrainerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Trainer"),
        leading: const Icon(Icons.arrow_back_ios_rounded),
      ),
      body: SingleChildScrollView(
        child: Builder(
          builder: (context) {
            return Form(
              child: Container(
                margin: const EdgeInsets.all(20.0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Center(
                      child:Obx(() {
                        return CircleAvatar(
                          radius: 80,
                          backgroundImage: addTrainerController.imagePath.isNotEmpty ?
                          FileImage(File(addTrainerController.imagePath.toString())): null,
                          child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: GestureDetector(
                                    onTap: (){
                                      showDialog(context: context, builder: (BuildContext contex)
                                      {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(20.0)),
                                          child:  Container(

                                            alignment: Alignment.center,
                                            height: 100,
                                            child:   Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    IconButton(onPressed: (){
                                                      Navigator.pop(context);
                                                      addTrainerController.openCamera();

                                                    }, icon: Icon(Icons.camera_alt_outlined),iconSize: 50.0,),
                                                    Text("Camera")
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    IconButton(onPressed: (){
                                                      Navigator.pop(context);
                                                      addTrainerController.openGallery();
                                                    }, icon: Icon(Icons.photo_album_outlined),iconSize: 50.0,),
                                                    Text("Album")
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                    },
                                    child: const CircleAvatar(
                                      radius: 22,
                                      backgroundColor: Colors.white70,
                                      child: Icon(Icons.add_a_photo_outlined),
                                    ),
                                  ),
                                ),
                              ]
                          ),
                        );
                      }),

                    ),
                    const SizedBox(height: 30.0,),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text("Full Name"),
                          border: OutlineInputBorder()
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text("Age"),
                          border: OutlineInputBorder()
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text("Mobile Number"),
                          border: OutlineInputBorder()
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text("Email ID"),
                          border: OutlineInputBorder()
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text("Year of Experience"),
                          border: OutlineInputBorder()
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text("Address"),
                          border: OutlineInputBorder()
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: OutlinedButton(
                            onPressed: () {
                              //TODO
                            },
                            child: const Text('Cancel'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 4,
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle button 2 press
                            },
                            child: const Text('Submit'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0,),



                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
