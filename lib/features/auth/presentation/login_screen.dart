import 'package:fastidemo/commons/mixins/progress_overlay_mixin.dart';
import 'package:fastidemo/commons/mixins/snacks_mixin.dart';
import 'package:fastidemo/config/colors.dart';
import 'package:fastidemo/features/dashboard/presentation/dashboard_screen.dart';
import 'package:fastidemo/features/signup/presentation/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SnacksMixin, ProgressOverlayMixin {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _namesController = TextEditingController();
  TextEditingController _surnamesController = TextEditingController();
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
                              onPressed: () {
                                showProgress(context);
                                Future.delayed(Duration(seconds: 2), () {
                                  hideProgress();
                                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => DashboardScreen()));
                                });
                              },
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

  void validateFields() {
    if (_phoneController.text.isEmpty ||
        _namesController.text.isEmpty ||
        _surnamesController.text.isEmpty) {
      showErrorSnack(
          context: context, message: 'Por favor, completa todos los campos.');
    } else {}
  }
}
