import 'package:unit_converter/units.dart';
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:unit_converter/api_units.dart';
import 'package:unit_converter/api_units_services.dart';

//"Length":"Mass":"Time":"Digital Storage":"Energy"
PhysicalQuantity length;
PhysicalQuantity mass;
PhysicalQuantity time;
PhysicalQuantity digitalStorage;
PhysicalQuantity energy;
ApiUnits apiUnits;

List<double> factorsList;

String url = 'https://flutter.udacity.com/currency/';

Future _loadUnitsAsset() async {
  return await rootBundle.loadString('assets/units.json');
}

Future loadUnits(String quantityName) async {
  String jsonString = await _loadUnitsAsset();
  final jsonResponse = json.decode(jsonString);


  switch (quantityName) {
    case 'Currency':
      apiUnits = await getUnit();
      break;
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
  List<String> unitList = List();

  factorsList = List();
  Unit unit;

  ApiUnit apiUnit;

  switch (quantityName) {
    case 'Currency':
      for(apiUnit in apiUnits.units){
        unitList.add(apiUnit.name);
        factorsList.add(apiUnit.conversion);
      }
      break;
    case 'Length':
      for (unit in length.unitsList) {
        unitList.add(unit.unitName);
        factorsList.add(unit.unitConversionFactor);
      }
      break;
    case 'Mass':
      for (unit in mass.unitsList) {
        unitList.add(unit.unitName);
        factorsList.add(unit.unitConversionFactor);
      }
      break;
    case 'Time':
      for (unit in time.unitsList) {
        unitList.add(unit.unitName);
        factorsList.add(unit.unitConversionFactor);
      }
      break;
    case 'Digital Storage':
      for (unit in digitalStorage.unitsList) {
        unitList.add(unit.unitName);
        factorsList.add(unit.unitConversionFactor);
      }
      break;
    case 'Energy':
      for (unit in energy.unitsList) {
        unitList.add(unit.unitName);
        factorsList.add(unit.unitConversionFactor);
      }
      break;
  }
  return unitList;
}
