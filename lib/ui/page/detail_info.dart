import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app/provider/common/widget_provider.dart';
import 'package:flutter_app/provider/common/view_state_provider.dart';
import 'package:flutter_app/provider/detail_provider.dart';


 loadState(ViewStateProvider model) {
   if(model.busy) {
     return Center(
       child: Text("DetailInfo loading"),
     );
   } else if (model.error) {

   }
   return null;
 }

class DetailInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: WidgetProvider<DetailProvider>(
        model: DetailProvider(),
        onModelReady: (model) async {
          await model.initData();
        },
        builder: (context, model, child) {
          var widget = loadState(model);
          if(widget != null) {
            return widget;
          }
          return Center(
            child: Text("DetailInfo" + model.data.name),
          );
        },
      ),
    );
  }
}
