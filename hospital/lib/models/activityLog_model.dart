class Activity {
  final id;
  final message;
  final timestamp;

  Activity({
    this.id,
    this.message,
    this.timestamp,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      id: json['id'],
      message: json['message'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}

class ActivityLogListModel {
  final List<Activity> activities;

  ActivityLogListModel({
    required this.activities,
  });

  factory ActivityLogListModel.fromJson(List<dynamic> json) {
    List<Activity> activities = json.map((activity) {
      return Activity.fromJson(activity);
    }).toList();

    return ActivityLogListModel(activities: activities);
  }
}
