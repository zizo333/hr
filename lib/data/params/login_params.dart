class LoginParams {
  final String phone;
  final String companyId;
  final String password;
  final bool rememberMe;

  LoginParams({
    required this.phone,
    required this.companyId,
    required this.password,
    required this.rememberMe,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'company_id': companyId,
      'phone': phone,
      'password': password,
    };
  }
}
