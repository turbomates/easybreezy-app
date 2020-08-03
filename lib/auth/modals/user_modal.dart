class User {
  List<String> activities;
  Object comment;
  String email;
  String id;
  String status;

  User({this.activities, this.comment, this.email, this.id, this.status});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      activities: json['activities'] != null
          ? new List<String>.from(json['activities'])
          : null,
      comment: json['comment'] != null ? json['comment'] : null,
      email: json['email'],
      id: json['id'],
      status: json['status'],
    );
  }
}
