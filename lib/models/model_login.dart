class RUser {
  //int id
  final int? id;
  final String email2;
  final String password2;

  RUser({
    this.id,
    required this.email2,
    required this.password2,
  });

  factory RUser.fromMap(Map<String, dynamic> json) => RUser(
        id: json['id'],
        email2: json['email'],
        password2: json['password'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email2,
      'password': password2,
    };
  }
}
