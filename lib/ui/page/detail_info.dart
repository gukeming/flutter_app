import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class DetailInfo extends StatefulWidget {
  const DetailInfo({Key key}) : super(key: key);

  @override
  _DetailInfoState createState() => _DetailInfoState();
}

class _DetailInfoState extends State<DetailInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: const Center(
        child: Text('detail info'),
      ),
    );
  }
}
