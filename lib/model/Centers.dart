

class CenterModel {
  final String name;
  final List<String> timeSlots;

  CenterModel(this.name, this.timeSlots);
}

class AssignTrainee {
  final String traineeName;
  final String centerName;
  final String timeslot;

  AssignTrainee(this.traineeName, this.centerName, this.timeslot);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AssignTrainee &&
        other.traineeName == traineeName &&
        other.centerName == centerName &&
        other.timeslot == timeslot;
  }

  @override
  int get hashCode => traineeName.hashCode ^ centerName.hashCode ^ timeslot.hashCode;
}
