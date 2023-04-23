import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class archive_screen extends StatelessWidget {
  const archive_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Archive',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
