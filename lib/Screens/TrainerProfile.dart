import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sahyog/controller/TrainerProfileController.dart';
import 'package:sahyog/widgets/CustomTopBar.dart';

import '../utils/AppCommonMethods.dart';
import '../utils/app_colors.dart';
import '../utils/app_validation.dart';
import '../widgets/common_textfield.dart';

class TrainerProfile extends GetView<TrainerProfileController> {
  TrainerProfile({super.key});

/*  final trainerProfileController = Get.put(
      TrainerProfileController()); */ //<TrainerProfileController>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<TrainerProfileController>(
          builder: (trainerProfileController) {
            return Stack(
              children: [
                Positioned(
                    top: 0,
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: 30.h,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/Top_bg.png'),
                            fit: BoxFit.cover, // Adjust the BoxFit as needed
                          ),
                          color: Colors.blue
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 6.w, bottom: 16.h, right: 6.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                                "Trainer Profile",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                )
                            ),
                            Row(
                              children: [

                                IconButton(
                                    onPressed: () {
                                      if (trainerProfileController.isReadOnly
                                          .value) {
                                        trainerProfileController.isReadOnly
                                            .value = false;
                                        trainerProfileController.update();
                                      } else {
                                        trainerProfileController.isReadOnly
                                            .value = true;
                                        trainerProfileController.update();
                                      }
                                    },
                                    icon: Icon(
                                      Icons.edit, color: Colors.white,
                                      size: 25.0,)
                                ),
                                IconButton(
                                    onPressed: () {

                                    },
                                    icon: Icon(
                                      Icons.notifications_none,
                                      color: Colors.white,
                                      size: 25.0,)
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),


                    )
                ),
                Positioned(
                    top: 150,
                    // Adjust this value to control the position of the card
                    left: 0,
                    right: 0,
                    bottom: 1,
                    child: Container(
                      height: 100.h,
                      padding: EdgeInsets.all(2.h),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Builder(
                            builder: (context) {
                              return Form(
                                key: trainerProfileController
                                    .trainerProfileFormKey,
                                child: Container(
                                  margin: const EdgeInsets.only(top: 10.0,
                                      left: 20.0,
                                      right: 20.0,
                                      bottom: 20.0),
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  child: Column(
                                    children: [
                                      trainerProfileController.isReadOnly.value
                                          ? Container(
                                        child: Row(
                                          children: [
                                            Text("Status"),
                                            SizedBox(width: 10.0,),
                                            ElevatedButton(onPressed: () {},
                                              child: Text(
                                                trainerProfileController
                                                    .trainerStatus.value
                                                    ? "ACTIVE"
                                                    : "INACTIVE",
                                                style: TextStyle(
                                                    color: Colors.white),),
                                              style: ButtonStyle(
                                                  backgroundColor: trainerProfileController
                                                      .trainerStatus.value
                                                      ? MaterialStateProperty
                                                      .all<Color>(Colors.green)
                                                      : MaterialStateProperty
                                                      .all<Color>(Colors.red)),)
                                          ],
                                          mainAxisAlignment: MainAxisAlignment
                                              .end,
                                        ),
                                      )
                                          : Obx(() {
                                        return Container(
                                            child: Row(
                                              children: [
                                                Text("INACTIVE"),
                                                Switch(
                                                    value: trainerProfileController
                                                        .trainerStatus.value,
                                                    onChanged: (value) {
                                                      trainerProfileController
                                                          .trainerStatus
                                                          .toggle();
                                                    }),
                                                Text("ACTIVE"),
                                              ],
                                              mainAxisAlignment: MainAxisAlignment
                                                  .end,
                                            ));
                                      }),
                                      const SizedBox(height: 30.0,),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: InputTextFormField(
                                                  isReadOnly: trainerProfileController
                                                      .isReadOnly.value,
                                                  label: "First Name",
                                                  keyboardType: TextInputType
                                                      .text,
                                                  controller: trainerProfileController
                                                      .firstNameController,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .allow(
                                                        RegExp(r'[a-zA-Z]')),
                                                  ])

                                          ),
                                          const SizedBox(width: 15.0,),
                                          Expanded(
                                            child: InputTextFormField(
                                                isReadOnly: trainerProfileController
                                                    .isReadOnly.value,
                                                label: "Last Name",
                                                keyboardType: TextInputType
                                                    .text,
                                                controller: trainerProfileController
                                                    .lastNameController,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(
                                                      RegExp(r'[a-zA-Z]')),
                                                ]),
                                          ),
                                        ],
                                      ),


                                      const SizedBox(height: 20.0,),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              controller: controller
                                                  .ageController,
                                              decoration: const InputDecoration(
                                                label: Text("DOB"),
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius
                                                      .all(
                                                      Radius.circular(10.0)),
                                                ),
                                                /*prefixIcon: Icon(
                                                Icons.calendar_month_sharp),*/
                                              ),
                                              validator: (value) {
                                                return AppValidation
                                                    .validateforrequiredfield(
                                                    value!!, "");
                                              },
                                              readOnly: true,
                                              onTap: () async {
                                                var selectedDate = await getDatePicker(
                                                    context);
                                                controller.ageController.text =
                                                    selectedDate.toString();
                                              },

                                            ),
                                          ),
                                          //Expanded(child: InputTextFormField(label: "Age",keyboardType: TextInputType.number,controller:addTrainerController.ageController)),
                                          const SizedBox(width: 15.0,),
                                          Expanded(
                                            child: Obx(() =>
                                                DropdownButtonFormField<String>(
                                                  value: trainerProfileController
                                                      .selectedGender.value
                                                      .isEmpty
                                                      ? null
                                                      : trainerProfileController
                                                      .selectedGender.value,
                                                  decoration: InputDecoration(
                                                    labelText: "Gender",
                                                    border: OutlineInputBorder(
                                                        borderRadius: BorderRadius
                                                            .all(
                                                            Radius.circular(
                                                                10.0))
                                                    ),
                                                    hintText: "Gender",

                                                    errorText: trainerProfileController
                                                        .isSubmitted.value &&
                                                        trainerProfileController
                                                            .selectedGender
                                                            .value
                                                            .isEmpty
                                                        ? ""
                                                        : null,
                                                  ),
                                                  onChanged: trainerProfileController
                                                      .isReadOnly.value
                                                      ? null
                                                      : (String? newValue) {
                                                    if (newValue != null) {
                                                      trainerProfileController
                                                          .selectedGender
                                                          .value =
                                                          newValue;
                                                    }
                                                  },
                                                  disabledHint: Text(
                                                      trainerProfileController
                                                          .selectedGender.value
                                                          .toString()),
                                                  items: trainerProfileController
                                                      .Gender.map<
                                                      DropdownMenuItem<
                                                          String>>((
                                                      String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                )),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20.0,),
                                      Row(
                                        children: [
                                          Expanded(child: InputTextFormField(
                                              isReadOnly: trainerProfileController
                                                  .isReadOnly.value,
                                              label: "Mobile Number",
                                              keyboardType: TextInputType
                                                  .number,
                                              controller: trainerProfileController
                                                  .mobileNumberController)),
                                          const SizedBox(width: 15.0,),
                                          Expanded(child: InputTextFormField(
                                              isReadOnly: trainerProfileController
                                                  .isReadOnly.value,
                                              label: "Experience",
                                              keyboardType: TextInputType
                                                  .number,
                                              controller: trainerProfileController
                                                  .yearsofExperienceController)),
                                        ],
                                      ),
                                      const SizedBox(height: 20.0,),
                                      InputTextFormField(label: "Email ID",
                                          isReadOnly: trainerProfileController
                                              .isReadOnly.value,
                                          keyboardType: TextInputType
                                              .emailAddress,
                                          controller: trainerProfileController
                                              .emailController),
                                      const SizedBox(height: 20.0,),
                                      InputTextFormField(label: "Address",
                                          isReadOnly: trainerProfileController
                                              .isReadOnly.value,
                                          keyboardType: TextInputType.multiline,
                                          controller: trainerProfileController
                                              .addressController),
                                      const SizedBox(height: 20.0,),
                                      trainerProfileController.isReadOnly.value
                                          ?
                                      Container()
                                          : Row(
                                        children: [
                                          Expanded(

                                            child: OutlinedButton(
                                              onPressed: () {
                                                //TODO
                                              },
                                              child: const Text('Cancel'),
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Expanded(

                                            child: ElevatedButton(
                                              onPressed: () {
                                                trainerProfileController
                                                    .isSubmitted
                                                    .value = true;
                                                trainerProfileController.onUpdateTrainer();
                                              },

                                              child: const Text('Update',
                                                style: TextStyle(
                                                    color: AppColors.white),),
                                              style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty
                                                    .all(
                                                    AppColors.appThemeColor),),
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
                    )


                ),
                Positioned(
                    top: 80,
                    // Adjust this value to control the position of the card
                    left: 16,
                    right: 50.w,
                    child: SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: Obx(() {
                          return Card(
                            elevation: 10.0,
                            shape: CircleBorder(),
                            child: CircleAvatar(
                              radius: 75,
                              //foregroundImage: NetworkImage(trainerProfileController.userProfileImage.value),
                              backgroundImage: trainerProfileController.imagePath.isNotEmpty
                                  ? FileImage(File(trainerProfileController.imagePath.value.toString()))
                                  : null,


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
                                                          trainerProfileController.openCamera();

                                                        }, icon: Icon(Icons.camera_alt_outlined),iconSize: 50.0,),
                                                        Text("Camera")
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        IconButton(onPressed: (){
                                                          Navigator.pop(context);
                                                          trainerProfileController.openGallery();
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
                            ),
                          );
                        }),

                    )
                )
              ],
            );
          }),
    );
  }
}
