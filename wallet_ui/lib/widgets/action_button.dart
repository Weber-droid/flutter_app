import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final bool rotate;
  final Color color;

  const ActionButton({
    super.key,
    required this.icon,
    required this.label,
    this.selected = false,
    this.rotate = false,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: selected ? color : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey[300]!),
          ),
          padding: EdgeInsets.all(16),
          child:
              rotate
                  ? Transform.rotate(
                    angle: 3.14, // 180 degrees
                    child: Icon(
                      icon,
                      color: selected ? Colors.white : Colors.black,
                    ),
                  )
                  : Icon(icon, color: selected ? Colors.white : Colors.black),
        ),
        SizedBox(height: 6),
        Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }
}
