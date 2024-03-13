import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sahyog/controller/ScheduleTrainerController.dart';
import 'package:sahyog/model/Centers.dart';
import 'package:sahyog/utils/app_colors.dart';

class StickyList extends StatelessWidget {
  // Sample list of centers
  final List<CenterModel> centers = [
    CenterModel('Center 1', ['07:00 am - 9:00 am', '09:00 am - 11:00 am', '2:00 pm - 4:00 pm']),
    CenterModel('Center 2', ['07:00 am - 9:00 am', '09:00 am - 11:00 am', '2:00 pm - 4:00 pm']),
    CenterModel('Center 3', ['07:00 am - 9:00 am', '09:00 am - 11:00 am', '2:00 pm - 4:00 pm']),
  ];

  var controller= Get.find<ScheduleTrainerController>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Centers and Time Slots'),
        ),
        body: ListView.builder(
          itemCount: centers.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    centers[index].name,
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: centers[index].timeSlots.length,
                  itemBuilder: (context, slotIndex) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  border: Border.all(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  centers[index].timeSlots[slotIndex],
                                  style: TextStyle(fontSize: 12.0, color: Colors.white),
                                ),
                              ),
                              SizedBox(width: 30.0),
                              Text(
                                "Assign Trainee",
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(width: 30.0),
                             /* InkWell(
                                  onTap: () {
                                    Get.defaultDialog(
                                      title: 'Checkbox Dialog',
                                      content: Obx(() {
                                        return Column(
                                          children: controller.names.map((name) {
                                            return CheckboxListTile(
                                              title: Text(name),
                                              value: controller.selectedNames.contains(name),
                                              onChanged: (value) {
                                                controller.toggleSelection(name);
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
                                            // Get.back();
                                            print(controller.selectedNames);
                                          },

                                          child: Text('Assign'),
                                        ),
                                      ],
                                    );
                                  },
                                  child: Icon(Icons.add, color: Colors.grey,)

                              )*/
                              InkWell(
                                onTap: () {
                                  Get.defaultDialog(
                                    title: 'Checkbox Dialog',
                                    content: Obx(() {
                                      return Column(
                                        children: controller.traineenames.map((name) {
                                          // Check for the presence of AssignTrainee object
                                          AssignTrainee trainee = AssignTrainee(name, centers[index].name, centers[index].timeSlots[slotIndex]);
                                          return CheckboxListTile(
                                            title: Text(name),
                                            value: controller.selectedNames.contains(trainee),
                                            onChanged: (value) {
                                              controller.toggleSelection(name, centers[index].name, centers[index].timeSlots[slotIndex], index);
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
                                          print(controller.selectedNames);
                                        },
                                        child: Text('Assign'),
                                      ),
                                    ],
                                  );
                                },
                                child: Icon(Icons.add, color: Colors.grey,),
                              ) //Earlier Code -12-3-2024
                            ],
                          ),
                          Obx(() {
                            return Wrap(
                              children: controller.selectedNames.map((trainee) {
                                if (trainee.centerName == centers[index].name && trainee.timeslot == centers[index].timeSlots[slotIndex]) {
                                  return Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Chip(
                                      deleteIconColor: Colors.white,
                                      label: Text(trainee.traineeName),
                                      backgroundColor: AppColors.redRacket,
                                      onDeleted: () {
                                        controller.toggleSelection(trainee.traineeName, trainee.centerName, trainee.timeslot, index);
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                                      ),
                                    ),
                                  );
                                } else {
                                  return SizedBox.shrink(); // Return an empty SizedBox for trainees not assigned to the current center and time slot
                                }
                              }).toList(),
                            );
                          })
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
    );
  }
}

