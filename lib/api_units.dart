import 'dart:convert';

ApiUnits unitsFromJson(String str) {
  final jsonData = json.decode(str);
  return ApiUnits.fromJson(jsonData);
}

String unitsToJson(ApiUnits data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class ApiUnits {
  List<ApiUnit> units;

  ApiUnits({
    this.units,
  });

  factory ApiUnits.fromJson(Map<String, dynamic> json) => new ApiUnits(
    units: new List<ApiUnit>.from(json["units"].map((x) => ApiUnit.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "units": new List<dynamic>.from(units.map((x) => x.toJson())),
  };
}

class ApiUnit {
  String name;
  double conversion;
  String description;

  ApiUnit({
    this.name,
    this.conversion,
    this.description,
  });

  factory ApiUnit.fromJson(Map<String, dynamic> json) => new ApiUnit(
    name: json["name"],
    conversion: json["conversion"].toDouble(),
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "conversion": conversion,
    "description": description,
  };
}