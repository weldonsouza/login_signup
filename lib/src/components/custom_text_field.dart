import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final double width;
  final double height;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final int maxLength;
  final int maxLines;
  final FocusNode focusNode;
  final onChanged;
  final TextCapitalization textCapitalization;
  final FocusNode focusScope;
  final String labelText;
  final Color color;
  final Color colorText;
  final Color colorBord;
  final TextAlign textAlign;
  bool iconBool;
  final IconData suffixIcon1;
  final IconData suffixIcon2;
  String Function() errorText;
  final validate;
  final onEditingComplete;
  Function() onFieldSubmitted;
  final onTap;
  final onPressed;
  bool autovalidate;
  bool readOnly;
  Widget prefixIcon;

  CustomTextField(
      {Key key,
      this.width,
      this.height,
      this.controller,
      this.keyboardType,
      this.textInputAction,
      this.maxLength,
      this.maxLines,
      this.focusNode,
      this.onChanged,
      this.textCapitalization = TextCapitalization.none,
      this.focusScope,
      this.labelText,
      this.color = Colors.white,
      this.colorText,
      this.colorBord,
      this.textAlign = TextAlign.start,
      this.iconBool = false,
      this.suffixIcon1,
      this.suffixIcon2,
      this.errorText,
      this.validate,
      this.onTap,
      this.onPressed,
      this.readOnly = false,
      this.prefixIcon,
      this.autovalidate = true,
      this.onFieldSubmitted,
      this.onEditingComplete})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      //height: widget.height == null ? mediaQuery(context, 0.15) : widget.height,
      margin: EdgeInsets.symmetric(
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        maxLength: widget.maxLength,
        focusNode: widget.focusNode,
        onChanged: widget.onChanged,
        textCapitalization: widget.textCapitalization,
        textAlign: widget.textAlign,
        autofocus: false,
        cursorColor: widget.color,
        style: TextStyle(color: Colors.white),
        obscureText: widget.iconBool,
        onFieldSubmitted: (v) {
          widget.onFieldSubmitted == null
              ? FocusScope.of(context).requestFocus(widget.focusScope)
              : widget.onFieldSubmitted;
        },
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon == null ? null : widget.prefixIcon,
          suffixIcon: widget.suffixIcon1 == null
              ? widget.suffixIcon2 == null
                  ? null
                  : IconButton(
                      icon: Icon(
                        widget.suffixIcon2,
                        color: widget.colorText,
                        size: 20,
                      ),
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        // ignore: unnecessary_statements
                        widget.onPressed;
                      },
                    )
              : IconButton(
                  icon: Icon(
                    widget.iconBool ? widget.suffixIcon1 : widget.suffixIcon2,
                    color: widget.colorText,
                    size: 20,
                  ),
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    setState(() {
                      widget.iconBool = !widget.iconBool;
                    });
                  },
                ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white30),
              borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white30),
              borderRadius: BorderRadius.circular(8)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white30),
              borderRadius: BorderRadius.circular(8)),
          labelText: widget.labelText,
          labelStyle: TextStyle(color: Colors.white),
          errorText: widget.errorText == null ? null : widget.errorText(),
        ),
      ),
    );
  }
}
