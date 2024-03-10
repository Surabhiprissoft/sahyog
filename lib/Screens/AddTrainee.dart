import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sahyog/controller/AddTraineeController.dart';
import 'package:sahyog/utils/app_colors.dart';
import 'package:sahyog/utils/app_validation.dart';
import 'package:sahyog/widgets/CustomTopBar.dart';
import 'package:sahyog/widgets/common_textfield.dart';
import 'package:sahyog/widgets/other_common_widget.dart';

class AddTrainee extends GetView<AddTraineeController> {
  AddTrainee({super.key});


  final addTraineeController = Get.find<AddTraineeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomTopBar(titleName: "Add Trainee"),
          Positioned  (
              top: 140,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                 // height: 100.h,
                  padding: EdgeInsets.only(top: 13.h),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),

                  child: SingleChildScrollView(
                    child: Container(
                      child: Builder(
                          builder: (context) {
                            return Form(
                              key: addTraineeController.traineeFormKey,
                              child: Container(
                                margin: const EdgeInsets.only(left: 20.0,right: 20.0,bottom:20.0),
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 30.0,),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: InputTextFormField(label: "First Name",
                                            keyboardType: TextInputType.text,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(RegExp(
                                                  r'[a-zA-Z]')),
                                            ],controller: addTraineeController.firstNameController,),
                                        ),
                                        const SizedBox(width: 15.0,),
                                        Expanded(
                                          child: InputTextFormField(label: "Last Name",
                                            keyboardType: TextInputType.text,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(RegExp(
                                                  r'[a-zA-Z]')),
                                            ],controller: addTraineeController.lastNameController,),
                                        ),
                                      ],
                                    ),
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
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(20.0))
                                            ),
                                            hintText: "Select Center",
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
                                    /*Obx(() =>
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
                        SizedBox(height: 20),*/

                                    Obx(() =>
                                        DropdownButtonFormField<String>(
                                          value: addTraineeController.selectedLevel.value,
                                          decoration: InputDecoration(
                                            labelText: "Select Level",
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(20.0))
                                            ),
                                            hintText: "Select Level",
                                          ),
                                          onChanged: (String? newValue) {
                                            if (newValue != null) {
                                              addTraineeController.selectedLevel.value = newValue;
                                            }
                                          },
                                          items: addTraineeController.level.map<DropdownMenuItem<String>>((
                                              String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        )),
                                    /*Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        for (var option in addTraineeController.level)
                                          buildRadio(option,addTraineeController.selectedLevel),
                                      ],
                                    ),*/
                                    SizedBox(height: 20),
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
                  ),
              )
          ),
          Positioned(
              top: 70, // Adjust this value to control the position of the card
              left: 16,
              right: 16,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child:Center(
                  child: Obx(() {
                    return CircleAvatar(
                      radius: 75,
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
                                  radius: 20,
                                  backgroundColor: AppColors.appThemeColor,
                                  child: Icon(Icons.add,color: Colors.white,),
                                ),
                              ),
                            ),
                          ]
                      ),
                    );
                  }),

                ),

              )
          )

        ],
      )
    );
  }
}


