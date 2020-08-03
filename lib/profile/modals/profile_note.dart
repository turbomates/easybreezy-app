class ProfileNote {
  final bool archived;
  final String authorId;
  final String createdAt;
  final String id;
  final String text;

  ProfileNote(
      {this.archived, this.authorId, this.createdAt, this.id, this.text});

  static ProfileNote fromJson(Map<String, dynamic> json) {
    return ProfileNote(
      archived: json['archived'],
      authorId: json['authorId'],
      createdAt: json['createdAt'],
      id: json['id'],
      text: json['text'],
    );
  }
}
