class GigCategoryModel {
  List<SkillCategories>? skillCategories;
  List<Skills>? skills;
  List<Questions>? questions;

  GigCategoryModel({this.skillCategories, this.skills, this.questions});

  GigCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['skillCategories'] != null) {
      skillCategories = <SkillCategories>[];
      json['skillCategories'].forEach((v) {
        skillCategories!.add(new SkillCategories.fromJson(v));
      });
    }
    if (json['skills'] != null) {
      skills = <Skills>[];
      json['skills'].forEach((v) {
        skills!.add(new Skills.fromJson(v));
      });
    }
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.skillCategories != null) {
      data['skillCategories'] =
          this.skillCategories!.map((v) => v.toJson()).toList();
    }
    if (this.skills != null) {
      data['skills'] = this.skills!.map((v) => v.toJson()).toList();
    }
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SkillCategories {
  int? id;
  String? categoryName;
  String? slug;
  int? status;
  String? createdAt;
  String? updatedAt;

  SkillCategories(
      {this.id,
        this.categoryName,
        this.slug,
        this.status,
        this.createdAt,
        this.updatedAt});

  SkillCategories.fromJson(Map<String, dynamic> json) {
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

class Questions {
  int? id;
  String? question;
  String? slug;
  int? status;
  String? createdAt;
  String? updatedAt;

  Questions(
      {this.id,
        this.question,
        this.slug,
        this.status,
        this.createdAt,
        this.updatedAt});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    slug = json['slug'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
