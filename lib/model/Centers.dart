

class CenterModel {
  final String name;
  final List<String> timeSlots;

  CenterModel(this.name, this.timeSlots);
}

class AssignTrainee {
  final String traineeName;
  final String centerName;
  final String timeslot;
  final int number_days;
  final int interval;
  final String CurrentDate;

  AssignTrainee(this.traineeName, this.centerName, this.timeslot, this.number_days, this.interval, this.CurrentDate);

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
    return 'AssignTrainee{traineeName: $traineeName, centerName: $centerName, timeslot: $timeslot, number_days: $number_days, interval: $interval, CurrentDate: $CurrentDate}';
  }

  @override
  int get hashCode => traineeName.hashCode ^ centerName.hashCode ^ timeslot.hashCode;
}
