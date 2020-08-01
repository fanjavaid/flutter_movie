import 'package:flutter/material.dart';

class CapsuleSmall extends StatelessWidget {
  final text;

  const CapsuleSmall(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
        color: Colors.black12,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 8,
        ),
      ),
    );
  }
}
