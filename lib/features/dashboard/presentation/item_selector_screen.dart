import 'package:fastidemo/commons/mixins/progress_overlay_mixin.dart';
import 'package:fastidemo/config/colors.dart';
import 'package:fastidemo/features/dashboard/presentation/map_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemSelectorScreen extends StatefulWidget {
  @override
  _ItemSelectorScreenState createState() => _ItemSelectorScreenState();
}

class _ItemSelectorScreenState extends State<ItemSelectorScreen>
    with ProgressOverlayMixin {
  bool _showItems = true;

  bool bo1 = false;
  bool bo2 = false;
  bool bo3 = false;
  bool bo4 = false;
  bool bo5 = false;
  bool bo6 = false;
  bool bo7 = false;

  List<String> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                onChanged: (val) {
                  if (val.length == 2) {
                    showProgress(context);
                    Future.delayed(Duration(seconds: 2), () {
                      hideProgress();
                      setState(() {
                        _showItems = true;
                      });
                    });
                  } else {
                    setState(() {
                      _showItems = false;
                    });
                  }
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  labelText: 'Buscar producto',
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
                height: 32,
              ),
              _showItems
                  ? Expanded(
                      child: ListView(
                        children: [
                          CheckboxListTile(
                            onChanged: (val) {
                              setState(() {
                                bo1 = val;
                                if (val) {
                                  items.add('Tarro de leche Gloria Azul');
                                } else {
                                  items.removeWhere((element) =>
                                      element == 'Tarro de leche Gloria Azul');
                                }
                              });
                            },
                            subtitle: Text('Cód. producto: 5f960d4'),
                            value: bo1,
                            title: Text('Tarro de leche Gloria Azul'),
                          ),
                          CheckboxListTile(
                            onChanged: (val) {
                              setState(() {
                                bo2 = val;
                                if (val) {
                                  items.add('Panetón D\'Onofrio');
                                } else {
                                  items.removeWhere((element) =>
                                      element == 'Panetón D\'Onofrio');
                                }
                              });
                            },
                            subtitle: Text('Cód. producto: 7256cc'),
                            value: bo2,
                            title: Text('Panetón D\'Onofrio'),
                          ),
                          CheckboxListTile(
                            onChanged: (val) {
                              setState(() {
                                bo3 = val;
                                if (val) {
                                  items.add('Pan ciabatta');
                                } else {
                                  items.removeWhere(
                                      (element) => element == 'Pan ciabatta');
                                }
                              });
                            },
                            subtitle: Text('Cód. producto: 5d654c'),
                            value: bo3,
                            title: Text('Pan ciabatta'),
                          ),
                          CheckboxListTile(
                            onChanged: (val) {
                              setState(() {
                                bo4 = val;
                                if (val) {
                                  items.add('Panadol unidad');
                                } else {
                                  items.removeWhere(
                                      (element) => element == 'Panadol unidad');
                                }
                              });
                            },
                            subtitle: Text('Cód. producto: 960y41'),
                            value: bo4,
                            title: Text('Panadol unidad'),
                          ),
                          CheckboxListTile(
                            onChanged: (val) {
                              setState(() {
                                bo5 = val;
                                if (val) {
                                  items.add('Mantequilla de maní');
                                } else {
                                  items.removeWhere((element) =>
                                      element == 'Mantequilla de maní');
                                }
                              });
                            },
                            subtitle: Text('Cód. producto: 69765c'),
                            value: bo5,
                            title: Text('Mantequilla de maní'),
                          ),
                          CheckboxListTile(
                            onChanged: (val) {
                              setState(() {
                                bo6 = val;
                                if (val) {
                                  items.add('Papa amarilla');
                                } else {
                                  items.removeWhere(
                                      (element) => element == 'Papa amarilla');
                                }
                              });
                            },
                            subtitle: Text('Cód. producto: 8f9077'),
                            value: bo6,
                            title: Text('Papa amarilla'),
                          ),
                          CheckboxListTile(
                            onChanged: (val) {
                              setState(() {
                                bo7 = val;
                                if (val) {
                                  items.add('Aceite Primor');
                                } else {
                                  items.removeWhere(
                                      (element) => element == 'Aceite Primor');
                                }
                              });
                            },
                            subtitle: Text('Cód. producto: 764b4d'),
                            value: bo7,
                            title: Text('Aceite Primor'),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              SizedBox(
                height: 20,
              ),
              _showItems
                  ? SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        color: AppColors.primaryColor,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'Continuar',
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
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => MapScreen(
                                  items: items,
                                ),
                              ),
                            );
                          });
                        },
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(8.0),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
