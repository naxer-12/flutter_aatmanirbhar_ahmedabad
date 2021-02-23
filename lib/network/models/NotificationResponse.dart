class NotificationResponse {
  int id;
  String notificationDescription;
  int notificationSenderId;
  String currentat;
  String updatedat;

  NotificationResponse(
      {this.id,
        this.notificationDescription,
        this.notificationSenderId,
        this.currentat,
        this.updatedat});

  NotificationResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notificationDescription = json['notification_description'];
    notificationSenderId = json['notification_sender_id'];
    currentat = json['currentat'];
    updatedat = json['updatedat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['notification_description'] = this.notificationDescription;
    data['notification_sender_id'] = this.notificationSenderId;
    data['currentat'] = this.currentat;
    data['updatedat'] = this.updatedat;
    return data;
  }
}
