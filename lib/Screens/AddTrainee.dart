import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sahyog/controller/AddTraineeController.dart';
import 'package:sahyog/utils/app_validation.dart';
import 'package:sahyog/widgets/common_textfield.dart';
import 'package:sahyog/widgets/other_common_widget.dart';

class AddTrainee extends GetView<AddTraineeController> {
  AddTrainee({super.key});


  final addTraineeController = Get.find<AddTraineeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Trainee"),
        leading: IconButton(onPressed: () {
          Get.back();
        }, icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Builder(
            builder: (context) {
              return Form(
                key: addTraineeController.traineeFormKey,
                child: Container(
                  margin: const EdgeInsets.all(20.0),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Column(
                    children: [
                      Center(
                        child: Obx(() {
                          return CircleAvatar(
                            radius: 80,
                            backgroundImage: addTraineeController.imagePath
                                .isNotEmpty
                                ?
                            FileImage(
                                File(addTraineeController.imagePath.toString()))
                                : null,
                            child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: GestureDetector(
                                      onTap: () {
                                        showDialog(context: context,
                                            builder: (BuildContext contex) {
                                              return Dialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                                child: Container(

                                                  alignment: Alignment.center,
                                                  height: 100,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceEvenly,
                                                    crossAxisAlignment: CrossAxisAlignment
                                                        .center,
                                                    children: [
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          IconButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                              addTraineeController
                                                                  .openCamera();
                                                            },
                                                            icon: Icon(Icons
                                                                .camera_alt_outlined),
                                                            iconSize: 50.0,),
                                                          Text("Camera")
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          IconButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                              addTraineeController
                                                                  .openGallery();
                                                            },
                                                            icon: Icon(Icons
                                                                .photo_album_outlined),
                                                            iconSize: 50.0,),
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
                      InputTextFormField(label: "First Name",
                          keyboardType: TextInputType.text,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(
                                r'[a-zA-Z]')),
                          ],controller: addTraineeController.firstNameController,),
                      const SizedBox(height: 20.0,),
                      InputTextFormField(label: "Last Name",
                        keyboardType: TextInputType.text,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(
                              r'[a-zA-Z]')),
                        ],controller: addTraineeController.lastNameController,),
                      const SizedBox(height: 20.0,),
                      InputTextFormField(
                          label: "Age", keyboardType: TextInputType.number,controller: addTraineeController.ageController),
                      const SizedBox(height: 20.0,),
                      InputTextFormField(label: "Mobile Number",
                          keyboardType: TextInputType.number,controller: addTraineeController.mobileNumberController),
                      const SizedBox(height: 20.0,),
                      InputTextFormField(label: "Email ID",
                          keyboardType: TextInputType.emailAddress,controller: addTraineeController.emailController),
                      const SizedBox(height: 20.0,),
                      InputTextFormField(label: "Address",
                          keyboardType: TextInputType.multiline,controller: addTraineeController.addressController),
                      const SizedBox(height: 20.0,),
                      Obx(() =>
                          DropdownButtonFormField<String>(
                            value: addTraineeController.selectedCeneter.value,
                            decoration: InputDecoration(
                              labelText: "Select Center",
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                addTraineeController.selectedCeneter.value = newValue;
                              }
                            },
                            items: addTraineeController.centers.map<DropdownMenuItem<String>>((
                                String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )),
                      SizedBox(height: 20),
                      Obx(() =>
                          DropdownButtonFormField<String>(
                            value: addTraineeController.selectedDiscount.value,
                            decoration: InputDecoration(
                              labelText: "Select Discount",
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                addTraineeController.selectedDiscount.value = newValue;
                              }
                            },
                            items: addTraineeController.discount.map<DropdownMenuItem<String>>((
                                String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )),
                      SizedBox(height: 20),

              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              for (var option in addTraineeController.level)
              buildRadio(option,addTraineeController.selectedLevel),
              ],
              ),
                      SizedBox(height: 10),
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
                                addTraineeController.addTrainee();
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


