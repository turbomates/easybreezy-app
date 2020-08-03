class ProfilePosition {
  final String id;
  final String since;
  final String till;
  final String title;

  ProfilePosition({this.id, this.since, this.till, this.title});

  static ProfilePosition fromJson(Map<String, dynamic> json) {
    return ProfilePosition(
      id: json['id'],
      since: json['since'],
      till: json['till'],
      title: json['title'],
    );
  }
}
