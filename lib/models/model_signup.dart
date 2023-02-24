class User {
  //int id
  final int? id;
  final String name;
  final String lastname;
  final String email;
  final String password;

  User({
    this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.password,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        lastname: json['lastname'],
        email: json['email'],
        password: json['password'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'lastname': lastname,
      'email': email,
      'password': password,
    };
  }
}
