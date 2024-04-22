import 'dart:convert';

class GeoLocation {
  final String attendancestatus;
  final int centerId;
  final String timeSlot;
  final DateTime dateTime; // New DateTime field

  GeoLocation(this.attendancestatus, this.centerId, this.timeSlot, this.dateTime);

  Map<String, dynamic> toMap() {
    return {
      'AttendanceStatus': attendancestatus,
      'centerId': centerId,
      'timeSlot': timeSlot,
      'dateTime': dateTime.toIso8601String(), // Convert DateTime to string
    };
  }

  factory GeoLocation.fromMap(Map<String, dynamic> map) {
    return GeoLocation(
      map['AttendanceStatus'],
      map['centerId'],
      map['timeSlot'],
      DateTime.parse(map['dateTime']), // Parse DateTime from string
    );
  }

  @override
  String toString() {
    return 'GeoLocations {AttendanceStatus: $attendancestatus, centerId: $centerId, timeSlots: $timeSlot, dateTime: $dateTime}';
  }

  // Convert object to JSON string
  String toJson() => jsonEncode(toMap());

  // Factory method to create an object from JSON string
  factory GeoLocation.fromJson(String source) => GeoLocation.fromMap(jsonDecode(source));
}