import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class UserPage extends StatefulWidget {
  const UserPage({Key key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: const Center(
        child: Text('UserPage'),
      ),
    );
  }
}