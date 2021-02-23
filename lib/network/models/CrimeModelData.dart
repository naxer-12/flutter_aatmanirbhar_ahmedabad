class CrimeModel {
  List<String> images;
  String desc;
  String crime;
  int userID;
  String vehicleType;
  String numberPlate;
  int key;
  Location location;

  CrimeModel({this.crime: "",
    this.desc: "",
    this.images,
    this.userID,
    this.vehicleType: "",
    this.numberPlate: "",

    this.key}) {
    this.location = Location();
  }
}

class Location {
  double lat;
  double long;

  Location({this.lat:433.34, this.long:2342.234});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['long'] = this.long;
    return data;
  }
}
