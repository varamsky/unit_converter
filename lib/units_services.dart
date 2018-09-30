import 'package:unit_converter/units.dart';
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

//"Length":"Mass":"Time":"Digital Storage":"Energy"
PhysicalQuantity length;
PhysicalQuantity mass;
PhysicalQuantity time;
PhysicalQuantity digitalStorage;
PhysicalQuantity energy;

Future _loadUnitsAsset() async {
  return await rootBundle.loadString('assets/units.json');
}

Future loadUnits(String quantityName) async {
  print("Entering loadUnits()");
  String jsonString = await _loadUnitsAsset();
  final jsonResponse = json.decode(jsonString);
  print("before object of physicalQuantity");

  switch (quantityName) {
    case 'Length':
      length = PhysicalQuantity.fromJSON(jsonResponse, quantityName);
      break;
    case 'Mass':
      mass = PhysicalQuantity.fromJSON(jsonResponse, quantityName);
      break;
    case 'Time':
      time = PhysicalQuantity.fromJSON(jsonResponse, quantityName);
      break;
    case 'Digital Storage':
      digitalStorage = PhysicalQuantity.fromJSON(jsonResponse, quantityName);
      break;
    case 'Energy':
      energy = PhysicalQuantity.fromJSON(jsonResponse, quantityName);
      break;
  }
}

List<String> getListOfUnits(String quantityName) {
  print("~~Inside getListOfUnits(): ");

  List<String> unitList = List();
  print("~~Inside getListOfUnits() before for loop: ");

  Unit unit;

  switch (quantityName) {
    case 'Length':
      for (unit in length.unitsList) {
        unitList.add(unit.unitName);
      }
      break;
    case 'Mass':
      for (unit in mass.unitsList) {
        unitList.add(unit.unitName);
      }
      break;
    case 'Time':
      for (unit in time.unitsList) {
        unitList.add(unit.unitName);
      }
      break;
    case 'Digital Storage':
      for (unit in digitalStorage.unitsList) {
        unitList.add(unit.unitName);
      }
      break;
    case 'Energy':
      for (unit in energy.unitsList) {
        unitList.add(unit.unitName);
      }
      break;
  }


  print("~~Inside getListOfUnits() after for loop: ");
  return unitList;
}
