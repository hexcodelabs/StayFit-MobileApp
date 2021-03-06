import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stayfit/controller/databaseController.dart';
import 'package:stayfit/utils/colors.dart';

class DrawerMenu extends StatelessWidget {
  final Color backgroundColor;
  final double screenWidth;
  final double screenHeight;
  final Animation slideAnimation;
  DrawerMenu({
    @required this.backgroundColor,
    @required this.screenWidth,
    @required this.screenHeight,
    @required this.slideAnimation,
  });
  @override
  Widget build(BuildContext context) {
    final providerDatabase = Provider.of<Database>(context, listen: false);
    double drawerWidth = screenWidth * 0.7;
    double profileImageSize = drawerWidth * 0.3;
    double drawerContainerSize = screenHeight - profileImageSize - 200;
    return SlideTransition(
      position: slideAnimation,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(top: 48, bottom: 8),
            width: drawerWidth,
            color: backgroundColor,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(profileImageSize / 2),
                  child: Container(
                    child: FadeInImage.assetNetwork(
                      fit: BoxFit.cover,
                      placeholder: 'assets/images/default-profile.png',
                      image: providerDatabase.gymUser.image,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(profileImageSize / 2),
                      color: transparentWhite10,
                    ),
                    height: profileImageSize,
                    width: profileImageSize,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 4),
                  child: Text(
                    providerDatabase.gymUser.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0, bottom: 24),
                  child: Text(
                    providerDatabase.gymUser.gmail,
                    style: TextStyle(
                      color: transparentWhite50,
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: black,
                        ),
                        child: ListView(
                          children: [
                            DrawerButton(
                              name: "GYM Profile",
                              icon: Icons.account_box,
                              onTap: () {},
                            ),
                            DrawerButton(
                              name: "Notifications",
                              icon: Icons.notifications,
                              onTap: () {
                                // Get.to(NotificationPage());
                              },
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(bottom: 5),
                            //   child: Divider(
                            //     thickness: 6,
                            //     color: backgroundColor,
                            //   ),
                            // ),
                            DrawerButton(
                              name: "Instructors",
                              icon: Icons.attach_money,
                              onTap: () {},
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(bottom: 5),
                            //   child: Divider(
                            //     thickness: 6,
                            //     color: backgroundColor,
                            //   ),
                            // ),
                            DrawerButton(
                              name: "Settings",
                              icon: Icons.settings,
                              onTap: () {
                                // Get.to(SettingsPage());
                              },
                            ),
                            DrawerButton(
                              name: "Help",
                              icon: Icons.phone,
                              onTap: () {},
                            ),
                            DrawerButton(
                              name: "Log Out",
                              icon: Icons.logout,
                              onTap: () {
                                // controller.signOut();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Version 0.1",
                  style: TextStyle(
                    color: transparentWhite50,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onTap;
  const DrawerButton({
    @required this.name,
    @required this.icon,
    @required this.onTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8, left: 8, right: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.only(top: 12, bottom: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: transparentWhite10,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 12),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
              Text(
                name,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
