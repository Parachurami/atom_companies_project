import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({super.key, required this.icon, required this.label});
  final Icon icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      children: [
        icon,
        Text(label,
          style: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 15
          ),
        )
      ],
    );
  }
}