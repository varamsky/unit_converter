import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:unit_converter/api_units.dart';


String url = 'https://flutter.udacity.com/currency/';

Future getUnit() async{
  final response = await http.get('$url');
  ApiUnits units = unitsFromJson(response.body);

  return units;
}