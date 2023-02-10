

import 'dart:convert';

StudentProfileModel studentProfileModelFromJson(String str) => StudentProfileModel.fromJson(json.decode(str));

String studentProfileModelToJson(StudentProfileModel data) => json.encode(data.toJson());

class StudentProfileModel {
  StudentProfileModel({
    this.user,
    this.skills,
    this.uploadedFiles,
  });

  final User? user;
  final List<Skill>? skills;
  final List<UploadedFileElement>? uploadedFiles;

  factory StudentProfileModel.fromJson(Map<String, dynamic> json) => StudentProfileModel(
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      skills: json["skills"] == null ? [] : List<Skill>.from(json["skills"]!.map((x) => Skill.fromJson(x))),
  uploadedFiles: json["uploadedFiles"] == null ? [] : List<UploadedFileElement>.from(json["uploadedFiles"]!.map((x) => UploadedFileElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
  "user": user?.toJson(),
  "skills": skills == null ? [] : List<dynamic>.from(skills!.map((x) => x.toJson())),
  "uploadedFiles": uploadedFiles == null ? [] : List<dynamic>.from(uploadedFiles!.map((x) => x.toJson())),
};
}

class Skill {
  Skill({
    this.id,
    this.skillCategoryId,
    this.skillSubCategoryId,
    this.skillName,
    this.slug,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final int? skillCategoryId;
  final int? skillSubCategoryId;
  final String? skillName;
  final String? slug;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
    id: json["id"],
    skillCategoryId: json["skill_category_id"],
    skillSubCategoryId: json["skill_sub_category_id"],
    skillName: json["skill_name"],
    slug: json["slug"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "skill_category_id": skillCategoryId,
    "skill_sub_category_id": skillSubCategoryId,
    "skill_name": skillName,
    "slug": slug,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class UploadedFileElement {
  UploadedFileElement({
    this.id,
    this.userId,
    this.fileUrl,
    this.fileType,
    this.fileSize,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final int? userId;
  final String? fileUrl;
  final String? fileType;
  final dynamic fileSize;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory UploadedFileElement.fromJson(Map<String, dynamic> json) => UploadedFileElement(
    id: json["id"],
    userId: json["user_id"],
    fileUrl: json["file_url"],
    fileType: json["file_type"],
    fileSize: json["file_size"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "file_url": fileUrl,
    "file_type": fileType,
    "file_size": fileSize,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class User {
  User({
    this.id,
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
    this.tradeLicenseFiles,
  });

  final int? id;
  final int? userDetailsId;
  final String? name;
  final String? email;
  final dynamic emailVerifiedAt;
  final dynamic twoFactorConfirmedAt;
  final int? userRoleType;
  final dynamic accountType;
  final int? accountStatus;
  final int? submitStatus;
  final dynamic currentTeamId;
  final dynamic profilePhotoPath;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? activeStatus;
  final String? avatar;
  final int? darkMode;
  final String? messengerColor;
  final UserDetails? userDetails;
  final List<UploadedFileElement>? tradeLicenseFiles;

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["id"],
      userDetailsId: json["user_details_id"],
      name: json["name"],
      email: json["email"],
      emailVerifiedAt: json["email_verified_at"],
      twoFactorConfirmedAt: json["two_factor_confirmed_at"],
      userRoleType: json["user_role_type"],
      accountType: json["account_type"],
      accountStatus: json["account_status"],
      submitStatus: json["submit_status"],
      currentTeamId: json["current_team_id"],
      profilePhotoPath: json["profile_photo_path"],
      createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
      updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      activeStatus: json["active_status"],
      avatar: json["avatar"],
      darkMode: json["dark_mode"],
      messengerColor: json["messenger_color"],
      userDetails: json["user_details"] == null ? null : UserDetails.fromJson(json["user_details"]),
      tradeLicenseFiles: json["trade_license_files"] == null ? [] : List<UploadedFileElement>.from(json["trade_license_files"]!.map((x) => UploadedFileElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
  "id": id,
  "user_details_id": userDetailsId,
  "name": name,
  "email": email,
  "email_verified_at": emailVerifiedAt,
  "two_factor_confirmed_at": twoFactorConfirmedAt,
  "user_role_type": userRoleType,
  "account_type": accountType,
  "account_status": accountStatus,
  "submit_status": submitStatus,
  "current_team_id": currentTeamId,
  "profile_photo_path": profilePhotoPath,
  "created_at": createdAt?.toIso8601String(),
  "updated_at": updatedAt?.toIso8601String(),
  "active_status": activeStatus,
  "avatar": avatar,
  "dark_mode": darkMode,
  "messenger_color": messengerColor,
  "user_details": userDetails?.toJson(),
  "trade_license_files": tradeLicenseFiles == null ? [] : List<dynamic>.from(tradeLicenseFiles!.map((x) => x.toJson())),
};
}

class UserDetails {
  UserDetails({
    this.id,
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
    this.updatedAt,
  });

  final int? id;
  final String? firstName;
  final String? lastName;
  final dynamic surname;
  final String? country;
  final String? emirateStateName;
  final String? phone;
  final String? profileImage;
  final dynamic gender;
  final dynamic educationalStatus;
  final dynamic universityName;
  final dynamic freelancerJobTitle;
  final dynamic freelancerLanguage;
  final dynamic bankAccountNo;
  final dynamic bankName;
  final dynamic emiratesIdNo;
  final dynamic description;
  final dynamic workingType;
  final String? companyName;
  final String? companyEstablishYear;
  final String? companyStatus;
  final String? businessName;
  final String? companySize;
  final String? companySpeciality;
  final String? companyService;
  final String? tradeLicenseNo;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    surname: json["surname"],
    country: json["country"],
    emirateStateName: json["emirate_state_name"],
    phone: json["phone"],
    profileImage: json["profile_image"],
    gender: json["gender"],
    educationalStatus: json["educational_status"],
    universityName: json["university_name"],
    freelancerJobTitle: json["freelancer_job_title"],
    freelancerLanguage: json["freelancer_language"],
    bankAccountNo: json["bank_account_no"],
    bankName: json["bank_name"],
    emiratesIdNo: json["emirates_id_no"],
    description: json["description"],
    workingType: json["Working_type"],
    companyName: json["company_name"],
    companyEstablishYear: json["company_establish_year"],
    companyStatus: json["company_status"],
    businessName: json["business_name"],
    companySize: json["company_size"],
    companySpeciality: json["company_speciality"],
    companyService: json["company_service"],
    tradeLicenseNo: json["trade_license_no"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "surname": surname,
    "country": country,
    "emirate_state_name": emirateStateName,
    "phone": phone,
    "profile_image": profileImage,
    "gender": gender,
    "educational_status": educationalStatus,
    "university_name": universityName,
    "freelancer_job_title": freelancerJobTitle,
    "freelancer_language": freelancerLanguage,
    "bank_account_no": bankAccountNo,
    "bank_name": bankName,
    "emirates_id_no": emiratesIdNo,
    "description": description,
    "Working_type": workingType,
    "company_name": companyName,
    "company_establish_year": companyEstablishYear,
    "company_status": companyStatus,
    "business_name": businessName,
    "company_size": companySize,
    "company_speciality": companySpeciality,
    "company_service": companyService,
    "trade_license_no": tradeLicenseNo,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
