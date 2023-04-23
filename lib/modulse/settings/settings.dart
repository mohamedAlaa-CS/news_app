import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class settingScreen extends StatelessWidget {
  const settingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Settings',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
