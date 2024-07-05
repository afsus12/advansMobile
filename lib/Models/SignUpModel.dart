class UserRequest {
  String firstname;
  String lastname;
  String email;
  String password;
  String username;
  String phone;
  String cin;
  String address;
  List<String>? roles;
  DateTime? birthday;
  String? customer;

  UserRequest(
      {required this.cin,
      required this.firstname,
      required this.lastname,
      required this.address,
      required this.email,
      required this.password,
      required this.username,
      required this.phone,
      this.birthday,
      this.customer,
      this.roles});
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'phone': phone,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'address': address,
      'cin': cin,
      'birthday': birthday,
      'customer': customer,
    };
  }
}
