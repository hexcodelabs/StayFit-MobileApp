import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stayfit/utils/themes.dart';
import 'package:stayfit/view/screens/Welcome%20Screens/login_page.dart';
import 'package:stayfit/view/widgets/customContainer.dart';
import 'package:stayfit/view/widgets/customTextField.dart';
import 'package:stayfit/view/widgets/mainButton.dart';
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
  String dropdownValue = "+94";
  String typeValue = "Yoga";

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => LoginScreen(),
              ),
            );
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
                    keyboardType: TextInputType.phone,
                    height: height,
                    width: width - 60,
                    prefixBoxColor: darkYellow,
                    prefixIcon: Icon(
                      Icons.add_circle_rounded,
                      color: lightYellow,
                    ),
                    dropDown: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        DropdownButton<String>(
                          underline: SizedBox(),
                          value: typeValue,
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: textGrey,
                          ),
                          style: AppTheme.dropDownTS,
                          onChanged: (String newValue) {
                            setState(() {
                              typeValue = newValue;
                            });
                          },
                          hint: Text(
                            "Type",
                            style: AppTheme.textFieldTS,
                          ),
                          items: <String>['Yoga', 'Exercises f fd gdf g dfg']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
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
