import 'package:flutter/material.dart';
import 'package:unit_converter/units_services.dart';

class ConversionWidget extends StatefulWidget {
  //"Length":"Mass":"Time":"Digital Storage":"Energy"

  var _ConversionType;

  ConversionWidget(this._ConversionType);

  @override
  _ConversionWidgetState createState() =>
      _ConversionWidgetState(_ConversionType);
}

class _ConversionWidgetState extends State<ConversionWidget> {
  var _ConversionType;

  List<String> _unitsList = new List();

  var _menu1Value;
  var _menu2Value;
  var _inputValue;
  var _outputValue;

  //_ConversionWidgetState(this._ConversionType);

  _ConversionWidgetState(var conversionType) {
    this._ConversionType = conversionType;
    print('~~~Inside _ConversionWidgetState : ');
    print(this._ConversionType);
    print('~~Units List : ');
    _unitsList = getListOfUnits(_ConversionType);

    _menu1Value = _unitsList[0];
    _menu2Value = _unitsList[1];

    _outputValue = '';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: Text(_ConversionType + " Conversion"),
          backgroundColor: Colors.green,
        ),
        body: ListView(
          children: <Widget>[
            _makeTextField(context, 'Input'),
            _makeDropDown(context, 1),
            //_makeTextField(context, 'Output'),
            _outputHeading(),
            _makeText(_outputValue),
            _makeDropDown(context, 2),
          ],
        ),
      ),
    );
  }

  Widget _makeTextField(BuildContext context, String labelText) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.lightGreen,
        hintColor: Colors.lightGreen,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30.0,
          horizontal: 5.0,
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.lightGreen,
            ),
            child: TextField(
              keyboardType: TextInputType.number,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
              ),
              decoration: InputDecoration(
                labelText: labelText,
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onSubmitted: (String input) {
                print('~~~On Text Field Changed : ');
                print(input);
                //_makeText('1235');
                setState(() {
                  _inputValue = input;
                  _outputValue = input;
                });
                _makeDropDown(context, 2);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _makeText(var text) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.lightGreen,
        hintColor: Colors.lightGreen,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 30.0,
          left: 5.0,
          right: 5.0,
        ),
        child: Container(
          height: 55.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
            ),
            color: Colors.lightGreen,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
              bottom: 16.0,
            ),
            child: Text(
              text,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
    /*return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.lightGreen,
          child: Text(
              text
          ),
      ),
    );*/
  }

  Widget _outputHeading() {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.lightGreen,
        hintColor: Colors.lightGreen,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 30.0,
          left: 5.0,
          right: 5.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
            color: Colors.lightGreen,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
            ),
            child: Text(
              'Output',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _makeDropDown(BuildContext context, int menuId) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: (menuId == 1) ? _menu1Value : _menu2Value,
          //style: Theme.of(context).textTheme.title,
          style: Theme.of(context).textTheme.title,
          //items: menuList().map(
          items: _unitsList.map(
            (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                    color: Colors.blueGrey,
                  ),
                ),
              );
            },
          ).toList(),
          onChanged: (var newValue) {
            setState(() {
              if (menuId == 1)
                _menu1Value = newValue;
              else
                _menu2Value = newValue;
            });
          }, //onChanged: null,
        ),
      ),
    );
  }
}