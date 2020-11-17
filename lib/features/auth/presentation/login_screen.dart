import 'dart:convert';

import 'package:fastidemo/commons/mixins/progress_overlay_mixin.dart';
import 'package:fastidemo/commons/mixins/snacks_mixin.dart';
import 'package:fastidemo/config/colors.dart';
import 'package:fastidemo/config/strings.dart';
import 'package:fastidemo/features/auth/models/login_response.dart';
import 'package:fastidemo/features/dashboard/presentation/dashboard_screen.dart';
import 'package:fastidemo/features/signup/presentation/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SnacksMixin, ProgressOverlayMixin {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _namesController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: _size.height,
          width: _size.width,
          child: Stack(
            children: [
              Container(
                color: AppColors.primaryColor.withOpacity(0.8),
              ),
              Container(
                child: Image.asset(
                  'assets/images/auth_background.png',
                  width: _size.width,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                height: _size.height / 2,
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: _size.width * 0.25,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: _size.height / 2,
                  width: _size.width,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Comienza ahora',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextField(
                            controller: _phoneController,
                            decoration: InputDecoration(
                              labelText: 'Celular',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.primaryColor, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.5),
                                    width: 2.0),
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
                                borderSide: BorderSide(
                                    color: AppColors.primaryColor, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.5),
                                    width: 2.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: RaisedButton(
                              color: AppColors.primaryColor,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 12),
                                child: Text(
                                  'Iniciar sesión',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                          color: Colors.black.withOpacity(0.7),
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                              onPressed: validateFields,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => SignUpScreen()));
                            },
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Registrarse',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void validateFields() async {
    if (_phoneController.text.isEmpty || _passwordController.text.isEmpty) {
      showErrorSnack(
          context: context, message: 'Por favor, completa todos los campos.');
    } else {
      showProgress(context);

      var response = await http.post(
        '${AppStrings.apiUsersUrl}/users/auth',
        headers: {'Content-Type': AppStrings.JSON_MEDIA_TYPE},
        body: json.encode({
          'phoneNumber': _phoneController.text,
          'password': _passwordController.text
        }),
      );

      var loginResponse = LoginResponse.fromJson(json.decode(response.body));

      if (loginResponse.status == 1) {
        hideProgress();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => DashboardScreen()));
      } else {
        hideProgress();
        showErrorSnack(
            context: context, message: 'Por favor, verifica tus credenciales');
      }
    }
  }
}
