class User {
  String name;
  String nickname;
  String email;

  User({
    required this.name,
    required this.nickname,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      nickname: json['nickname'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'nickname': nickname,
      'email': email,
    };
  }
}
