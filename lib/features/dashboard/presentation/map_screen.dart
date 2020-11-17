import 'dart:async';
import 'dart:convert';

import 'package:fastidemo/commons/mixins/progress_overlay_mixin.dart';
import 'package:fastidemo/config/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class MapScreen extends StatefulWidget {
  final List<String> items;

  const MapScreen({Key key, this.items}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with ProgressOverlayMixin {
  Completer<GoogleMapController> _controller = Completer();
  String products = '';

  Set<Marker> _markers = Set.from([
    Marker(
        markerId: MarkerId('miposicion'),
        position: LatLng(-16.405565, -71.542113),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure))
  ]);

  CameraPosition _initialCamera = CameraPosition(
    target: LatLng(-16.405565, -71.542113),
    zoom: 16,
  );

  String apiKey = 'AIzaSyC-RzunQQVIZswOKdDVFyf-yQXZxTRTgTs';

  final Set<Polyline> _polyLines = {};
  Set<Polyline> get polyLines => _polyLines;

  void createRoute(String encondedPoly) {
    _polyLines.add(Polyline(
        polylineId: PolylineId(DateTime.now().toString()),
        width: 4,
        points: _convertToLatLng(_decodePoly(encondedPoly)),
        color: Colors.red));
  }

  List<LatLng> _convertToLatLng(List points) {
    List<LatLng> result = <LatLng>[];
    for (int i = 0; i < points.length; i++) {
      if (i % 2 != 0) {
        result.add(LatLng(points[i - 1], points[i]));
      }
    }
    return result;
  }

  List _decodePoly(String poly) {
    var list = poly.codeUnits;
    var lList = new List();
    int index = 0;
    int len = poly.length;
    int c = 0;
    do {
      var shift = 0;
      int result = 0;
      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      } while (c >= 32);
      if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      lList.add(result1);
    } while (index < len);
    for (var i = 2; i < lList.length; i++) lList[i] += lList[i - 2];
    print(lList.toString());
    return lList;
  }

  void sendRequest() async {
    LatLng destination = LatLng(-16.404735, -71.536341);
    String route =
        await getRouteCoordinates(LatLng(-16.405565, -71.542113), destination);
    createRoute(route);

    BitmapDescriptor _markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(48, 48)), 'assets/images/shop.png');
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId('tienda'),
          position: destination,
          icon: _markerIcon,
          infoWindow: InfoWindow(title: 'Don Pepe')));
    });
  }

  void sendRequestSecond() async {
    LatLng destination = LatLng(-16.407579, -71.5335667);
    String route =
        await getRouteCoordinates(LatLng(-16.404735, -71.536341), destination);
    createRoute(route);

    BitmapDescriptor _markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(48, 48)), 'assets/images/shop.png');
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId('tiendados'),
          position: destination,
          icon: _markerIcon,
          infoWindow: InfoWindow(title: 'Bodega Rocoto Relleno')));
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showProgress(context);
      sendRequest();
      if (widget.items.contains('Panetón D\'Onofrio')) {
        sendRequestSecond();
      }
      Future.delayed(Duration(seconds: 2), () {
        hideProgress();
      });
      setState(() {
        widget.items.forEach((element) {
          if (element != 'Panetón D\'Onofrio') {
            products += '\n- $element';
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
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
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            markers: _markers,
            polylines: _polyLines,
            myLocationEnabled: false,
            initialCameraPosition: _initialCamera,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/shop.png', width: 40),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: 'Dirígete a: ',
                                children: [
                                  TextSpan(
                                    text: 'Don Pepe',
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Text('Calle Nicolás de Piérola 103'),
                            Text(products)
                          ],
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
    );
  }

  Future<String> getRouteCoordinates(LatLng l1, LatLng l2) async {
    String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${l1.latitude},${l1.longitude}&destination=${l2.latitude},${l2.longitude}&key=$apiKey&mode=walking";
    print(url);
    http.Response response = await http.get(url);
    Map values = jsonDecode(response.body);
    return values["routes"][0]["overview_polyline"]["points"];
  }
}
