library my_prj.globals;

import 'package:flutter/material.dart';

String app = 'Login';

//var colorBase = Color(0xFFB11E24);
var colorBase = Color(0xff467eac);

//Cor azul
//var colorAzulPetroleo = Color(0xff084d6e);
//Cor azul
var colorBlue1 = Color(0xFF83C3F7);
var colorBlue2 = Color(0xFF3C90EF);
var colorBlue3 = Color(0xFF467EAC);
var colorBlue4 = Color(0xFF213651);
var colorBlue5 = Color(0xFF1C293A);
var colorBlue6 = Color(0xFF131D2A);
var colorBlue7 = Color(0xFF101823);

//Cor vermelho
var colorRed1 = Color(0xFFE57373);
var colorRed2 = Color(0xFFef5350);

//Cor verde
var colorGreen1 = Color(0xff80CBC4);
var colorGreen2 = Color(0xFF4EC5AC);

//Cor Laranja
var colorOrange1 = Color(0xFFFEC177);
var colorOrange2 = Color(0xFFFFA335);

mediaQuery(BuildContext context, double value) {
  MediaQueryData mediaQuery = MediaQuery.of(context);
  Size size = mediaQuery.size;

  var result = size.width * value;
  return result;
}