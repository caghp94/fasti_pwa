import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:fastidemo/config/colors.dart';
import 'package:flutter/material.dart';

class ProgressOverlay {
  static final ProgressOverlay _singleton = ProgressOverlay._internal();

  factory ProgressOverlay(){
    return _singleton;
  }

  ProgressOverlay._internal();
  
  OverlayEntry _progressOverlayEntry;

  void show(BuildContext context) {
    _progressOverlayEntry = _createProgressEntry(context);
    Overlay.of(context).insert(_progressOverlayEntry);
    BackButtonInterceptor.add(backButtonPreventer);
  }

  void hide() {
    if (_progressOverlayEntry != null) {
      _progressOverlayEntry.remove();
      _progressOverlayEntry = null;
      BackButtonInterceptor.remove(backButtonPreventer);
    }
  }

  bool backButtonPreventer(bool stopDefaultButtonEvent, _){
    return true;
  }

  OverlayEntry _createProgressEntry(BuildContext context) {
    //var _mediaQuery = MediaQuery.of(context);

    return OverlayEntry(
      builder: (BuildContext context) => Stack(
        children: <Widget>[
          Container(color: Colors.black.withOpacity(0.7)),
          Center(/*
            child: SpinKitFadingCircle(
              color: AppColors.ligoAccent,
              size: MediaQuery.of(context).size.width * 0.15,
            ),*/
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20.0,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
