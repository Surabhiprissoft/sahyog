class TrainerRegistrationResponseModel {
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
  String? center;
  String? createdAt;
  String? modifiedAt;
  int? yearOfExperience;
  String? trainingType;
  String? discount;

  TrainerRegistrationResponseModel(
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
        this.createdAt,
        this.modifiedAt,
        this.yearOfExperience,
        this.trainingType,
        this.discount});

  TrainerRegistrationResponseModel.fromJson(Map<String, dynamic> json) {
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
    createdAt = json['created_at'];
    modifiedAt = json['modified_at'];
    yearOfExperience = json['year_of_experience'];
    trainingType = json['training_type'];
    discount = json['discount'];
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
    data['created_at'] = this.createdAt;
    data['modified_at'] = this.modifiedAt;
    data['year_of_experience'] = this.yearOfExperience;
    data['training_type'] = this.trainingType;
    data['discount'] = this.discount;
    return data;
  }
}
