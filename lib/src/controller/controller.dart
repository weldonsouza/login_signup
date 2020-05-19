import 'package:flutter/material.dart';

class Controller with ChangeNotifier {
  String _name, _lastName, _email, _country, _phone;
  dynamic _password, _passwordRetype;
  int _dateBirth;
  bool _checkbox;

  Controller(this._name, this._lastName, this._email, this._country, this._phone,
      this._dateBirth, this._password, this._passwordRetype, this._checkbox);

  //Valor para exibir
  getControllerName() => _name;
  getControllerLastName() => _lastName;
  getControllerEmail() => _email;
  getControllerCountry() => _country;
  getControllerPhone() => _phone;
  getControllerDateBirth() => _dateBirth;
  getControllerDatePassword() => _password;
  getControllerDatePasswordRetype() => _passwordRetype;
  getControllerDateCheckbox() => _checkbox;

  //Ataulização da informação
  changeName(String value) {
    _name = value;
    notifyListeners();
  }

  changeLastName(String value) {
    _lastName = value;
    notifyListeners();
  }

  changeEmail(String value) {
    _email = value;
    notifyListeners();
  }

  changeCountry(String value) {
    _country = value;
    notifyListeners();
  }

  changePhone(String value) {
    _phone = value;
    notifyListeners();
  }

  changeDateBirth(int value) {
    _dateBirth = value;
    notifyListeners();
  }

  changePassword(int value) {
    _password = value;
    notifyListeners();
  }

  changePasswordRetype(int value) {
    _passwordRetype = value;
    notifyListeners();
  }

  changeCheckbox(bool value) {
    _checkbox = value;
    notifyListeners();
  }


  //Validações
  bool get isValid {
    return validateName() != null;
  }

  String validateName() {
    if (_name.isEmpty) {
      //return 'Este campo é obrigatorio.';
    } else if (_name.length <= 3) {
      return 'Seu nome precisa ter mais de 3 caracteres.';
    } else if (int.tryParse(_name) != null) {
      return 'Insira um nome válido';
    }

    return null;
  }

  String validateLastName() {
    if (_lastName.isEmpty) {
      return null;
    } else if (_lastName.length <= 3) {
      return 'Seu sobrenome precisa ter mais de 3 caracteres.';
    } else if (int.tryParse(_lastName) != null) {
      return 'Insira um nome válido';
    }

    return null;
  }

  String validateEmail() {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (_email.length == 0) {
      return null;
    } else if(!regExp.hasMatch(_email)){
      return "Email inválido";
    } else {
      return null;
    }
  }

  String validateCountry() {

    return null;
  }

  String validatePhone() {
    if (_phone.isEmpty) {
      return null;
    } else if (_phone.length < 9) {
      return 'Seu numero deve ter mais de 8 caracteres.';
    }

    return null;
  }
}