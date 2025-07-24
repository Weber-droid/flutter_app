import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final Widget avatar;
  final String name;
  final String time;
  final String amount;
  final String type;

  const TransactionItem({
    super.key,
    required this.avatar,
    required this.name,
    required this.time,
    required this.amount,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: avatar,
      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(time),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(amount, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(type, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        ],
      ),
    );
  }
}
