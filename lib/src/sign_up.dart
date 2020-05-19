import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'sign_in.dart';
import 'utils/custom/custom_circle_button.dart';
import 'utils/custom/custom_text_field.dart';
import 'utils/globals.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isObscureText = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/1.jpg"),
              fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text('Sign Up', style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold)),
                    GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Text('Log In', style: TextStyle(fontSize: 16, color: Colors.white70))),
                  ],
                ),
                SizedBox(height: 5),
                _textFormField(labelText: 'First name'),
                _textFormField(labelText: 'Last name'),
                _textFormField(labelText: 'Phone number'),
                _textFormField(labelText: 'Email'),
                _textFormField(labelText: 'Password'),
                SizedBox(height: 15),
                CustomCicleButton(label: 'Sign Up', textColor: Colors.white, backgroundColor: Colors.deepOrangeAccent,
                    width: mediaQuery(context, 1), height: 50, borderRadius: 8, fontSizeText: 16),
              ],
            ),
          )),
    );
  }

  _textFormField({width, height = 50.0, controllerTextField, keyboardType, textInputAction, maxLength, focusNode, onChanged,
    textCapitalization, nextFocusNode, labelText, suffixIcon, String Function() errorText}) {
    return Container(
        width: width,
        height: height,
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(8)
        ),
        child: TextFormField(
          controller: controllerTextField,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          maxLength: maxLength,
          focusNode: focusNode,
          onChanged: onChanged,
          textCapitalization: textCapitalization,
          //onFieldSubmitted: (v) {},
          onEditingComplete: () {
            FocusScope.of(context).requestFocus(nextFocusNode);
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white30), borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white30), borderRadius: BorderRadius.circular(8)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white30), borderRadius: BorderRadius.circular(8)),
            labelText: labelText,
            suffixIcon: suffixIcon == null ? null : IconButton(
                icon: Icon(
                  isObscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
                ),
                onPressed: (){
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                }),
            labelStyle: TextStyle(color: Colors.white),
            errorText: errorText == null ? null : errorText(),
          ),
        ));
  }
}
