

import 'dart:convert';

class CenterModel {
  final String name;
  final List<int> centerId;
  final List<String> timeSlots;
  late List<String>? status;


  @override
  String toString() {
    return 'CenterModel{name: $name, centerId: $centerId, timeSlots: $timeSlots, status: $status}';
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'centerId': centerId,
      'timeSlots': timeSlots,
      'status':status
    };
  }

  // Convert map to object
  factory CenterModel.fromMap(Map<String, dynamic> map) {
    return CenterModel(
      List<int>.from(map['centerId']),
      map['name'],
      List<String>.from(map['timeSlots']),
      status: map['status'], // Assign status from the map
    );
  }

  // Convert object to JSON string
  String toJson() => jsonEncode(toMap());

  // Factory method to create an object from JSON string
  factory CenterModel.fromJson(String source) => CenterModel.fromMap(jsonDecode(source));
  CenterModel(this.centerId,this.name, this.timeSlots,{this.status});
}

class AssignTrainee {
  final String traineeName;
  final String centerName;
  final String timeslot;
  final int centerId;
  final int userId;
  final int number_days;
  final int interval;
  final String CurrentDate;

  AssignTrainee(this.traineeName, this.centerName, this.timeslot,this.centerId, this.userId, this.number_days, this.interval, this.CurrentDate);


  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AssignTrainee &&
        other.traineeName == traineeName &&
        other.centerName == centerName &&
        other.timeslot == timeslot;
  }


  @override
  String toString() {
    return 'AssignTrainee{traineeName: $traineeName, centerName: $centerName, timeslot: $timeslot, centerId: $centerId, userId: $userId, number_days: $number_days, interval: $interval, CurrentDate: $CurrentDate}';
  }

  @override
  int get hashCode => traineeName.hashCode ^ centerName.hashCode ^ timeslot.hashCode;
}

class Tuple<X, Y> {
  final X item1;
  final Y item2;
  Tuple(this.item1, this.item2);
}
