class NotificationRequest {
  int notificationSenderId;
  int key;

  NotificationRequest({this.notificationSenderId, this.key});

  NotificationRequest.fromJson(Map<String, dynamic> json) {
    notificationSenderId = json['notification_sender_id'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notification_sender_id'] = this.notificationSenderId;
    data['key'] = this.key;
    return data;
  }
}