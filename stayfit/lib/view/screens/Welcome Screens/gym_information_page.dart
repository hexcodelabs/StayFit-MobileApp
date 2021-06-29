import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:stayfit/controller/authController.dart';
import 'package:stayfit/controller/databaseController.dart';
import 'package:stayfit/utils/themes.dart';
import 'package:stayfit/view/screens/GYM/GYM_drawer_handler.dart';
import 'package:stayfit/view/widgets/customContainer.dart';
import 'package:stayfit/view/widgets/customTextField.dart';
import 'package:stayfit/view/widgets/mainButton.dart';
import 'package:stayfit/view/widgets/type_container.dart';
import '../../../utils/color.dart';

class GymInformationScreen extends StatefulWidget {
  GymInformationScreen({Key key}) : super(key: key);

  @override
  _GymInformationScreenState createState() => _GymInformationScreenState();
}

class _GymInformationScreenState extends State<GymInformationScreen> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController adminController = new TextEditingController();
  TextEditingController gmailController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();
  TextEditingController typeController = new TextEditingController();
  String dropdownValue = "+94";
  String typeValue = "Yoga";

  var providerAuth;
  var providerDatabase;
  List<String> typeList = [];

  @override
  void initState() {
    super.initState();
    providerAuth = Provider.of<AuthFunctions>(context, listen: false);
    providerDatabase = Provider.of<Database>(context, listen: false);

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    nameController.text = "";
    adminController = new TextEditingController();
    gmailController.text = "";
    addressController.text = "";
    phoneNumberController.text = "";
    typeController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backgroundGrey,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: MainButton(
          width: width * 0.7,
          height: height,
          onPressed: () async {
            var _gymData = {
              "address": addressController.text,
              "admin": adminController.text,
              "instructors": [],
              "likes": 0,
              "name": nameController.text,
              "phone_number": dropdownValue + phoneNumberController.text,
              "sessions": [],
              "types": typeList,
              "gmail": gmailController.text,
            };
            await providerDatabase.createGYM(
                providerAuth.firebaseUser.uid, _gymData);

            if (providerDatabase.gymCreateStatus) {
              print("Successfully recorded");
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => GYMDrawerHandler()),
              );
            } else {
              showSimpleNotification(Text("Error! Please try again"),
                  background: Colors.red);
            }
          },
          text: "Next",
          suffixIcon: SvgPicture.asset("assets/images/next.svg"),
          boxColor: mainGreen,
          shadowColor: mainGreen,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomContainer(
                    width: 50,
                    height: 50,
                    boxColor: mainGreen,
                    radius: 12,
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  Text(
                    "Hello!",
                    style: AppTheme.topicTS,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Let's introduce",
                    style: AppTheme.subTopicTS,
                  ),
                  CustomTextField(
                    height: height,
                    width: width - 60,
                    controller: nameController,
                    hintText: "Name",
                    prefixBoxColor: darkYellow,
                    prefixIcon: Icon(
                      Icons.person,
                      color: lightYellow,
                    ),
                  ),
                  CustomTextField(
                    height: height,
                    width: width - 60,
                    controller: adminController,
                    hintText: "Admin",
                    prefixBoxColor: darkYellow,
                    prefixIcon: Icon(
                      Icons.admin_panel_settings,
                      color: lightYellow,
                    ),
                  ),
                  CustomTextField(
                    height: height,
                    width: width - 60,
                    controller: gmailController,
                    hintText: "E-mail",
                    prefixBoxColor: darkYellow,
                    prefixIcon: Icon(
                      Icons.mail_rounded,
                      color: lightYellow,
                    ),
                  ),
                  CustomTextField(
                    height: height,
                    width: width - 60,
                    controller: addressController,
                    hintText: "Address",
                    prefixBoxColor: darkYellow,
                    prefixIcon: Icon(
                      Icons.location_pin,
                      color: lightYellow,
                    ),
                  ),
                  CustomTextField(
                    keyboardType: TextInputType.phone,
                    height: height,
                    width: width - 60,
                    controller: phoneNumberController,
                    hintText: "Phone number",
                    prefixBoxColor: darkYellow,
                    prefixIcon: Icon(
                      Icons.phone_rounded,
                      color: lightYellow,
                    ),
                    phoneNumberPrefix: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        DropdownButton<String>(
                          underline: SizedBox(),
                          value: dropdownValue,
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: textGrey,
                          ),
                          style: AppTheme.dropDownTS,
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: <String>['+94', '+1', '+98', '+913']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        Container(
                          margin:
                              const EdgeInsets.only(top: 13.0, bottom: 13.0),
                          child: VerticalDivider(
                            color: textGrey,
                            width: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomTextField(
                    suffix: IconButton(
                      icon: Icon(
                        Icons.send_outlined,
                        color: lightYellow,
                      ),
                      onPressed: () {
                        setState(() {
                          String type = typeController.text;
                          debugPrint(type);
                          typeController.text = "";
                          !typeList.contains(type) ? typeList.add(type) : null;
                        });
                      },
                    ),
                    controller: typeController,
                    height: height,
                    width: width - 60,
                    prefixBoxColor: darkYellow,
                    prefixIcon: Icon(
                      Icons.add_circle_rounded,
                      color: lightYellow,
                    ),
                    hintText: "Type",
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: Wrap(
                      runSpacing: 10,
                      spacing: 10,
                      children: [
                        for (var item in typeList)
                          TypeContainer(
                            containerColor: darkYellow,
                            item: item,
                            onTap: () {
                              setState(() {
                                typeList.remove(item);
                              });
                            },
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
