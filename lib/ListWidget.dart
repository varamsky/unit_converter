import 'package:flutter/material.dart';
import 'package:unit_converter/CoversionWidget.dart';

class ListWidget extends StatelessWidget {
  final _itemIcon;
  final _itemText; //"Length":"Mass":"Time":"Digital Storage":"Energy"

  ListWidget(this._itemIcon,this._itemText);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colors.green,
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: InkWell(
          onTap: () {
            print(_itemText);
            //Navigator.push(context, MaterialPageRoute(builder: (context)) => ConversionWidget());
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ConversionWidget(_itemText)));
          },
          child: Container(
            padding: EdgeInsets.all(25.0),
            decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.circular(15.0),
              /*border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),*/
            ),
            child: Row(
                children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: imageOrIcon()
                ),
                Text(
              _itemText,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
            ],
      ),
          ),
        ),
    ),
    );
  }

  Widget imageOrIcon(){
    if(_itemText == 'Length'){
      return Image.asset(
        'assets/length.png',
        color: Colors.blueGrey,
        height: 40.0,
        width: 40.0,
      );
    }
    else
      return Icon(
        _itemIcon,
        color: Colors.blueGrey,
        size: 40.0,
      );
  }
}
