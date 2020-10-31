import 'package:fastidemo/commons/mixins/progress_overlay_mixin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with ProgressOverlayMixin{
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showProgress(context);
      Future.delayed(Duration(seconds: 2), () {
        hideProgress();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        title: Text(
          'Mejor ruta',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SizedBox.expand(
        child: Image.asset(
          'assets/images/map_preview.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
