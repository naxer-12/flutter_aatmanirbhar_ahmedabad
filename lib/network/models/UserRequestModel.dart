class UserModel {
  String firstname;
  String lastname;
  int mobileno;

  UserModel({this.firstname, this.lastname, this.mobileno});

  UserModel.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
    mobileno = json['mobileno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['mobileno'] = this.mobileno;
    return data;
  }
}
