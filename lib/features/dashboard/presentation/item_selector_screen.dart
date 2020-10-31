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
  bool _showItems = false;

  bool bo1 = false;
  bool bo2 = false;
  bool bo3 = false;
  bool bo4 = false;
  bool bo5 = false;
  bool bo6 = false;
  bool bo7 = false;

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
                              });
                            },
                            value: bo1,
                            title: Text('Pan de molde Bimbo'),
                          ),
                          CheckboxListTile(
                            onChanged: (val) {
                              setState(() {
                                bo2 = val;
                              });
                            },
                            value: bo2,
                            title: Text('Pan para hamburguesa'),
                          ),
                          CheckboxListTile(
                            onChanged: (val) {
                              setState(() {
                                bo3 = val;
                              });
                            },
                            value: bo3,
                            title: Text('Pan ciabatta'),
                          ),
                          CheckboxListTile(
                            onChanged: (val) {
                              setState(() {
                                bo4 = val;
                              });
                            },
                            value: bo4,
                            title: Text('Paisana arroz extra'),
                          ),
                          CheckboxListTile(
                            onChanged: (val) {
                              setState(() {
                                bo5 = val;
                              });
                            },
                            value: bo5,
                            title: Text('Panadol pastilla'),
                          ),
                          CheckboxListTile(
                            onChanged: (val) {
                              setState(() {
                                bo6 = val;
                              });
                            },
                            value: bo6,
                            title: Text('Paracetamol'),
                          ),
                          CheckboxListTile(
                            onChanged: (val) {
                              setState(() {
                                bo7 = val;
                              });
                            },
                            value: bo7,
                            title: Text('Pasas'),
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
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => MapScreen()));
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
