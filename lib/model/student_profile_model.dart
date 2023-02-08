class StudentProfileModel {
  User? user;
  List<Skills>? skills;
  List<dynamic>? uploadedFiles;

  StudentProfileModel({this.user, this.skills, this.uploadedFiles});

  StudentProfileModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['skills'] != null) {
      skills = <Skills>[];
      json['skills'].forEach((v) {
        skills!.add(new Skills.fromJson(v));
      });
    }
    if (json['uploadedFiles'] != null) {
      uploadedFiles = <dynamic>[];
      json['uploadedFiles'].forEach((v) {
        //uploadedFiles!.add(new dynamic.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.skills != null) {
      data['skills'] = this.skills!.map((v) => v.toJson()).toList();
    }
    if (this.uploadedFiles != null) {
      data['uploadedFiles'] = this.uploadedFiles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  int? userDetailsId;
  String? name;
  String? email;
  dynamic? emailVerifiedAt;
  dynamic? twoFactorConfirmedAt;
  int? userRoleType;
  dynamic? accountType;
  int? accountStatus;
  int? submitStatus;
  dynamic? currentTeamId;
  dynamic? profilePhotoPath;
  String? createdAt;
  String? updatedAt;
  int? activeStatus;
  String? avatar;
  int? darkMode;
  String? messengerColor;
  UserDetails? userDetails;
  List<dynamic>? tradeLicenseFiles;

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
        this.userDetails,
        this.tradeLicenseFiles});

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
    if (json['trade_license_files'] != null) {
      tradeLicenseFiles = <dynamic>[];
      json['trade_license_files'].forEach((v) {
       //tradeLicenseFiles!.add(new dynamic.fromJson(v));
      });
    }
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
    if (this.tradeLicenseFiles != null) {
      data['trade_license_files'] =
          this.tradeLicenseFiles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserDetails {
  int? id;
  String? firstName;
  String? lastName;
  dynamic? surname;
  dynamic? country;
  dynamic? emirateStateName;
  dynamic? phone;
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
  dynamic? companyName;
  dynamic? companyEstablishYear;
  dynamic? companyStatus;
  dynamic? businessName;
  dynamic? companySize;
  dynamic? companySpeciality;
  dynamic? companyService;
  dynamic? tradeLicenseNo;
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

class Skills {
  int? id;
  int? skillCategoryId;
  int? skillSubCategoryId;
  String? skillName;
  String? slug;
  int? status;
  String? createdAt;
  String? updatedAt;

  Skills(
      {this.id,
        this.skillCategoryId,
        this.skillSubCategoryId,
        this.skillName,
        this.slug,
        this.status,
        this.createdAt,
        this.updatedAt});

  Skills.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    skillCategoryId = json['skill_category_id'];
    skillSubCategoryId = json['skill_sub_category_id'];
    skillName = json['skill_name'];
    slug = json['slug'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    return data;
  }
}
