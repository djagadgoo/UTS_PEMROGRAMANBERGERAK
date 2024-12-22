class Profile {
  int? id;
  String username;
  String fullName;
  String password;

  Profile({
    this.id,
    required this.username,
    required this.fullName,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'full_name': fullName,
      'password': password,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'],
      username: map['username'],
      fullName: map['full_name'],
      password: map['password'],
    );
  }
}
