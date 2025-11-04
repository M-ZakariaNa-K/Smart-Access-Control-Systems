class AuthResponse {
  int id;
  String firstName;
  String lastName;
  String phone;
  String email;
  String role;
  String token;

  AuthResponse({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.role,
    required this.token,
  });

  factory AuthResponse.fromMap(Map<String, dynamic> map) {
    return AuthResponse(
      id: map['id'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      phone: map['phone'],
      email: map['email'],
      role: map['role'],
      token: map['token'],
    );
  }
}
