import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:stayfit/controller/authController.dart';
import 'package:stayfit/controller/databaseController.dart';
import 'package:stayfit/utils/colors.dart';
import 'package:stayfit/utils/themes.dart';
import 'package:stayfit/view/screens/GYM/GYM_drawer_handler.dart';
import 'package:stayfit/view/widgets/customContainer.dart';
import 'package:stayfit/view/widgets/customTextField.dart';
import 'package:stayfit/view/widgets/mainButton.dart';
import 'package:stayfit/view/widgets/type_container.dart';
import '../../../utils/color.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController adminController = new TextEditingController();
  TextEditingController gmailController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();
  TextEditingController typeController = new TextEditingController();
  String dropdownValue;
  String typeValue;

  bool edit = false;

  var providerDatabase;
  List<String> typeList;

  @override
  void initState() {
    super.initState();
    providerDatabase = Provider.of<Database>(context, listen: false);

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    nameController.text = providerDatabase.gymUser.name;
    adminController.text = providerDatabase.gymUser.admin;
    gmailController.text = providerDatabase.gymUser.gmail;
    addressController.text = providerDatabase.gymUser.address;
    dropdownValue =
        providerDatabase.gymUser.phone_number.toString().substring(0, 3);
    phoneNumberController.text =
        providerDatabase.gymUser.phone_number.toString().substring(3);
    typeController.text = "";
    typeList = List<String>.from(providerDatabase.gymUser.types);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backgroundGrey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: width * 0.4,
                      width: width * 0.4,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                edit = !edit;
                              });
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Container(
                                child: FadeInImage.assetNetwork(
                                  fit: BoxFit.cover,
                                  placeholder:
                                      'assets/images/default-profile.png',
                                  image: providerDatabase.gymUser.image,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: transparentWhite10,
                                ),
                                height: width * 0.4,
                                width: width * 0.4,
                              ),
                            ),
                          ),
                          edit
                              ? Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 9, right: 9),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Container(
                                        child: Icon(
                                          Icons.camera_alt,
                                          color: lightYellow,
                                          size: 19,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: darkYellow,
                                        ),
                                        height: 30,
                                        width: 30,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                  CustomTextField(
                    readOnly: edit ? false : true,
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
                    readOnly: edit ? false : true,
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
                    readOnly: true,
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
                    readOnly: edit ? false : true,
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
                    readOnly: edit ? false : true,
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
                        IgnorePointer(
                          ignoring: edit ? false : true,
                          child: DropdownButton<String>(
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
                    readOnly: edit ? false : true,
                    suffix: IconButton(
                      icon: Icon(
                        edit ? Icons.send_outlined : null,
                        color: lightYellow,
                      ),
                      onPressed: () {
                        if (edit) {
                          setState(() {
                            String type = typeController.text;
                            debugPrint(type);
                            typeController.text = "";
                            !typeList.contains(type)
                                ? typeList.add(type)
                                : null;
                          });
                        }
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
                            close: edit ? true : false,
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
                  edit
                      ? Center(
                          child: Padding(
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
                                  "phone_number": dropdownValue +
                                      phoneNumberController.text,
                                  "sessions": [],
                                  "types": typeList,
                                  "tag_line": "",
                                  "gmail": gmailController.text,
                                  "image":
                                      "https://firebasestorage.googleapis.com/v0/b/stay-fit-d0b34.appspot.com/o/GYM%2Fuser-images%2Fdefault-profile.png?alt=media&token=063e6e8a-4214-42a1-8de8-b4fe683ef63b",
                                };
                                // await providerDatabase.createGYM(
                                //     providerAuth.firebaseUser.uid, _gymData);

                                // if (providerDatabase.gymCreateStatus) {
                                //   print("Successfully recorded");
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (BuildContext context) =>
                                //             GYMDrawerHandler()),
                                //   );
                                // } else {
                                //   showSimpleNotification(
                                //       Text("Error! Please try again"),
                                //       background: Colors.red);
                                // }
                              },
                              text: "Save changes",
                              suffixIcon:
                                  SvgPicture.asset("assets/images/next.svg"),
                              boxColor: mainGreen,
                              shadowColor: mainGreen,
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
