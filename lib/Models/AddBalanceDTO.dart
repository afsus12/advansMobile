class AddBalanceDTO {
  double amount;
  int clientId;

  AddBalanceDTO({
    required this.amount,
    required this.clientId,
  });
  Map<String, dynamic> toJson() {
    return {
      'clientId': clientId,
      'amount': amount,
    };
  }
}
