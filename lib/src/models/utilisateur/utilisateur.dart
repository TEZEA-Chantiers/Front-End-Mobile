class Utilisateur {
  Utilisateur({this.id, this.username, this.password, this.role, this.jwt});

  factory Utilisateur.fromJson(Map<String, dynamic> jsonData) {
    return Utilisateur(
      id: jsonData['id'] as int,
      username: jsonData['username']?.toString(),
      password: jsonData['password']?.toString(),
      role: jsonData['role']?.toString(),
      jwt: jsonData['jwt']?.toString(),
    );
  }

  void updateUtilisateur(Utilisateur utilisateur) {
    id = utilisateur.id;
    username = utilisateur.username;
    password = utilisateur.password;
    role = utilisateur.role;
    jwt = utilisateur.jwt;
  }

  int id;
  String username;
  String password;
  String role;
  String jwt;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'role': role,
      'jwt': jwt,
    };
  }
}
