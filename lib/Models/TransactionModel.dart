class TransactionModel {
  final double amount;
  final String transtype;
  final String type;
  final String date;

  TransactionModel({
    required this.amount,
    required this.transtype,
    required this.type,
    required this.date,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      amount: json['amount'] ?? 0.0,
      transtype: json['transtype'] ?? '',
      type: json['type'] ?? '',
      date: json['date'] ?? '',
    );
  }
}
