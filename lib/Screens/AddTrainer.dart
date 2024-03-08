
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sahyog/controller/AddTrainerController.dart';
import 'package:sahyog/utils/app_validation.dart';
import 'package:sahyog/widgets/common_textfield.dart';

class AddTrainer extends GetView<AddTrainerController> {
   AddTrainer({super.key});
   final addTrainerController  = Get.find<AddTrainerController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Trainer"),
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Builder(
          builder: (context) {
            return Form(
              key: addTrainerController.trainerFormKey,
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
                    InputTextFormField(label: "First Name",keyboardType: TextInputType.text,controller:addTrainerController.firstNameController,inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                    ]),
                    const SizedBox(height: 20.0,),
                    InputTextFormField(label: "Last Name",keyboardType: TextInputType.text,controller:addTrainerController.lastNameController,inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                    ]),
                    const SizedBox(height: 20.0,),
                    InputTextFormField(label: "Age",keyboardType: TextInputType.number,controller:addTrainerController.ageController),
                    const SizedBox(height: 20.0,),
                    InputTextFormField(label: "Mobile Number",keyboardType: TextInputType.number,controller:addTrainerController.mobileNumberController),
                    const SizedBox(height: 20.0,),
                    InputTextFormField(label: "Email ID",keyboardType: TextInputType.emailAddress,controller:addTrainerController.emailController),
                    const SizedBox(height: 20.0,),
                    InputTextFormField(label: "Years of Experience",keyboardType: TextInputType.number,controller:addTrainerController.yearsofExperienceController),
                    const SizedBox(height: 20.0,),
                    InputTextFormField(label: "Address",keyboardType: TextInputType.multiline,controller:addTrainerController.addressController),
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

                              addTrainerController.onAddTrainer();
                            /*  if (addTrainerController.trainerFormKey.currentState!.validate())
                              {
                                addTrainerController.trainerFormKey.currentState!.save();
                                addTrainerController.onA
                              }*/
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


