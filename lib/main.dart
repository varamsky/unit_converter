import 'package:flutter/material.dart';
import 'package:unit_converter/ListWidget.dart';
import 'package:unit_converter/units_services.dart';

void main() {
  //"Length":"Mass":"Time":"Digital Storage":"Energy"
  loadUnits('Length');
  loadUnits('Mass');
  loadUnits('Time');
  loadUnits('Digital Storage');
  loadUnits('Energy');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Unit Conversion"),
            backgroundColor: Colors.green,
          ),
          body: ListView(
            children: <Widget>[
              ListWidget(Icons.attach_money,"Currency"),
              ListWidget(Icons.alarm,"Time"),
              ListWidget(Icons.sim_card,"Digital Storage"),
              ListWidget(Icons.directions_run,"Length"),
              ListWidget(Icons.pregnant_woman,"Mass"),
              ListWidget(Icons.power,"Energy"),
            ],
          ),
        ),
      );
  }
}
