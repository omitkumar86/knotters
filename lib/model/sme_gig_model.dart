class SmeGigModel {
  int? id;
  String? skillCategoryId;
  String? skillSubCategoryId;
  String? clientUserId;
  String? jobUniqueCode;
  String? projectTitle;
  String? projectDescription;
  String? experienceLevel;
  dynamic? budgetType;
  String? budget;
  dynamic? budgetPerHour;
  dynamic? totalHour;
  dynamic? totalBudgetForClient;
  dynamic? publicVisibility;
  dynamic? freelancerWorkingType;
  dynamic? preferredFreelancerLocationCountry;
  dynamic? jobLocationCity;
  dynamic? jobStartingDate;
  String? jobStartingDateTimestamp;
  dynamic? jobEndingDate;
  String? jobEndingDateTimestamp;
  dynamic? jobTotalDuration;
  dynamic? jobTotalLength;
  dynamic? estimateProjectDurationType;
  dynamic? estimateProjectDurationTime;
  dynamic? estimateProjectDurationTimeTimestamp;
  dynamic? promotionType;
  String? jobPostSlug;
  dynamic? postExpireDate;
  String? postExpireDateTimestamp;
  String? status;
  String? createdAt;
  String? updatedAt;
  User? user;
  List<JobPostFiles>? jobPostFiles;
  SkillCategory? skillCategory;
  SkillSubCategory? skillSubCategory;
  List<dynamic>? skills;

  SmeGigModel(
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
        this.user,
        this.jobPostFiles,
        this.skillCategory,
        this.skillSubCategory,
        this.skills});

  SmeGigModel.fromJson(Map<String, dynamic> json) {
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
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['job_post_files'] != null) {
      jobPostFiles = <JobPostFiles>[];
      json['job_post_files'].forEach((v) {
        jobPostFiles!.add(new JobPostFiles.fromJson(v));
      });
    }
    skillCategory = json['skill_category'] != null
        ? new SkillCategory.fromJson(json['skill_category'])
        : null;
    skillSubCategory = json['skill_sub_category'] != null
        ? new SkillSubCategory.fromJson(json['skill_sub_category'])
        : null;
    if (json['skills'] != null) {
      skills = <dynamic>[];
      json['skills'].forEach((v) {
        //skills!.add(  dynamic.fromJson(v));
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
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.jobPostFiles != null) {
      data['job_post_files'] =
          this.jobPostFiles!.map((v) => v.toJson()).toList();
    }
    if (this.skillCategory != null) {
      data['skill_category'] = this.skillCategory!.toJson();
    }
    if (this.skillSubCategory != null) {
      data['skill_sub_category'] = this.skillSubCategory!.toJson();
    }
    if (this.skills != null) {
      data['skills'] = this.skills!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? userDetailsId;
  String? name;
  String? email;
  dynamic? emailVerifiedAt;
  dynamic? twoFactorConfirmedAt;
  String? userRoleType;
  dynamic? accountType;
  String? accountStatus;
  String? submitStatus;
  dynamic? currentTeamId;
  dynamic? profilePhotoPath;
  String? createdAt;
  String? updatedAt;
  String? activeStatus;
  String? avatar;
  String? darkMode;
  String? messengerColor;
  UserDetails? userDetails;

  User(
      {this.id,
        this.userDetailsId,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.twoFactorConfirmedAt,
        this.userRoleType,
        this.accountType,
        this.accountStatus,
        this.submitStatus,
        this.currentTeamId,
        this.profilePhotoPath,
        this.createdAt,
        this.updatedAt,
        this.activeStatus,
        this.avatar,
        this.darkMode,
        this.messengerColor,
        this.userDetails});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userDetailsId = json['user_details_id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    twoFactorConfirmedAt = json['two_factor_confirmed_at'];
    userRoleType = json['user_role_type'];
    accountType = json['account_type'];
    accountStatus = json['account_status'];
    submitStatus = json['submit_status'];
    currentTeamId = json['current_team_id'];
    profilePhotoPath = json['profile_photo_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    activeStatus = json['active_status'];
    avatar = json['avatar'];
    darkMode = json['dark_mode'];
    messengerColor = json['messenger_color'];
    userDetails = json['user_details'] != null
        ? new UserDetails.fromJson(json['user_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_details_id'] = this.userDetailsId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['two_factor_confirmed_at'] = this.twoFactorConfirmedAt;
    data['user_role_type'] = this.userRoleType;
    data['account_type'] = this.accountType;
    data['account_status'] = this.accountStatus;
    data['submit_status'] = this.submitStatus;
    data['current_team_id'] = this.currentTeamId;
    data['profile_photo_path'] = this.profilePhotoPath;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['active_status'] = this.activeStatus;
    data['avatar'] = this.avatar;
    data['dark_mode'] = this.darkMode;
    data['messenger_color'] = this.messengerColor;
    if (this.userDetails != null) {
      data['user_details'] = this.userDetails!.toJson();
    }
    return data;
  }
}

class UserDetails {
  int? id;
  String? firstName;
  String? lastName;
  dynamic? surname;
  String? country;
  String? emirateStateName;
  String? phone;
  String? profileImage;
  dynamic? gender;
  dynamic? educationalStatus;
  dynamic? universityName;
  dynamic? freelancerJobTitle;
  dynamic? freelancerLanguage;
  dynamic? bankAccountNo;
  dynamic? bankName;
  dynamic? emiratesIdNo;
  dynamic? description;
  dynamic? workingType;
  String? companyName;
  String? companyEstablishYear;
  String? companyStatus;
  String? businessName;
  String? companySize;
  String? companySpeciality;
  String? companyService;
  String? tradeLicenseNo;
  String? createdAt;
  String? updatedAt;

  UserDetails(
      {this.id,
        this.firstName,
        this.lastName,
        this.surname,
        this.country,
        this.emirateStateName,
        this.phone,
        this.profileImage,
        this.gender,
        this.educationalStatus,
        this.universityName,
        this.freelancerJobTitle,
        this.freelancerLanguage,
        this.bankAccountNo,
        this.bankName,
        this.emiratesIdNo,
        this.description,
        this.workingType,
        this.companyName,
        this.companyEstablishYear,
        this.companyStatus,
        this.businessName,
        this.companySize,
        this.companySpeciality,
        this.companyService,
        this.tradeLicenseNo,
        this.createdAt,
        this.updatedAt});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    surname = json['surname'];
    country = json['country'];
    emirateStateName = json['emirate_state_name'];
    phone = json['phone'];
    profileImage = json['profile_image'];
    gender = json['gender'];
    educationalStatus = json['educational_status'];
    universityName = json['university_name'];
    freelancerJobTitle = json['freelancer_job_title'];
    freelancerLanguage = json['freelancer_language'];
    bankAccountNo = json['bank_account_no'];
    bankName = json['bank_name'];
    emiratesIdNo = json['emirates_id_no'];
    description = json['description'];
    workingType = json['Working_type'];
    companyName = json['company_name'];
    companyEstablishYear = json['company_establish_year'];
    companyStatus = json['company_status'];
    businessName = json['business_name'];
    companySize = json['company_size'];
    companySpeciality = json['company_speciality'];
    companyService = json['company_service'];
    tradeLicenseNo = json['trade_license_no'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['surname'] = this.surname;
    data['country'] = this.country;
    data['emirate_state_name'] = this.emirateStateName;
    data['phone'] = this.phone;
    data['profile_image'] = this.profileImage;
    data['gender'] = this.gender;
    data['educational_status'] = this.educationalStatus;
    data['university_name'] = this.universityName;
    data['freelancer_job_title'] = this.freelancerJobTitle;
    data['freelancer_language'] = this.freelancerLanguage;
    data['bank_account_no'] = this.bankAccountNo;
    data['bank_name'] = this.bankName;
    data['emirates_id_no'] = this.emiratesIdNo;
    data['description'] = this.description;
    data['Working_type'] = this.workingType;
    data['company_name'] = this.companyName;
    data['company_establish_year'] = this.companyEstablishYear;
    data['company_status'] = this.companyStatus;
    data['business_name'] = this.businessName;
    data['company_size'] = this.companySize;
    data['company_speciality'] = this.companySpeciality;
    data['company_service'] = this.companyService;
    data['trade_license_no'] = this.tradeLicenseNo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class JobPostFiles {
  int? id;
  String? jobPostId;
  String? fileUrl;
  String? fileType;
  dynamic? fileSize;
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

class SkillCategory {
  int? id;
  String? categoryName;
  String? slug;
  String? status;
  String? createdAt;
  String? updatedAt;

  SkillCategory(
      {this.id,
        this.categoryName,
        this.slug,
        this.status,
        this.createdAt,
        this.updatedAt});

  SkillCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    slug = json['slug'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class SkillSubCategory {
  int? id;
  String? skillCategoryId;
  String? subCategoryName;
  String? slug;
  String? status;
  String? createdAt;
  String? updatedAt;

  SkillSubCategory(
      {this.id,
        this.skillCategoryId,
        this.subCategoryName,
        this.slug,
        this.status,
        this.createdAt,
        this.updatedAt});

  SkillSubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    skillCategoryId = json['skill_category_id'];
    subCategoryName = json['sub_category_name'];
    slug = json['slug'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['skill_category_id'] = this.skillCategoryId;
    data['sub_category_name'] = this.subCategoryName;
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
