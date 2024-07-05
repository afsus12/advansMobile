class ProspectRequest {
  String firstname;
  String lastname;
  String gender;
  String branch;
  String? customer;
  String title;
  String fieldOfActivity;
  String jobOfTheHolder;
  String subJobOfTheHolder;
  String email;
  String phoneNumber;
  int userCode;
  String? cin;
  String address;

  ProspectRequest(
      {required this.firstname,
      required this.lastname,
      required this.address,
      required this.gender,
      required this.title,
      required this.userCode,
      required this.phoneNumber,
      required this.subJobOfTheHolder,
      required this.branch,
      required this.email,
      this.customer,
      required this.fieldOfActivity,
      required this.jobOfTheHolder,
      this.cin});
  Map<String, dynamic> toJson() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'title': title,
      'branch': branch,
      'gender': gender,
      'fieldOfActivity': fieldOfActivity,
      'jobOfTheHolder': jobOfTheHolder,
      'subJobOfTheHolder': subJobOfTheHolder,
      'address': address,
      'email': email,
      'phoneNumber': phoneNumber,
      'userCode': userCode,
      'cin': cin
    };
  }

  factory ProspectRequest.fromJson(Map<String, dynamic> json) {
    return ProspectRequest(
      firstname: json['firstname'],
      lastname: json['lastname'],
      title: json['title'],
      branch: json['branch'],
      gender: json['gender'],
      fieldOfActivity: json['fieldOfActivity'],
      jobOfTheHolder: json['jobOfTheHolder'],
      subJobOfTheHolder: json['subJobOfTheHolder'],
      address: json['address'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      userCode: json['userCode'],
      cin: json['cin'],
      customer: json['customer'],
    );
  }
}
