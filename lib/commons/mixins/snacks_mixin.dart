import 'package:fastidemo/config/colors.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

mixin SnacksMixin {
  final Duration _defaultDuration = Duration(milliseconds: 4000);

  void showErrorSnack(
      {@required BuildContext context,
      @required String message,
      String title: 'Error'}) {
    Flushbar(
      leftBarIndicatorColor: Colors.red,
      messageText: Text(
        message,
        style: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(color: AppColors.error),
      ),
      duration: _defaultDuration,
      backgroundColor: AppColors.errorBackground,
      icon: Icon(Icons.error, color: AppColors.error,),
    )..show(context);
  }
}
