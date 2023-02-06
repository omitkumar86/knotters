class StudentGigModel {
  List<Data>? data;

  StudentGigModel({this.data});

  StudentGigModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? skillCategoryId;
  int? skillSubCategoryId;
  int? clientUserId;
  String? jobUniqueCode;
  String? projectTitle;
  String? projectDescription;
  int? experienceLevel;
  int? budgetType;
  int? budget;
  Null? budgetPerHour;
  Null? totalHour;
  Null? totalBudgetForClient;
  Null? publicVisibility;
  Null? freelancerWorkingType;
  Null? preferredFreelancerLocationCountry;
  Null? jobLocationCity;
  Null? jobStartingDate;
  String? jobStartingDateTimestamp;
  Null? jobEndingDate;
  String? jobEndingDateTimestamp;
  Null? jobTotalDuration;
  Null? jobTotalLength;
  Null? estimateProjectDurationType;
  Null? estimateProjectDurationTime;
  Null? estimateProjectDurationTimeTimestamp;
  Null? promotionType;
  String? jobPostSlug;
  Null? postExpireDate;
  String? postExpireDateTimestamp;
  int? status;
  String? createdAt;
  String? updatedAt;
  List<Skills>? skills;
  List<JobPostQuestions>? jobPostQuestions;
  List<JobPostFiles>? jobPostFiles;

  Data(
      {this.id,
        this.skillCategoryId,
        this.skillSubCategoryId,
        this.clientUserId,
        this.jobUniqueCode,
        this.projectTitle,
        this.projectDescription,
        this.experienceLevel,
        this.budgetType,
        this.budget,
        this.budgetPerHour,
        this.totalHour,
        this.totalBudgetForClient,
        this.publicVisibility,
        this.freelancerWorkingType,
        this.preferredFreelancerLocationCountry,
        this.jobLocationCity,
        this.jobStartingDate,
        this.jobStartingDateTimestamp,
        this.jobEndingDate,
        this.jobEndingDateTimestamp,
        this.jobTotalDuration,
        this.jobTotalLength,
        this.estimateProjectDurationType,
        this.estimateProjectDurationTime,
        this.estimateProjectDurationTimeTimestamp,
        this.promotionType,
        this.jobPostSlug,
        this.postExpireDate,
        this.postExpireDateTimestamp,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.skills,
        this.jobPostQuestions,
        this.jobPostFiles});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    skillCategoryId = json['skill_category_id'];
    skillSubCategoryId = json['skill_sub_category_id'];
    clientUserId = json['client_user_id'];
    jobUniqueCode = json['job_unique_code'];
    projectTitle = json['project_title'];
    projectDescription = json['project_description'];
    experienceLevel = json['experience_level'];
    budgetType = json['budget_type'];
    budget = json['budget'];
    budgetPerHour = json['budget_per_hour'];
    totalHour = json['total_hour'];
    totalBudgetForClient = json['total_budget_for_client'];
    publicVisibility = json['public_visibility'];
    freelancerWorkingType = json['freelancer_working_type'];
    preferredFreelancerLocationCountry =
    json['preferred_freelancer_location_country'];
    jobLocationCity = json['job_location_city'];
    jobStartingDate = json['job_starting_date'];
    jobStartingDateTimestamp = json['job_starting_date_timestamp'];
    jobEndingDate = json['job_ending_date'];
    jobEndingDateTimestamp = json['job_ending_date_timestamp'];
    jobTotalDuration = json['job_total_duration'];
    jobTotalLength = json['job_total_length'];
    estimateProjectDurationType = json['estimate_project_duration_type'];
    estimateProjectDurationTime = json['estimate_project_duration_time'];
    estimateProjectDurationTimeTimestamp =
    json['estimate_project_duration_time_timestamp'];
    promotionType = json['promotion_type'];
    jobPostSlug = json['job_post_slug'];
    postExpireDate = json['post_expire_date'];
    postExpireDateTimestamp = json['post_expire_date_timestamp'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['skills'] != null) {
      skills = <Skills>[];
      json['skills'].forEach((v) {
        skills!.add(new Skills.fromJson(v));
      });
    }
    if (json['job_post_questions'] != null) {
      jobPostQuestions = <JobPostQuestions>[];
      json['job_post_questions'].forEach((v) {
        jobPostQuestions!.add(new JobPostQuestions.fromJson(v));
      });
    }
    if (json['job_post_files'] != null) {
      jobPostFiles = <JobPostFiles>[];
      json['job_post_files'].forEach((v) {
        jobPostFiles!.add(new JobPostFiles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['skill_category_id'] = this.skillCategoryId;
    data['skill_sub_category_id'] = this.skillSubCategoryId;
    data['client_user_id'] = this.clientUserId;
    data['job_unique_code'] = this.jobUniqueCode;
    data['project_title'] = this.projectTitle;
    data['project_description'] = this.projectDescription;
    data['experience_level'] = this.experienceLevel;
    data['budget_type'] = this.budgetType;
    data['budget'] = this.budget;
    data['budget_per_hour'] = this.budgetPerHour;
    data['total_hour'] = this.totalHour;
    data['total_budget_for_client'] = this.totalBudgetForClient;
    data['public_visibility'] = this.publicVisibility;
    data['freelancer_working_type'] = this.freelancerWorkingType;
    data['preferred_freelancer_location_country'] =
        this.preferredFreelancerLocationCountry;
    data['job_location_city'] = this.jobLocationCity;
    data['job_starting_date'] = this.jobStartingDate;
    data['job_starting_date_timestamp'] = this.jobStartingDateTimestamp;
    data['job_ending_date'] = this.jobEndingDate;
    data['job_ending_date_timestamp'] = this.jobEndingDateTimestamp;
    data['job_total_duration'] = this.jobTotalDuration;
    data['job_total_length'] = this.jobTotalLength;
    data['estimate_project_duration_type'] = this.estimateProjectDurationType;
    data['estimate_project_duration_time'] = this.estimateProjectDurationTime;
    data['estimate_project_duration_time_timestamp'] =
        this.estimateProjectDurationTimeTimestamp;
    data['promotion_type'] = this.promotionType;
    data['job_post_slug'] = this.jobPostSlug;
    data['post_expire_date'] = this.postExpireDate;
    data['post_expire_date_timestamp'] = this.postExpireDateTimestamp;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.skills != null) {
      data['skills'] = this.skills!.map((v) => v.toJson()).toList();
    }
    if (this.jobPostQuestions != null) {
      data['job_post_questions'] =
          this.jobPostQuestions!.map((v) => v.toJson()).toList();
    }
    if (this.jobPostFiles != null) {
      data['job_post_files'] =
          this.jobPostFiles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Skills {
  int? id;
  int? skillCategoryId;
  int? skillSubCategoryId;
  String? skillName;
  String? slug;
  int? status;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Skills(
      {this.id,
        this.skillCategoryId,
        this.skillSubCategoryId,
        this.skillName,
        this.slug,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.pivot});

  Skills.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    skillCategoryId = json['skill_category_id'];
    skillSubCategoryId = json['skill_sub_category_id'];
    skillName = json['skill_name'];
    slug = json['slug'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['skill_category_id'] = this.skillCategoryId;
    data['skill_sub_category_id'] = this.skillSubCategoryId;
    data['skill_name'] = this.skillName;
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? jobPostId;
  int? skillId;

  Pivot({this.jobPostId, this.skillId});

  Pivot.fromJson(Map<String, dynamic> json) {
    jobPostId = json['job_post_id'];
    skillId = json['skill_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['job_post_id'] = this.jobPostId;
    data['skill_id'] = this.skillId;
    return data;
  }
}

class JobPostQuestions {
  int? id;
  String? question;
  String? slug;
  int? status;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  JobPostQuestions(
      {this.id,
        this.question,
        this.slug,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.pivot});

  JobPostQuestions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    slug = json['slug'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}



class JobPostFiles {
  int? id;
  int? jobPostId;
  String? fileUrl;
  String? fileType;
  int? fileSize;
  String? createdAt;
  String? updatedAt;

  JobPostFiles(
      {this.id,
        this.jobPostId,
        this.fileUrl,
        this.fileType,
        this.fileSize,
        this.createdAt,
        this.updatedAt});

  JobPostFiles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobPostId = json['job_post_id'];
    fileUrl = json['file_url'];
    fileType = json['file_type'];
    fileSize = json['file_size'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['job_post_id'] = this.jobPostId;
    data['file_url'] = this.fileUrl;
    data['file_type'] = this.fileType;
    data['file_size'] = this.fileSize;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
