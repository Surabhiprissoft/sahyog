
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sahyog/controller/trainerController/AddTrainerController.dart';
import 'package:sahyog/utils/AppCommonMethods.dart';
import 'package:sahyog/utils/app_colors.dart';
import 'package:sahyog/utils/app_validation.dart';
import 'package:sahyog/widgets/CustomTopBar.dart';
import 'package:sahyog/widgets/common_textfield.dart';
import 'package:sahyog/widgets/other_common_widget.dart';

class AddTrainer extends GetView<AddTrainerController> {
   AddTrainer({super.key});
   final addTrainerController  = Get.find<AddTrainerController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Positioned(
              top: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 30.h,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Top_bg.png'),
                      fit: BoxFit.cover, // Adjust the BoxFit as needed
                    ),
                    color: Colors.blue
                ),
                child:  Padding(
                  padding: EdgeInsets.only(left:2.w,bottom: 16.h,right: 6.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,)),
                          Text(
                              "Add Trainer",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontStyle: FontStyle.normal,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              )
                          ),
                        ],
                      ),

                    ],
                  ),
                ),


              )
          ),
          Positioned  (
              top: 20.h,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                 // height: 100.h,
                padding: EdgeInsets.only(top: 10.h),
                width: MediaQuery.of(context).size.width,
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
                            key: addTrainerController.trainerFormKey,
                            child: Container(
                              margin: const EdgeInsets.only(left: 20.0,right: 20.0,bottom:20.0),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  const SizedBox(height: 30.0,),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: InputTextFormField(label: "First Name",keyboardType: TextInputType.text,controller:addTrainerController.firstNameController,inputFormatters: [
                                          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                                        ]),
                                      ),
                                      const SizedBox(width: 15.0,),
                                      Expanded(
                                        child: InputTextFormField(label: "Last Name",keyboardType: TextInputType.text,controller:addTrainerController.lastNameController,inputFormatters: [
                                          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                                        ]),
                                      ),
                                    ],
                                  ),


                                  const SizedBox(height: 20.0,),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          controller: controller.ageController,
                                          decoration: const InputDecoration(
                                            label: Text("DOB"),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                            ),
                                            prefixIcon: Icon(Icons.calendar_month_sharp),
                                          ),
                                      validator: (value) {
                                        return AppValidation.validateforrequiredfield(value!!,"");
                                      },
                                          readOnly: true,
                                          onTap: ()async{
                                              var selectedDate = await getDatePicker(context);
                                              controller.ageController.text = selectedDate.toString();
                                          },
                                        
                                        ),
                                      ),
                                      //Expanded(child: InputTextFormField(label: "Age",keyboardType: TextInputType.number,controller:addTrainerController.ageController)),
                                      const SizedBox(width: 15.0,),
                                      Expanded(
                                        child: Obx(() =>
                                            DropdownButtonFormField<String>(
                                              value: addTrainerController.selectedGender.value.isEmpty ? null : addTrainerController.selectedGender.value,
                                              decoration: InputDecoration(
                                                labelText: "Gender",
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                                                ),
                                                hintText: "Gender",
                                        
                                                errorText: addTrainerController.isSubmitted.value && addTrainerController.selectedGender.value.isEmpty ? "" : null,
                                              ),
                                              onChanged: (String? newValue) {
                                                if (newValue != null)
                                                {

                                                  addTrainerController.selectedGender.value = newValue;
                                                }
                                              },
                                              items: addTrainerController.Gender.map<DropdownMenuItem<String>>((
                                                  String value) {
                                                return DropdownMenuItem<String>(
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
                                      Expanded(child: InputTextFormField(label: "Mobile Number",keyboardType: TextInputType.number,controller:addTrainerController.mobileNumberController)),
                                      const SizedBox(width: 15.0,),
                                      Expanded(child: InputTextFormField(label: "Experience(Yrs)",keyboardType: TextInputType.number,controller:addTrainerController.yearsofExperienceController)),
                                    ],
                                  ),
                                  const SizedBox(height: 20.0,),
                                  InputTextFormField(label: "Email ID",keyboardType: TextInputType.emailAddress,controller:addTrainerController.emailController),
                                  const SizedBox(height: 20.0,),
                                  InputTextFormField(label: "Address",keyboardType: TextInputType.multiline,controller:addTrainerController.addressController),
                                  const SizedBox(height: 20.0,),
                                  Row(
                                    children: [
                                      Expanded(

                                        child: OutlinedButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(

                                        child: ElevatedButton(

                                          onPressed: () {
                                            addTrainerController.isSubmitted.value = true;
                                            addTrainerController.onAddTrainer();

                                          },

                                          child: const Text('Add',style: TextStyle(color: AppColors.white),),
                                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.appThemeColor),),
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
              top: 10.h,
              // Adjust this value to control the position of the card
              left: 20,
              right: 50.w,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child:Center(
                  child:Obx(() {
                    return Stack(
                      children: [
                        // Your CircleAvatar widget
                        Card(
                          elevation: 10.0,
                          shape: CircleBorder(),
                          child: CircleAvatar(
                            radius: 75,
                            foregroundImage: addTrainerController.imagePath.isEmpty ? NetworkImage("https://icons.veryicon.com/png/o/miscellaneous/two-color-icon-library/user-286.png"):null,
                            backgroundImage: addTrainerController.imagePath.isNotEmpty
                                ? FileImage(File(addTrainerController.imagePath.toString()))
                                : null,
                          ),
                        ),
                        // Camera icon positioned on top of the stack
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 100,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  addTrainerController.openCamera();
                                                },
                                                icon: Icon(Icons.camera_alt_outlined),
                                                iconSize: 50.0,
                                              ),
                                              Text("Camera"),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  addTrainerController.openGallery();
                                                },
                                                icon: Icon(Icons.photo_album_outlined),
                                                iconSize: 50.0,
                                              ),
                                              Text("Album"),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.white70,
                              child: Icon(Icons.add_a_photo_outlined),
                            ),
                          ),
                        ),
                      ],
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


