class UserResponseModel {
  int userId;
  int otp;
  int key;

  UserResponseModel({this.userId, this.otp, this.key});

  UserResponseModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    otp = json['otp'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['otp'] = this.otp;
    data['key'] = this.key;
    return data;
  }
}
