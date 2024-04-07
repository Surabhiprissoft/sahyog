class AdminDashboardResponseModel {
  int? trainerCount;
  int? traineeCount;
  List<Centers>? centers;
  FeesStatusCounts? feesStatusCounts;

  AdminDashboardResponseModel(
      {this.trainerCount,
        this.traineeCount,
        this.centers,
        this.feesStatusCounts});

  AdminDashboardResponseModel.fromJson(Map<String, dynamic> json) {
    trainerCount = json['trainer_count'];
    traineeCount = json['trainee_count'];
    if (json['centers'] != null) {
      centers = <Centers>[];
      json['centers'].forEach((v) {
        centers!.add(new Centers.fromJson(v));
      });
    }
    feesStatusCounts = json['fees_status_counts'] != null
        ? new FeesStatusCounts.fromJson(json['fees_status_counts'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trainer_count'] = this.trainerCount;
    data['trainee_count'] = this.traineeCount;
    if (this.centers != null) {
      data['centers'] = this.centers!.map((v) => v.toJson()).toList();
    }
    if (this.feesStatusCounts != null) {
      data['fees_status_counts'] = this.feesStatusCounts!.toJson();
    }
    return data;
  }
}

class Centers {
  int? id;
  String? name;
  String? address;
  int? totalTrainees;
  List<AssignedTrainers>? assignedTrainers;

  Centers(
      {this.id,
        this.name,
        this.address,
        this.totalTrainees,
        this.assignedTrainers});

  Centers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    totalTrainees = json['total_trainees'];
    if (json['assigned_trainers'] != null) {
      assignedTrainers = <AssignedTrainers>[];
      json['assigned_trainers'].forEach((v) {
        assignedTrainers!.add(new AssignedTrainers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['total_trainees'] = this.totalTrainees;
    if (this.assignedTrainers != null) {
      data['assigned_trainers'] =
          this.assignedTrainers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AssignedTrainers {
  String? scheduledDate;
  String? currentDate;
  String? firstName;
  String? profilePhoto;
  String? timeslotStartTime;
  String? timeslotEndTime;

  AssignedTrainers(
      {this.scheduledDate,
        this.currentDate,
        this.firstName,
        this.profilePhoto,
        this.timeslotStartTime,
        this.timeslotEndTime});

  AssignedTrainers.fromJson(Map<String, dynamic> json) {
    scheduledDate = json['scheduled_date'];
    currentDate = json['current_date'];
    firstName = json['first_name'];
    profilePhoto = json['profile_photo'];
    timeslotStartTime = json['timeslot_start_time'];
    timeslotEndTime = json['timeslot_end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['scheduled_date'] = this.scheduledDate;
    data['current_date'] = this.currentDate;
    data['first_name'] = this.firstName;
    data['profile_photo'] = this.profilePhoto;
    data['timeslot_start_time'] = this.timeslotStartTime;
    data['timeslot_end_time'] = this.timeslotEndTime;
    return data;
  }
}

class FeesStatusCounts {
  int? trueCount;

  FeesStatusCounts({this.trueCount});

  FeesStatusCounts.fromJson(Map<String, dynamic> json) {
    trueCount = json['true_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['true_count'] = this.trueCount;
    return data;
  }
}
