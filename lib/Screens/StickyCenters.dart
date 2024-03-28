import 'dart:ffi';

import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sahyog/controller/ScheduleTrainerController.dart';
import 'package:sahyog/model/Centers.dart';
import 'package:sahyog/utils/app_colors.dart';

class StickyList extends StatelessWidget {
  // Sample list of centers
  final List<CenterModel> centers = [
    CenterModel('Center 1',
        ['07:00 am - 9:00 am', '09:00 am - 11:00 am', '2:00 pm - 4:00 pm']),
    CenterModel('Center 2',
        ['07:00 am - 9:00 am', '09:00 am - 11:00 am', '2:00 pm - 4:00 pm']),
    CenterModel('Center 3',
        ['07:00 am - 9:00 am', '09:00 am - 11:00 am', '2:00 pm - 4:00 pm']),
    CenterModel('Center 4', [
      '07:00 am - 9:00 am',
      '09:00 am - 11:00 am',
      '2:00 pm - 4:00 pm',
      '6:00 pm - 8:00 pm'
    ]),
    CenterModel('Center 5', [
      '07:00 am - 9:00 am',
      '09:00 am - 11:00 am',
      '2:00 pm - 4:00 pm',
      '6:00 pm - 8:00 pm'
    ]),
  ];

  var controller = Get.find<ScheduleTrainerController>();
  var customeDate = DateTime.now().add(Duration(days: 7));

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          body:
          Column(
            children: [
              CalendarTimeline(
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: customeDate,
                onDateSelected: (date) => print(date),
                monthColor: Colors.blueGrey,
                dayColor: Colors.teal[200],
                activeDayColor: Colors.white,
                activeBackgroundDayColor: Colors.redAccent[100],
                dotsColor: Color(0xFF333A47),
                locale: 'en_ISO',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Trainer Assignment", style: TextStyle(
                      fontSize: 16.sp, fontWeight: FontWeight.w700),),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.content_paste_go)),
                      ElevatedButton(onPressed: () {
                        print(controller.selectedNames.toString());
                      }, child: Text("Save"))
                    ],
                  )
                ],
              ),
              SizedBox(height: 10.0),
              SingleChildScrollView(
                child: Container(
                  child: SizedBox(
                    height: 60.h,
                    child: ListView.builder(
                      itemCount: centers.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      // physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 10.0),
                              child: Container(
                                child: Row(
                                  children: [
                                    Icon(Icons.location_on_outlined,
                                      color: AppColors.appThemeColor,),
                                    Text(
                                      centers[index].name,
                                      style: TextStyle(fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.appThemeColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: centers[index].timeSlots.length,
                              itemBuilder: (context, slotIndex) {
                                return IntrinsicWidth(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Expanded(
                                        child: Card(
                                          elevation: 10.0,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 5.0),
                                            decoration: BoxDecoration(
                                              color: AppColors
                                                  .slotCardBackground,
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 2),
                                              borderRadius: BorderRadius
                                                  .circular(10),
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.all(
                                                          8.0),
                                                      child: Text(
                                                        centers[index]
                                                            .timeSlots[slotIndex],
                                                        style: TextStyle(
                                                            fontSize: 13.0,
                                                            color: AppColors
                                                                .appThemeColor),
                                                      ),
                                                    ),
                                                    SizedBox(width: 15.0),
                                                    //Earlier Code -12-3-2024
                                                  ],
                                                ),
                                                Obx(() {
                                                  return Wrap(
                                                    children: controller
                                                        .selectedNames.map((
                                                        trainee) {
                                                      if (trainee.centerName ==
                                                          centers[index].name &&
                                                          trainee.timeslot ==
                                                              centers[index]
                                                                  .timeSlots[slotIndex]) {
                                                        return Container(
                                                          padding: const EdgeInsets
                                                              .all(2.0),
                                                          child: Chip(
                                                            deleteIconColor: Colors
                                                                .white,

                                                            label: Text(trainee
                                                                .traineeName),
                                                            backgroundColor: AppColors
                                                                .redRacket,
                                                            onDeleted: () {
                                                              controller
                                                                  .AssignedTrainer(
                                                                  trainee
                                                                      .traineeName,
                                                                  trainee
                                                                      .centerName,
                                                                  trainee
                                                                      .timeslot,
                                                                  index,controller.selectedScheduleDays.value,controller.selectedInterval.value,"2024-03-29");
                                                            },
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius
                                                                  .circular(
                                                                  20), // Adjust the radius as needed
                                                            ),
                                                          ),
                                                        );
                                                      } else {
                                                        return SizedBox
                                                            .shrink(); // Return an empty SizedBox for trainees not assigned to the current center and time slot
                                                      }
                                                    }).toList(),
                                                  );
                                                })
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.defaultDialog(
                                                title: 'Checkbox Dialog',
                                                content: Obx(() {
                                                  return Column(
                                                    children: controller
                                                        .traineenames.map((
                                                        name) {
                                                      AssignTrainee trainee = AssignTrainee(
                                                          name,
                                                          centers[index].name,
                                                          centers[index]
                                                              .timeSlots[slotIndex],controller.selectedScheduleDays.value,controller.selectedInterval.value,"2024-03-29");
                                                      return CheckboxListTile(
                                                        title: Text(name),
                                                        value: controller
                                                            .selectedNames
                                                            .contains(trainee),
                                                        onChanged: (value) {
                                                          if (value != null) {

                                                            if (value) {
                                                              controller.selectedScheduleDays.value=1;
                                                              controller.showCustomDaysTextField.value = false;
                                                              controller.showIntervalDaysTextField.value = false;


                                                              if(controller.toggleSelection(trainee
                                                                  .traineeName,
                                                                  trainee
                                                                      .centerName,
                                                                  trainee
                                                                      .timeslot,
                                                                  index)==false){
                                                                Get.defaultDialog(
                                                                  title: "Choose slot scheduling",
                                                                  content: Obx(() {
                                                                    return Column(
                                                                      children: [
                                                                        RadioListTile<int>(
                                                                          title: Text('Single Day'),
                                                                          value: 1,
                                                                          groupValue: controller.selectedScheduleDays.value,
                                                                          onChanged: (value) {
                                                                            controller.showCustomDaysTextField.value = false;
                                                                            controller.showIntervalDaysTextField.value = false;// Hide custom days text field
                                                                            controller.selectedScheduleDays.value = value!;
                                                                            controller.selectedInterval.value=1;
                                                                          },
                                                                        ),
                                                                        RadioListTile<int>(
                                                                          title: Text('By Week'),
                                                                          value: 7,
                                                                          groupValue: controller.selectedScheduleDays.value,
                                                                          onChanged: (value) {
                                                                            controller.showCustomDaysTextField.value = false; // Hide custom days text field
                                                                            controller.showIntervalDaysTextField.value = false; // Hide custom days text field
                                                                            controller.selectedScheduleDays.value = value!;
                                                                            controller.selectedInterval.value=1;
                                                                          },
                                                                        ),
                                                                        RadioListTile<int>(
                                                                          title: Text('By Month'),
                                                                          value: 30,
                                                                          groupValue: controller.selectedScheduleDays.value,
                                                                          onChanged: (value) {
                                                                            controller.showCustomDaysTextField.value = false;
                                                                            controller.showIntervalDaysTextField.value = false;// Hide custom days text field
                                                                            controller.selectedScheduleDays.value = value!;
                                                                            controller.selectedInterval.value=1;
                                                                          },
                                                                        ),

                                                                        RadioListTile<int>(
                                                                          title: Text('Custom Days'),
                                                                          value: -1, // Use a unique value to represent custom days
                                                                          groupValue: controller.selectedScheduleDays.value,
                                                                          onChanged: (value) {
                                                                            controller.selectedInterval.value=2;
                                                                            if (value == -1) {
                                                                              // Show custom days text field
                                                                              controller.showCustomDaysTextField.value = true;
                                                                            } else {
                                                                              // Hide custom days text field
                                                                              controller.showCustomDaysTextField.value = false;
                                                                            }
                                                                            controller.showIntervalDaysTextField.value = false;
                                                                            controller.selectedScheduleDays.value = value!;
                                                                          },
                                                                        ),
                                                                        // Text field for custom days
                                                                        Obx(() {
                                                                          return controller.showCustomDaysTextField.value
                                                                              ? TextField(
                                                                            decoration: InputDecoration(
                                                                              labelText: "Enter Number of days",
                                                                              border: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                                              ),
                                                                            ),
                                                                            keyboardType: TextInputType.number,
                                                                            onChanged: (value) {
                                                                              print("Entered value :$value");
                                                                              int? parsedValue = int.tryParse(value);
                                                                              controller.selectedScheduleDays.value=parsedValue!;
                                                                            },
                                                                          )
                                                                              : SizedBox.shrink();
                                                                        }),


                                                                        RadioListTile<int>(
                                                                          title: Text('Interval'),
                                                                          value: -2, // Use a unique value to represent custom days
                                                                          groupValue: controller.selectedScheduleDays.value,
                                                                          onChanged: (value) {
                                                                            controller.selectedInterval.value=2;
                                                                            if (value == -2) {
                                                                              // Show custom days text field
                                                                              controller.showIntervalDaysTextField.value = true;
                                                                            } else {
                                                                              // Hide custom days text field
                                                                              controller.showIntervalDaysTextField.value = false;
                                                                            }
                                                                            controller.showCustomDaysTextField.value = false;
                                                                            controller.selectedScheduleDays.value = value!;
                                                                          },
                                                                        ),
                                                                        // Text field for custom days
                                                                        Obx(() {
                                                                          return controller.showIntervalDaysTextField.value
                                                                              ? TextField(
                                                                            decoration: InputDecoration(
                                                                              labelText: "Number of days for interval",
                                                                              border: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                                              ),
                                                                            ),
                                                                            keyboardType: TextInputType.number,
                                                                            onChanged: (value) {
                                                                              print("Entered value :$value");
                                                                              int? parsedValue = int.tryParse(value);
                                                                              controller.selectedScheduleDays.value=parsedValue!;
                                                                            },
                                                                          )
                                                                              : SizedBox.shrink();
                                                                        }),
                                                                      ],
                                                                    );
                                                                  }),
                                                                  actions: [
                                                                    ElevatedButton(
                                                                      onPressed: () {
                                                                        Get.back();
                                                                      },
                                                                      child: Text('Close'),
                                                                    ),
                                                                    ElevatedButton(
                                                                      onPressed: () {
                                                                        controller
                                                                            .AssignedTrainer(
                                                                            trainee
                                                                                .traineeName,
                                                                            trainee
                                                                                .centerName,
                                                                            trainee
                                                                                .timeslot,
                                                                            index,controller.selectedScheduleDays.value,controller.selectedInterval.value,"2024-03-29");
                                                                        Get.back();
                                                                        print(controller.selectedNames);
                                                                      },
                                                                      child: Text('Assign'),
                                                                    ),
                                                                  ],
                                                                );

                                                              }

                                                            }
                                                          }
                                                        },
                                                      );
                                                    }).toList(),
                                                  );
                                                }),
                                                actions: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    child: Text('Close'),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Get.back();
                                                      print(controller
                                                          .selectedNames);
                                                    },
                                                    child: Text('Assign'),
                                                  ),
                                                ],
                                              );
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(top: 3.0),
                                              child: Icon(
                                                Icons.add_circle_outline,
                                                color: AppColors.appThemeColor,
                                                size: 30.0,),
                                            ),
                                          ),
                                        ],
                                      ),


                                    ],
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 10.0),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          )
      );
  }
}

