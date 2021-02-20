library pin_view;

import 'package:flutter/material.dart';


class SmsListener {
  final String from;
  final Function formatBody;

  SmsListener({@required this.from, this.formatBody});
}

class PinView extends StatefulWidget {
  final Function submit;
  final int count;
  final bool obscureText;
  final bool autoFocusFirstField;
  final bool enabled;
  final List<int> dashPositions;
  final SmsListener sms;
  final TextStyle style;
  final TextStyle dashStyle;
  final InputDecoration inputDecoration;
  final EdgeInsetsGeometry margin;

  PinView({@required this.submit,
    @required this.count,
    this.obscureText: false,
    this.autoFocusFirstField: true,
    this.enabled: true,
    this.dashPositions: const [],
    this.sms,
    this.dashStyle: const TextStyle(fontSize: 30.0, color: Colors.grey),
    this.style: const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
    ),
    this.inputDecoration:
    const InputDecoration(border: OutlineInputBorder()),
    this.margin: const EdgeInsets.all(5.0)});

  @override
  _PinViewState createState() => _PinViewState();
}

class _PinViewState extends State<PinView> {
  List<TextEditingController> _controllers;
  List<FocusNode> _focusNodes;
  List<String> _pin;
  // SmsReceiver _smsReceiver;
  String whitespaceCharacter = "\uFEFF";
  // String whitespaceCharacter = "X";

  @override
  void initState() {
    super.initState();
    if (widget.sms != null) {
      _listenSms();
    }
    _pin = List<String>.generate(widget.count, (int index) => "");
    _focusNodes =
        List.generate(widget.count, (int index) => FocusNode()).toList();
    _controllers =
        List.generate(widget.count, (int index) => TextEditingController());
    for (TextEditingController controller in _controllers) {
      controller.text = whitespaceCharacter;
      _pin[_controllers.indexOf(controller)] = controller.text;
    }
  }

  void _listenSms() async {
    // _smsReceiver = SmsReceiver();
    // _smsReceiver.onSmsReceived.listen((SmsMessage message) {
    //   if (message.sender == widget.sms.from) {
    //     String code = widget.sms.formatBody != null
    //         ? widget.sms.formatBody(message.body)
    //         : message.body;
    //     for (TextEditingController controller in _controllers) {
    //       controller.text = code[_controllers.indexOf(controller)];
    //       _pin[_controllers.indexOf(controller)] = controller.text;
    //     }
    //
    //     widget.submit(_pin.join());
    //   }
    // });
  }

  Widget _dash() {
    return Flexible(flex: 1, child: Text("-", style: widget.dashStyle));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pins = List<Widget>.generate(
        widget.count, (int index) => _singlePinView(index)).toList();

    for (int i in widget.dashPositions) {
      if (i <= widget.count) {
        List<int> smaller =
        widget.dashPositions.where((int d) => d < i).toList();
        pins.insert(i + smaller.length, _dash());
      }
    }

    return Container(
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: pins),
    );
  }

  Widget _singlePinView(int index) {
    return Flexible(
      flex: 3,
      child: Container(
        margin: widget.margin,
        child: SizedBox(
          width: 60.0,
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10.0),
            child: TextSelectionGestureDetector(
              onSingleTapUp: (details) {
                print(index);
                for (TextEditingController controller in _controllers) {
                  if(controller.text.length == 0 ){
                    controller.text = whitespaceCharacter;
                  }

                  _pin[_controllers.indexOf(controller)] = controller.text;
                }
                var cursorPos = _controllers[index ].selection;
                cursorPos = new TextSelection.fromPosition(
                    new TextPosition(
                        offset: _controllers[index ].text.length));
                _controllers[index ].selection = cursorPos;
                FocusScope.of(context).requestFocus(_focusNodes[index]);
              },
              child : TextField(
                enabled: widget.enabled,
                controller: _controllers[index],
                obscureText: widget.obscureText,
                autofocus: widget.autoFocusFirstField ? index == 0 : false,
                focusNode: _focusNodes[index],
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: widget.style,
                decoration: widget.inputDecoration,
                textInputAction: TextInputAction.next,
                onChanged: (String val) {
                  print("KEY " + val);
                  if (val.length == 1) {
                    print("deleting arg 1");
                    _pin[index] = val;
                    if (index != _focusNodes.length - 1) {
                      _focusNodes[index].unfocus();
                      _pin[index + 1] = "";
                      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                    }
                  } else if (val.length == 2) {
                    print("deleting arg 2");
                    if(index == 0 ){
                      print("deleting arg 2 index " + index.toString());

                      _controllers[index].text = val.substring(1);
                      _pin[index] = val.substring(1);
                      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                      return;
                    }else{
                      print("deleting arg 2 index " + index.toString());

                      _controllers[index].text = val.substring( 1);
                      _pin[index] = val.substring(1);
                    }


                    if ((index + 1) < _controllers.length) {
                      _pin[index + 1] = val.substring(1);
                      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                    } else {
                      var cursorPos = _controllers[index ].selection;
                      cursorPos = new TextSelection.fromPosition(
                          new TextPosition(
                              offset: _controllers[index ].text.length));
                      _controllers[index ].selection = cursorPos;
                      FocusScope.of(context).requestFocus(_focusNodes[index]);
                    }
                  } else {

                    print("deleting back key ");
                    if (_controllers[index ].text.indexOf(whitespaceCharacter) >= 0) {
                      _focusNodes[index].unfocus();
                      _controllers[index].text = whitespaceCharacter;
                      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
                      _controllers[index - 1].text = whitespaceCharacter;
                    }

                    _pin[index] = "";
                    if (index != 0) {
                      _focusNodes[index].unfocus();
                      _controllers[index].text = whitespaceCharacter;
                      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
                    }
                  }

                  if (_pin.indexOf("") == -1) {
                    print("FINAL");
                    widget.submit(_pin.join());
                  }
                },
              ),),),),),);
  }
}