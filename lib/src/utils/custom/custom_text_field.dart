import 'package:flutter/material.dart';

import '../globals.dart';

class CustomTextField extends StatefulWidget {
  final double width;
  final double height;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final int maxLength;
  final FocusNode focusNode;
  final onChanged;
  final TextCapitalization textCapitalization;
  final FocusNode focusScope;
  final String labelText;
  final Color color;
  final TextAlign textAlign;
  bool iconBool;
  final IconData suffixIcon1;
  final IconData suffixIcon2;
  String Function() errorText;

  CustomTextField({Key key, this.width, this.height, this.controller, this.keyboardType, this.textInputAction, this.maxLength,
    this.focusNode, this.onChanged, this.textCapitalization, this.focusScope, this.labelText, this.color = Colors.white,
    this.textAlign = TextAlign.start, this.iconBool = false, this.suffixIcon1, this.suffixIcon2, this.errorText}) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height == null ? mediaQuery(context, 0.15) : widget.height,
      width: widget.width,
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(8)
      ),
      child: TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          maxLength: widget.maxLength,
          focusNode: widget.focusNode,
          onChanged: widget.onChanged,
          //textCapitalization: widget.textCapitalization,
          textAlign: widget.textAlign,
          autofocus: false,
          cursorColor: widget.color,
          style: TextStyle(color: Colors.white),
          obscureText: widget.iconBool,
          //textCapitalization: textCapitalization,
          //inputFormatters: [BlacklistingTextInputFormatter(RegExp(r'[.,]'))],
          onFieldSubmitted: (v){
            FocusScope.of(context).requestFocus(widget.focusScope);
          },
          decoration: InputDecoration(
            //counterText: '',
            //counter: Offstage(),
            //hintText: widget.labelText,
            suffixIcon: widget.suffixIcon1 == null ? null : IconButton(
                icon: Icon(
                  widget.iconBool ? widget.suffixIcon1 : widget.suffixIcon2,
                  color: Colors.white70,
                ),
                onPressed: (){
                  setState(() {
                    widget.iconBool = !widget.iconBool;
                  });
                }),
            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white30), borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white30), borderRadius: BorderRadius.circular(8)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white30), borderRadius: BorderRadius.circular(8)),
            labelText: widget.labelText,
            labelStyle: TextStyle(color: Colors.white),
            errorText: widget.errorText == null ? null : widget.errorText(),
          ),
      ),
    );
  }
}
