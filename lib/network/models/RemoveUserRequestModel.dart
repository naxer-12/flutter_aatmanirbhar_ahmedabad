class RemoveUserModel {
  int userId;
  int key;

  RemoveUserModel({this.userId, this.key});

  RemoveUserModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['key'] = this.key;
    return data;
  }
}
