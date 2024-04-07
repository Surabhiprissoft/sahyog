class TrainerListResponseModel {
  int? id;
  String? username;
  String? email;
  String? role;
  String? profilePhoto;
  String? firstName;
  String? lastName;
  String? gender;
  String? dob;
  String? phone;
  String? address;
  int? center;
  bool? isActive;
  String? createdAt;
  String? modifiedAt;
  int? yearOfExperience;
  String? trainingType;
  String? discount;
  List<Schedule>? schedule;

  TrainerListResponseModel(
      {this.id,
        this.username,
        this.email,
        this.role,
        this.profilePhoto,
        this.firstName,
        this.lastName,
        this.gender,
        this.dob,
        this.phone,
        this.address,
        this.center,
        this.isActive,
        this.createdAt,
        this.modifiedAt,
        this.yearOfExperience,
        this.trainingType,
        this.discount,
        this.schedule});

  TrainerListResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    role = json['role'];
    profilePhoto = json['profile_photo'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    dob = json['dob'];
    phone = json['phone'];
    address = json['address'];
    center = json['center'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    modifiedAt = json['modified_at'];
    yearOfExperience = json['year_of_experience'];
    trainingType = json['training_type'];
    discount = json['discount'];
    if (json['schedule'] != null) {
      schedule = <Schedule>[];
      json['schedule'].forEach((v) {
        schedule!.add(new Schedule.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['role'] = this.role;
    data['profile_photo'] = this.profilePhoto;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['center'] = this.center;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['modified_at'] = this.modifiedAt;
    data['year_of_experience'] = this.yearOfExperience;
    data['training_type'] = this.trainingType;
    data['discount'] = this.discount;
    if (this.schedule != null) {
      data['schedule'] = this.schedule!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Schedule {
  String? date;
  String? center;
  String? startTimme;
  String? endTime;
  int? userId;

  Schedule(
      {this.date, this.center, this.startTimme, this.endTime, this.userId});

  Schedule.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    center = json['center'];
    startTimme = json['start_timme'];
    endTime = json['end_time'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['center'] = this.center;
    data['start_timme'] = this.startTimme;
    data['end_time'] = this.endTime;
    data['user_id'] = this.userId;
    return data;
  }
}
