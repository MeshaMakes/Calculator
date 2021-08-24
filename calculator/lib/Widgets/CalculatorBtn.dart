import 'package:flutter/material.dart';
import 'package:sad_lib/CustomWidgets.dart';
import '../Utils/Colors.dart' as colors;

class CalculatorBtn extends StatefulWidget {
  final void Function() onPressed;
  final Widget widget;
  final bool isEqual;
  CalculatorBtn({Key key, this.onPressed, this.widget, this.isEqual,}) : super(key: key);

  @override
  _CalculatorBtnState createState() => _CalculatorBtnState();
}

class _CalculatorBtnState extends State<CalculatorBtn> {
  @override
  Widget build(BuildContext context) {
    return ButtonView(
      onPressed: widget.onPressed,
      padding: EdgeInsets.all(8.0),
      widthType: widget.isEqual ? WidthType.stretch : WidthType.fit,
      color: widget.isEqual ? colors.mPrimary : colors.mBtnBackground,
      borderRadius: 180.0,
      child: widget.widget,
    );
  }
}
