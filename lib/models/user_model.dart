class UserModel {
  String? avatar;
  String? role;
  String? type;
  String? sId;
  String? name;
  String? account;
  String? password;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserModel(
      {this.avatar,
      this.role,
      this.type,
      this.sId,
      this.name,
      this.account,
      this.password,
      this.createdAt,
      this.updatedAt,
      this.iV});

  UserModel.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    role = json['role'];
    type = json['type'];
    sId = json['_id'];
    name = json['name'];
    account = json['account'];
    password = json['password'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['role'] = this.role;
    data['type'] = this.type;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['account'] = this.account;
    data['password'] = this.password;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}