import 'package:flutter/material.dart';
import 'package:sad_lib/CustomWidgets.dart';
import '../Utils/Colors.dart' as colors;

class CalculatorBtn extends StatefulWidget {
  final void Function() onPressed;
  final Widget widget;
  final bool isEqual;
  CalculatorBtn({Key key, this.onPressed, this.widget, this.isEqual = false,}) : super(key: key);

  @override
  _CalculatorBtnState createState() => _CalculatorBtnState();
}

class _CalculatorBtnState extends State<CalculatorBtn> {
  @override
  Widget build(BuildContext context) {
    return ButtonView(
      onPressed: widget.onPressed,
      padding: EdgeInsets.symmetric(vertical: widget.isEqual ? 10 : 15.0, horizontal: widget.isEqual ? 20 : 25.0),
      widthType: widget.isEqual ? WidthType.stretch : WidthType.fit,
      color: widget.isEqual ? colors.mPrimary : colors.mBtnBackground,
      splashColor: colors.mAccent.withOpacity(0.70),
      borderRadius: 50.0,
      alignment: Alignment.center,
      child: widget.widget,
    );
  }
}
