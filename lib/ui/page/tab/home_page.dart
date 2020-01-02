import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/net/error_handle.dart';
import 'package:flutter_app/route/router.dart';
import 'package:flutter_app/service/request.dart';
import 'package:flutter_app/model/detail_entity.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: RaisedButton(
            onPressed: () async {
              try {
                DetailEntity t = await request.get<DetailEntity>("/users/json");
                print('234');
                //print(t.toString());
              } catch( e) {
                print((e.error as NetError).msg);
              }

              Navigator.of(context).pushNamed(RouteName.detail_info, arguments: {"id": 001});
            },
            child: Text("HomePage")),
      ),
    );
  }
}
