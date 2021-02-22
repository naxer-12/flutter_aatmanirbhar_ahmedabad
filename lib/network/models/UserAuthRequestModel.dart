class UserAuthModel {
  int mobileno;
  int otp;
  int key;

  UserAuthModel({this.mobileno, this.otp, this.key});

  UserAuthModel.fromJson(Map<String, dynamic> json) {
    mobileno = json['mobileno'];
    otp = json['otp'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobileno'] = this.mobileno;
    data['otp'] = this.otp;
    data['key'] = this.key;
    return data;
  }
}
