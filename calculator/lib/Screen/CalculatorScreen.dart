import 'package:calculator/Widgets/CalculatorBtn.dart';
import 'package:flutter/material.dart';
import 'package:sad_lib/CustomWidgets.dart';
import '../Utils/Colors.dart' as colors;

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  double _finalValue;
  String _operand;
  TextEditingController _display;
  double numOne, numTwo;
  List<Map<String, dynamic>> buttons = [];

  @override
  void initState() {
    _finalValue = 0.0;
    _operand = "";
    _display = TextEditingController();

    buttons = [
      {
        "onPressed" : () => addNumber('7'),
        "widget" : TextView(
          text: "7",
          size: 25.0,
          color: colors.mWhite,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          padding: EdgeInsets.symmetric(horizontal: 8.0,),
        ),
      },
      {
        "onPressed" : () => addNumber('8'),
        "widget" : TextView(
          text: "8",
          size: 25.0,
          color: colors.mWhite,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          padding: EdgeInsets.symmetric(horizontal: 8.0,),
        ),
      },
      {
        "onPressed" : () => addNumber('9'),
        "widget" : TextView(
          text: "9",
          size: 25.0,
          color: colors.mWhite,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          padding: EdgeInsets.symmetric(horizontal: 8.0,),
        ),
      },
      {
        "onPressed" : () => _clearAll(),
        "widget" : TextView(
          text: "C",
          size: 25.0,
          color: colors.mAccent,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.0,
          padding: EdgeInsets.symmetric(horizontal: 8.0,),
        ),
      },

      {
        "onPressed" : () => addNumber('4'),
        "widget" : TextView(
          text: "4",
          size: 25.0,
          color: colors.mWhite,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          padding: EdgeInsets.symmetric(horizontal: 8.0,),
        ),
      },
      {
        "onPressed" : () => addNumber('5'),
        "widget" : TextView(
          text: "5",
          size: 25.0,
          color: colors.mWhite,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          padding: EdgeInsets.symmetric(horizontal: 8.0,),
        ),
      },
      {
        "onPressed" : () => addNumber('6'),
        "widget" : TextView(
          text: "6",
          size: 25.0,
          color: colors.mWhite,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          padding: EdgeInsets.symmetric(horizontal: 8.0,),
        ),
      },
      {
        "onPressed" : () => addOperand('/'),
        "widget" : TextView(
          text: "/",
          size: 25.0,
          color: colors.mPrimary,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.0,
          padding: EdgeInsets.symmetric(horizontal: 8.0,),
        ),
      },

      {
        "onPressed" : () => addNumber('1'),
        "widget" : TextView(
          text: "1",
          size: 25.0,
          color: colors.mWhite,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          padding: EdgeInsets.symmetric(horizontal: 8.0,),
        ),
      },
      {
        "onPressed" : () => addNumber('2'),
        "widget" : TextView(
          text: "2",
          size: 25.0,
          color: colors.mWhite,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          padding: EdgeInsets.symmetric(horizontal: 8.0,),
        ),
      },
      {
        "onPressed" : () => addNumber('3'),
        "widget" : TextView(
          text: "3",
          size: 25.0,
          color: colors.mWhite,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          padding: EdgeInsets.symmetric(horizontal: 8.0,),
        ),
      },
      {
        "onPressed" : () => addOperand('*'),
        "widget" : TextView(
          text: "*",
          size: 25.0,
          color: colors.mPrimary,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.0,
          padding: EdgeInsets.symmetric(horizontal: 8.0,),
        ),
      },

      {
        "onPressed" : () => addNumber('0'),
        "widget" : TextView(
          text: "0",
          size: 25.0,
          color: colors.mWhite,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          padding: EdgeInsets.symmetric(horizontal: 8.0,),
        ),
      },
      {
        "onPressed" : () => addDecimal(),
        "widget" : TextView(
          text: ".",
          size: 25.0,
          color: colors.mWhite,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          padding: EdgeInsets.symmetric(horizontal: 8.0,),
        ),
      },
      {
        "onPressed" : () => addOperand('-'),
        "widget" : TextView(
          text: "-",
          size: 25.0,
          color: colors.mPrimary,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.0,
          padding: EdgeInsets.symmetric(horizontal: 8.0,),
        ),
      },
      {
        "onPressed" : () => addOperand('+'),
        "widget" : TextView(
          text: "+",
          size: 25.0,
          color: colors.mPrimary,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.0,
          padding: EdgeInsets.symmetric(horizontal: 8.0,),
        ),
      },
    ];

    super.initState();
  }

  void addNumber(String num) {
    _display.text = _display.text + num;
  }

  void addDecimal() {
    _display.text = _display.text + '.';
  }

  void addOperand(String op) async {
    numOne = double.parse(_display.text);
    if(op.contains('+')) {
      _operand = '+';
    } else if(op.contains('-')) {
      _operand = '-';
    } else if(op.contains('*')) {
      _operand = '*';
    } else if(op.contains('/')) {
      _operand = '/';
    }
    _display.clear();
  }

  void _clearAll() {
    setState(() {
      numOne = 0.0;
      numTwo = 0.0;
      _finalValue = 0.0;
      _operand = "";
      _display.clear();
    });
  }

  void displayVal() {
    if(_operand != '') {
      numTwo = double.parse(_display.text);
      if(_operand.contains('+')) {
        _finalValue = numOne + numTwo;
      } else if(_operand.contains('-')) {
        _finalValue = numOne - numTwo;
      } else if(_operand.contains('*')) {
        _finalValue = numOne * numTwo;
      } else if(_operand.contains('/')) {
        _finalValue = numOne / numTwo;
      }
    }
    _display.text = _finalValue.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: colors.mBackground,
      child: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsets.all(20.0,),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 150.0,
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(bottom: 20.0),
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: colors.mBtnBackground,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  controller: _display,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: colors.mWhite,
                    fontSize: 35.0,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  scrollPhysics: BouncingScrollPhysics(),
                )
              ),

              Expanded(
                child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: new List<Widget>.generate(buttons.length, (index) {
                    return CalculatorBtn(
                      onPressed: buttons[index]["onPressed"],
                      widget: buttons[index]["widget"],
                    );
                  }),
                ),
              ),
              CalculatorBtn(
                onPressed: () => displayVal(),
                widget: TextView(
                  text: "=",
                  size: 35.0,
                  color: colors.mWhite,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.0,
                  padding: EdgeInsets.symmetric(horizontal: 8.0,),
                  align: TextAlign.center,
                ),
                isEqual: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
