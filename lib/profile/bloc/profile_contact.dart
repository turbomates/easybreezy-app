class ProfileContact {
  String type;
  String value;

  ProfileContact({this.type, this.value});

  factory ProfileContact.fromJson(Map<String, dynamic> json) {
    return ProfileContact(
      type: json['type'],
      value: json['value'],
    );
  }
}
