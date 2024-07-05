class LoanApplicationGlobalModel {
  final int id;
  final String status;
  final String customer;
  final double requestedCreditAmount;
  final DateTime applicationDate;
  final String fullname;
  final String productName;

  LoanApplicationGlobalModel({
    required this.id,
    required this.status,
    required this.customer,
    required this.requestedCreditAmount,
    required this.applicationDate,
    required this.fullname,
    required this.productName,
  });

  factory LoanApplicationGlobalModel.fromJson(Map<String, dynamic> json) {
    return LoanApplicationGlobalModel(
      id: json['id'],
      status: json['status'],
      customer: json['customer'],
      requestedCreditAmount: json['requestedCreditAmount'],
      applicationDate: DateTime.parse(json['applicationDate']),
      fullname: json['fullname'],
      productName: json['productName'],
    );
  }
}
