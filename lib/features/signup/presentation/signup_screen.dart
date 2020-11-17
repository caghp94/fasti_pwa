import 'dart:convert';

import 'package:fastidemo/commons/mixins/progress_overlay_mixin.dart';
import 'package:fastidemo/commons/mixins/snacks_mixin.dart';
import 'package:fastidemo/config/colors.dart';
import 'package:fastidemo/config/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with ProgressOverlayMixin, SnacksMixin {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _namesController = TextEditingController();
  TextEditingController _surnamesController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        title: Text(
          'Nuevo usuario',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Solo necesitaremos algunos datos para continuar :)',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 32,
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Celular',
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.primaryColor, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.5), width: 2.0),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                controller: _namesController,
                decoration: InputDecoration(
                  labelText: 'Nombres',
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.primaryColor, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.5), width: 2.0),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                controller: _surnamesController,
                decoration: InputDecoration(
                  labelText: 'Apellidos',
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.primaryColor, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.5), width: 2.0),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.primaryColor, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.5), width: 2.0),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  color: AppColors.primaryColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Registrarme',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Colors.black.withOpacity(0.7),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  onPressed: () {
                    validateFields();
                  },
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validateFields() async {
    if (_phoneController.text.isEmpty ||
        _namesController.text.isEmpty ||
        _surnamesController.text.isEmpty) {
      showErrorSnack(
          context: context, message: 'Por favor, completa todos los campos.');
    } else {
      showProgress(context);

      var response = await http.post(
        '${AppStrings.apiUsersUrl}/users',
        headers: {'Content-Type': AppStrings.JSON_MEDIA_TYPE},
        body: json.encode({
          'phoneNumber': _phoneController.text,
          'name': _namesController.text,
          'surname': _surnamesController.text,
          'password': _passwordController.text
        }),
      );

      hideProgress();
      Navigator.of(context).pop();
    }
  }
}
