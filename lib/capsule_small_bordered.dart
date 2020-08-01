import 'package:flutter/material.dart';

class CapsuleSmallBordered extends StatelessWidget {
  final text;

  const CapsuleSmallBordered(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
          border: Border.all(
            color: Colors.black12,
            width: 1,
          )),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 8,
        ),
      ),
    );
  }
}
