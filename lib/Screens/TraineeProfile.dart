import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sahyog/controller/TraineeProfileController.dart';

import '../model/ResponseModel/CenterResponseModel.dart';
import '../utils/AppCommonMethods.dart';
import '../utils/app_colors.dart';
import '../utils/app_validation.dart';
import '../widgets/common_textfield.dart';

class TraineeProfile extends GetView<TraineeProfileController> {
  TraineeProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TraineeProfileController>(builder: (traineeProfileController) {
      return Scaffold(
          body: Stack(
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
                              "Trainee Profile",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontStyle: FontStyle.normal,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              )
                          ),
                          IconButton(onPressed: () {
                            /*if (trainerProfileController.isReadOnly.value) {
                      trainerProfileController.isReadOnly.value = false;
                      trainerProfileController.update();
                    } else {
                      trainerProfileController.isReadOnly.value = true;
                      trainerProfileController.update();
                    }*/
                          },
                              icon: Icon(
                                Icons.edit, color: Colors.white, size: 25.0,)
                          ),
                          IconButton(onPressed: () {

                          },
                              icon: Icon(
                                Icons.notifications_none, color: Colors.white,
                                size: 25.0,)
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
                      padding: EdgeInsets.only(top: 10.h),
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
                        child: Container(
                          child: Builder(
                              builder: (context) {
                                return Form(
                                  key: traineeProfileController.profileTraineeFormKey,
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
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
                                              child: InputTextFormField(
                                                label: "First Name",
                                                keyboardType: TextInputType
                                                    .text,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp(
                                                      r'[a-zA-Z]')),
                                                ],
                                                controller: traineeProfileController
                                                    .firstNameController,),
                                            ),
                                            const SizedBox(width: 15.0,),
                                            Expanded(
                                              child: InputTextFormField(
                                                label: "Last Name",
                                                keyboardType: TextInputType
                                                    .text,
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp(
                                                      r'[a-zA-Z]')),
                                                ],
                                                controller: traineeProfileController
                                                    .lastNameController,),
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
                                                  prefixIcon: Icon(Icons
                                                      .calendar_month_sharp),
                                                ),
                                                validator: (value) {
                                                  return AppValidation
                                                      .validateforrequiredfield(
                                                      value!, ""!);
                                                },
                                                readOnly: true,
                                                onTap: () async {
                                                  var selectedDate = await getDatePicker(
                                                      context);
                                                  controller.ageController
                                                      .text =
                                                      selectedDate.toString();
                                                },

                                              ),
                                            ),
                                            const SizedBox(width: 15.0,),
                                            Expanded(
                                                child: Obx(() =>
                                                    DropdownButtonFormField<
                                                        String>(
                                                      value: traineeProfileController
                                                          .selectedGender.value
                                                          .isEmpty
                                                          ? null
                                                          : traineeProfileController
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

                                                        errorText: traineeProfileController
                                                            .isSubmitted
                                                            .value &&
                                                            traineeProfileController
                                                                .selectedGender
                                                                .value.isEmpty
                                                            ? ""
                                                            : null,
                                                      ),
                                                      onChanged: (
                                                          String? newValue) {
                                                        if (newValue != null) {
                                                          traineeProfileController
                                                              .selectedGender
                                                              .value = newValue;
                                                        }
                                                      },
                                                      items: traineeProfileController
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
                                                    )))
                                          ],
                                        ),
                                        const SizedBox(height: 20.0,),
                                        InputTextFormField(
                                            label: "Mobile Number",
                                            keyboardType: TextInputType
                                                .number,
                                            controller: traineeProfileController
                                                .mobileNumberController),

                                        const SizedBox(height: 20.0,),

                                        Obx(() =>
                                            DropdownButtonFormField<
                                                CenterResponseModel>(
                                              value: traineeProfileController
                                                  .selectedCenter.value,
                                              decoration: InputDecoration(
                                                labelText: "Center",
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius
                                                        .all(
                                                        Radius.circular(
                                                            10.0))
                                                ),
                                                hintText: "Center",
                                                errorText: traineeProfileController
                                                    .isSubmitted
                                                    .value &&
                                                    traineeProfileController
                                                        .selectedCenter
                                                        .value == null
                                                    ? ""
                                                    : null,
                                              ),
                                              onChanged: (
                                                  CenterResponseModel? newValue) {
                                                traineeProfileController
                                                    .selectedCenter
                                                    .value = newValue;
                                              },
                                              items: traineeProfileController
                                                  .centerlist.map<
                                                  DropdownMenuItem<
                                                      CenterResponseModel>>((
                                                  CenterResponseModel center) {
                                                return DropdownMenuItem<
                                                    CenterResponseModel>(
                                                  value: center,
                                                  child: Text(center!
                                                      .name!),
                                                );
                                              }).toList(),
                                            )),

                                        const SizedBox(height: 20.0,),
                                        InputTextFormField(label: "Email ID",
                                            keyboardType: TextInputType
                                                .emailAddress,
                                            controller: traineeProfileController
                                                .emailController),
                                        const SizedBox(height: 20.0,),
                                        InputTextFormField(label: "Address",
                                            keyboardType: TextInputType
                                                .multiline,
                                            controller: traineeProfileController
                                                .addressController),
                                        const SizedBox(height: 20.0,),

                                        Obx(() =>
                                            DropdownButtonFormField<String>(
                                              value: traineeProfileController
                                                  .selectedLevel.value.isEmpty
                                                  ? null
                                                  : traineeProfileController
                                                  .selectedLevel.value,
                                              decoration: InputDecoration(
                                                labelText: "Training Level",
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius
                                                        .all(
                                                        Radius.circular(10.0))
                                                ),
                                                hintText: "Training Level",

                                                errorText: traineeProfileController
                                                    .isSubmitted.value &&
                                                    traineeProfileController
                                                        .selectedLevel.value
                                                        .isEmpty ? "" : null,
                                              ),
                                              onChanged: (String? newValue) {
                                                if (newValue != null) {
                                                  traineeProfileController
                                                      .selectedLevel.value =
                                                      newValue;
                                                }
                                              },
                                              items: traineeProfileController.level
                                                  .map<
                                                  DropdownMenuItem<String>>((
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
                                                    /*traineeProfileController
                                                        .isSubmitted.value =
                                                    true;
                                                    addTraineeController
                                                        .addTrainee();*/
                                                  },

                                                  child: const Text('Update',
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .white),),
                                                  style: ButtonStyle(
                                                    backgroundColor: MaterialStateProperty
                                                        .all(
                                                        AppColors
                                                            .appThemeColor),)
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
                      child: const CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(
                            "https://icons.veryicon.com/png/o/miscellaneous/two-color-icon-library/user-286.png"),
                      )

                  )
              )


            ],
          )

      );
    });
  }
}
