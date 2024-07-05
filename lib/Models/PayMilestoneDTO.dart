class PayMilestoneDTO {
  final int userId;
  final double amount;

  PayMilestoneDTO({required this.userId, required this.amount});

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'amount': amount,
    };
  }
}
