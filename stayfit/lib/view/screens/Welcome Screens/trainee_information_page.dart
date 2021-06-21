import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stayfit/utils/themes.dart';
import 'package:stayfit/view/screens/Trainee/trainee_bottom_nav_handler.dart';
import 'package:stayfit/view/screens/Welcome%20Screens/login_page.dart';
import 'package:stayfit/view/widgets/customContainer.dart';
import 'package:stayfit/view/widgets/customTextField.dart';
import 'package:stayfit/view/widgets/mainButton.dart';
import '../../../utils/color.dart';

class TraineeInformationScreen extends StatefulWidget {
  TraineeInformationScreen({Key key}) : super(key: key);

  @override
  _TraineeInformationScreenState createState() =>
      _TraineeInformationScreenState();
}

class _TraineeInformationScreenState extends State<TraineeInformationScreen> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController gmailController = new TextEditingController();
  TextEditingController birthdayController = new TextEditingController();
  String genderDropdownValue = "Male";
  String countryDropdownValue = "Sri Lanka";
  String languageDropdownValue = "Sinhala";
  DateTime birthday = DateTime(2000);

  Future<Null> selectDate(BuildContext context) async {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(1970),
      maxTime: DateTime.now(),
      onChanged: (date) {
        setState(() {
          birthday = date;
          birthdayController.text = date.year.toString() +
              " - " +
              (int.parse(date.month.toString()) < 10
                  ? ("0" + date.month.toString())
                  : date.month.toString()) +
              " - " +
              (int.parse(date.day.toString()) < 10
                  ? ("0" + date.day.toString())
                  : date.day.toString());
        });
      },
      theme: DatePickerTheme(
        cancelStyle: AppTheme.datePickerCancelTS,
        doneStyle: AppTheme.datePickerDoneTS,
      ),
      onConfirm: (date) {
        setState(() {
          birthday = date;
          birthdayController.text = date.year.toString() +
              " - " +
              (int.parse(date.month.toString()) < 10
                  ? ("0" + date.month.toString())
                  : date.month.toString()) +
              " - " +
              (int.parse(date.day.toString()) < 10
                  ? ("0" + date.day.toString())
                  : date.day.toString());
        });
      },
      currentTime: birthday,
      locale: LocaleType.en,
    );
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    birthdayController.text = birthday.year.toString() +
        " - " +
        (int.parse(birthday.month.toString()) < 10
            ? ("0" + birthday.month.toString())
            : birthday.month.toString()) +
        " - " +
        (int.parse(birthday.day.toString()) < 10
            ? ("0" + birthday.day.toString())
            : birthday.day.toString());
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
                builder: (BuildContext context) => TraineeBottomNavHandler(),
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
                    controller: gmailController,
                    hintText: "E-mail",
                    prefixBoxColor: darkYellow,
                    prefixIcon: Icon(
                      Icons.mail_rounded,
                      color: lightYellow,
                    ),
                  ),
                  CustomTextField(
                    onTap: () {
                      selectDate(context);
                    },
                    readOnly: true,
                    height: height,
                    width: width - 60,
                    controller: birthdayController,
                    hintText: "Birthday",
                    prefixBoxColor: darkYellow,
                    prefixIcon: Icon(
                      Icons.date_range,
                      color: lightYellow,
                    ),
                  ),
                  CustomTextField(
                    keyboardType: TextInputType.phone,
                    height: height,
                    width: width - 60,
                    prefixBoxColor: darkYellow,
                    prefixIcon: Icon(
                      Icons.people_alt_sharp,
                      color: lightYellow,
                    ),
                    dropDown: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        DropdownButton<String>(
                          underline: SizedBox(),
                          value: genderDropdownValue,
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: textGrey,
                          ),
                          style: AppTheme.dropDownTS,
                          onChanged: (String newValue) {
                            setState(() {
                              genderDropdownValue = newValue;
                            });
                          },
                          hint: Text(
                            "Gender",
                            style: AppTheme.textFieldTS,
                          ),
                          items: <String>['Male', 'Female']
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
                  CustomTextField(
                    keyboardType: TextInputType.phone,
                    height: height,
                    width: width - 60,
                    prefixBoxColor: darkYellow,
                    prefixIcon: Icon(
                      Icons.language_rounded,
                      color: lightYellow,
                    ),
                    dropDown: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        DropdownButton<String>(
                          underline: SizedBox(),
                          value: languageDropdownValue,
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: textGrey,
                          ),
                          style: AppTheme.dropDownTS,
                          onChanged: (String newValue) {
                            setState(() {
                              languageDropdownValue = newValue;
                            });
                          },
                          hint: Text(
                            "Language",
                            style: AppTheme.textFieldTS,
                          ),
                          items: <String>['Sinhala', 'English']
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
                  CustomTextField(
                    keyboardType: TextInputType.phone,
                    height: height,
                    width: width - 60,
                    prefixBoxColor: darkYellow,
                    prefixIcon: Icon(
                      Icons.location_pin,
                      color: lightYellow,
                    ),
                    dropDown: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        DropdownButton<String>(
                          underline: SizedBox(),
                          value: countryDropdownValue,
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: textGrey,
                          ),
                          style: AppTheme.dropDownTS,
                          onChanged: (String newValue) {
                            setState(() {
                              countryDropdownValue = newValue;
                            });
                          },
                          hint: Text(
                            "Country",
                            style: AppTheme.textFieldTS,
                          ),
                          items: <String>['Sri Lanka', 'India']
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
