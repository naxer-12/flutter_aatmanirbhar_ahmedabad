class DashboardResponse {
  num karmaPoints;
  num complaint;
  num resolved;

//  String summary;

  DashboardResponse({this.karmaPoints, this.complaint, this.resolved});

  DashboardResponse.fromJson(Map<String, dynamic> json) {
    karmaPoints = json['karma_points'];
    complaint = json['complaint'];
    resolved = json['resolved'];
//    summary = json['summary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['karma_points'] = this.karmaPoints;
    data['complaint'] = this.complaint;
    data['resolved'] = this.resolved;
//    data['summary'] = this.summary;
    return data;
  }
}
