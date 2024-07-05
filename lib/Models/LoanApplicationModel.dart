class LoanApplication {
  final int? id;
  final String nationalite;
  final int clientId;
  final String? status;
  final int age;
  final String experienceDuration;
  final String loanPurpose;
  final DateTime? applicationDate;
  final String productName;
  final String governorat;
  final String activityAdresse;
  final String fullName;
  final DateTime? validatedAt;
  final DateTime? createdAt;
  final String customer;
  final String activityType;
  final String? previousMicrofinanceInstitution;
  final double requestedCreditAmount;
  final List<int>? supportingDocument;
  final List<String>? doc;

  LoanApplication(
      {this.id,
      this.validatedAt,
      this.applicationDate,
      required this.nationalite,
      this.status,
      this.createdAt,
      required this.age,
      required this.clientId,
      required this.experienceDuration,
      required this.loanPurpose,
      required this.productName,
      required this.governorat,
      required this.activityAdresse,
      required this.fullName,
      required this.customer,
      required this.activityType,
      this.previousMicrofinanceInstitution,
      required this.requestedCreditAmount,
      this.supportingDocument,
      this.doc});

  Map<String, dynamic> toJson() {
    return {
      'nationalite': nationalite,
      'age': age,
      'experienceDuration': experienceDuration,
      'loanPurpose': loanPurpose,
      'productName': productName,
      'governorat': governorat,
      'activityAdresse': activityAdresse,
      'fullName': fullName,
      'customer': customer,
      'clientId': clientId,
      'activityType': activityType,
      'previousMicrofinanceInstitution': previousMicrofinanceInstitution,
      'requestedCreditAmount': requestedCreditAmount,
      'supportingDocuments': supportingDocument,
    };
  }

  factory LoanApplication.fromJson(Map<String, dynamic> json) {
    return LoanApplication(
      id: json['id'],
      status: json['status'],
      customer: json['customer'],
      requestedCreditAmount: json['requestedCreditAmount'],
      applicationDate: DateTime.parse(json['applicationDate']),
      nationalite: json['nationalite'],
      age: json['age'],
      experienceDuration: json['experienceDuration'],
      loanPurpose: json['loanPurpose'],
      productName: json['productName'],
      governorat: json['governorat'],
      activityAdresse: json['activityAdresse'],
      activityType: json['activitytype'],
      createdAt: DateTime.parse(json['createdAt']),
      validatedAt: json['validatedAt'] != null
          ? DateTime.parse(json['validatedAt'])
          : null,
      clientId: json['clientId'],
      doc: (json['documentPaths'] as List<dynamic>).cast<String>(),
      fullName: json['fullname'],
    );
  }
}
