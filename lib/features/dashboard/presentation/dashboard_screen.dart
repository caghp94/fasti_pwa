import 'package:fastidemo/commons/mixins/progress_overlay_mixin.dart';
import 'package:fastidemo/config/colors.dart';
import 'package:fastidemo/features/dashboard/presentation/item_selector_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with ProgressOverlayMixin {
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
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        actions: [
          Center(
            child: Text(
              'Bienvenido, Arturo',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset(
              'assets/images/avatar.png',
              height: 35,
              width: 35,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              TextField(
                onChanged: (_) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => ItemSelectorScreen()));
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
              Text(
                'Vuélvelos a buscar',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Wrap(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: new BoxDecoration(
                          border: Border.all(
                              color: AppColors.primaryColor, width: 2.0),
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                "https://plazavea.vteximg.com.br/arquivos/ids/344996-1000-1000/1465.jpg?v=637287873136600000"),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: new BoxDecoration(
                          border: Border.all(
                              color: AppColors.primaryColor, width: 2.0),
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: new NetworkImage(
                                "https://plazavea.vteximg.com.br/arquivos/ids/226336-450-450/20064627.jpg?v=636976866702630000"),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: new BoxDecoration(
                          border: Border.all(
                              color: AppColors.primaryColor, width: 2.0),
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                "https://e00-elmundo.uecdn.es/assets/multimedia/imagenes/2018/03/16/15212064146858.jpg"),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: new BoxDecoration(
                          border: Border.all(
                              color: AppColors.primaryColor, width: 2.0),
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                "https://i-cf3.gskstatic.com/content/dam/cf-consumer-healthcare/panadol/es_PE/peru-product-images/panadol-forte/Pnadol_forte_455x455.jpg?auto=format"),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: new BoxDecoration(
                          border: Border.all(
                              color: AppColors.primaryColor, width: 2.0),
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: new NetworkImage(
                                "https://agroingeniacanarias.com/wp-content/uploads/2018/08/Cultivo-de-la-papa-en-Canarias.jpg"),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: new BoxDecoration(
                          border: Border.all(
                              color: AppColors.primaryColor, width: 2.0),
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                "https://www.chedraui.com.mx/medias/7500435108089-01-CH1200Wx1200H?context=bWFzdGVyfHJvb3R8MTQ4NDg3fGltYWdlL2pwZWd8aDI2L2g3OS85ODc0NzQ4MzA5NTM0LmpwZ3xjYTQ2YWQxMWZkMzAzODA3NWU2N2RmZDM3OGRjYWJhN2Q5OGU3M2VlNjU4Mjk4ZDI3ZmViZTRlNGE1YzkyY2Q5"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Lo nuevo cerca a tu casa',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: new BoxDecoration(
                          border: Border.all(
                              color: AppColors.primaryColor, width: 2.0),
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.contain,
                            image: new NetworkImage(
                                "https://static.carrefour.es/hd_510x_/img_pim_food/134223_00_1.jpg"),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: new BoxDecoration(
                          border: Border.all(
                              color: AppColors.primaryColor, width: 2.0),
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.contain,
                            image: new NetworkImage(
                                "https://scentmaticperu.com/wp-content/uploads/2020/06/jabon-liquido-antibacterial-floral-perfection-400-ml-brillamax.png"),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: new BoxDecoration(
                          border: Border.all(
                              color: AppColors.primaryColor, width: 2.0),
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.contain,
                            image: new NetworkImage(
                                "https://oechsle.vteximg.com.br/arquivos/ids/2163631-1500-1500/image-37bf569cb81a47658a8bdb0df4a41fc0.jpg?v=637345137299070000"),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: new BoxDecoration(
                          border: Border.all(
                              color: AppColors.primaryColor, width: 2.0),
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.contain,
                            image: new NetworkImage(
                                "https://www.tienda-peruana.com/849-home_default/galletas-soda-field-sabor-del-peru.jpg"),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: new BoxDecoration(
                          border: Border.all(
                              color: AppColors.primaryColor, width: 2.0),
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.contain,
                            image: new NetworkImage(
                                "https://www.sucosorder.com/media/images/org/x542_1-fanta-uva-brasilien.jpg"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
