class TransactionModel {
  final String toUsername;
  final String content;
  final double amount;
  final DateTime date;
  final String status;

  TransactionModel({
    required this.toUsername,
    required this.content,
    required this.amount,
    required this.date,
    required this.status,
  });
}
