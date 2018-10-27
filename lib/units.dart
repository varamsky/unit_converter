class Unit{
  String unitName;
  double unitConversionFactor;
  bool isBaseUnit;

  Unit({
    this.unitName,
    this.unitConversionFactor,
    this.isBaseUnit
  });

  factory Unit.fromJSON(Map<String,dynamic> parsedJson){
    return Unit(
      unitName: parsedJson['name'],
      unitConversionFactor: parsedJson['conversion'],
      isBaseUnit: parsedJson['base_unit']
    );
  }
}

class PhysicalQuantity{
  List<Unit> unitsList;

  PhysicalQuantity({
    this.unitsList
  });

  factory PhysicalQuantity.fromJSON(Map<String,dynamic> parsedJson,String quantityName){
    List<dynamic> unitListFromJson = parsedJson[quantityName];
    List<Unit> unitsList = unitListFromJson.map((i) => Unit.fromJSON(i)).toList();
    return PhysicalQuantity(
      unitsList: unitsList
    );
  }
}
