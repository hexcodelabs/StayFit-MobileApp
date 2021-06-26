import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stayfit/controller/authController.dart';
import 'package:stayfit/controller/databaseController.dart';
import 'package:stayfit/utils/color.dart';
import 'package:stayfit/view/widgets/trainee_widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TraineeFavouritesPage extends StatefulWidget {
  @override
  _TraineeFavouritesPageState createState() => _TraineeFavouritesPageState();
}

class _TraineeFavouritesPageState extends State<TraineeFavouritesPage> {
  @override
  void initState() {
    super.initState();
    var providerDatabase = Provider.of<Database>(context, listen: false);
    var providerAuth = Provider.of<AuthFunctions>(context, listen: false);
    providerDatabase.favourites(providerAuth.userDetails["favourites"]);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    var providerDatabase = Provider.of<Database>(context);

    return !providerDatabase.getFavouritesFetchStatus
        ? Scaffold(
            backgroundColor: backgroundGrey,
            body: Center(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  'assets/images/loading.gif',
                ),
              ),
            ),
          )
        : Scaffold(
            backgroundColor: Color(0x0096a7af),
            body: Container(
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  colors: [
                    Color.fromRGBO(38, 76, 88, 1),
                    Color.fromRGBO(34, 52, 60, 1)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(32, 91, 32, 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "Subscription",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Container(
                        height: height * 0.75,
                        width: width,
                        child: StaggeredGridView.countBuilder(
                          physics: BouncingScrollPhysics(),
                          crossAxisCount: 2,
                          itemCount: providerDatabase.getFavourites.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (index % 2 == 0) {
                              return subscriptionCardOne(
                                  height,
                                  width,
                                  providerDatabase.getFavourites[index]["type"],
                                  providerDatabase.getFavourites[index]["name"],
                                  providerDatabase.getFavourites[index]["price"]);
                            } else if (index % 3 == 0) {
                              return subscriptionCardTwo(height, width,
                                  providerDatabase.getFavourites[index]["type"],
                                  providerDatabase.getFavourites[index]["name"],
                                  providerDatabase.getFavourites[index]["price"]);
                            } else {
                              return subscriptionCardThree(height, width,
                                  providerDatabase.getFavourites[index]["type"],
                                  providerDatabase.getFavourites[index]["name"],
                                  providerDatabase.getFavourites[index]["price"]);
                            }
                          },
                          staggeredTileBuilder: (int index) =>
                              new StaggeredTile.count(2, 1.5),
                          mainAxisSpacing: 5.0,
                          crossAxisSpacing: 5.0,
                        ))
                  ],
                ),
              ),
            ),
          );
  }
}
