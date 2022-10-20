class Transaction {
  final String id;
  final String title;
  final double amount;
  final String month;
  const Transaction({
    required this.amount,
    required this.month,
    required this.id,
    required this.title,
  });
}
