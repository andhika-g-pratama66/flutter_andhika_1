class LoginModel {
  final String? token;
  final String? message;
  final Map<String, dynamic>? user;

  const LoginModel({this.token, this.message, this.user});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>?;

    return LoginModel(
      token: json['token'] as String? ?? data?['token'] as String?,
      message: json['message'] as String?,
      user:
          json['user'] as Map<String, dynamic>? ??
          data?['user'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() => {
    'token': token,
    'message': message,
    'user': user,
  };
}
