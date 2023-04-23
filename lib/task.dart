import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class task extends StatelessWidget {
  const task({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DGSC'),
      ),
      body: Center(
          child: Text('mohamed alaa',
              style: TextStyle(
                fontSize: 32,
              ))),
    );
    ;
  }
}
