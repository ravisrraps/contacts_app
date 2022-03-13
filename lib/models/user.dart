class User {
  String? _email;
  String? _password;
  String? _secret;

  void setEmail(String? email) {
    _email = email;
  }

  void setPassword(String? password) {
    _password = password;
  }

  void setSecretKey(String? secret) {
    _secret = secret;
  }

  String? getEmail() {
    return _email;
  }

  String? getPassword() {
    return _password;
  }

  String? getSecretKey() {
    return _secret;
  }
}
