class OpertunityRequest {
  String customer;

  String subject;

  String userCode;
  String project;

  String designation;
  String date;

  OpertunityRequest(
      {required this.subject,
      required this.customer,
      required this.userCode,
      required this.project,
      required this.date,
      required this.designation});
  Map<String, dynamic> toJson() {
    return {
      'customer': customer,
      'idTreatmentChannel': "13",
      'idType': "ff",
      'idOrigin': "18",
      'projectDate': date,
      'idRealization': "67",
      'iddStatus': "12",
      'subject': subject,
      'designation': designation,
      'codeAccountOfficer': "33",
      'userCode': userCode
    };
  }
}
