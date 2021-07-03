import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:stayfit/controller/authController.dart';
import 'package:stayfit/controller/databaseController.dart';
import 'package:stayfit/model/GYM/instructor.dart';
import 'package:stayfit/model/GYM/session.dart';
import 'package:stayfit/utils/color.dart';
import 'package:stayfit/utils/themes.dart';
import 'package:stayfit/view/screens/GYM/GYM_bottom_nav_handler.dart';
import 'package:stayfit/view/screens/GYM/GYM_drawer_handler.dart';
import 'package:stayfit/view/widgets/customTextField.dart';
import 'package:stayfit/view/widgets/mainButton.dart';

class ViewSession extends StatefulWidget {
  ViewSession({this.session});
  final Session session;
  @override
  _ViewSessionState createState() => _ViewSessionState();
}

class _ViewSessionState extends State<ViewSession> {
  var providerDatabase;
  var providerAuth;

  bool edited = false;
  bool edit = false;
  String preName = "";
  DateTime preStartTime = DateTime.now();
  DateTime preEndTime = DateTime.now();
  String prePrice = "";
  String preLanguage = "";
  String preType = "";
  String preInstructor = "";
  String preImage = "";
  bool imageChanged = false;

  String gym;

  final TextEditingController sessionNameController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  DateTime start = DateTime.now();
  final TextEditingController endTimeController = TextEditingController();
  DateTime end = DateTime.now();
  String languageDropdownValue;
  final TextEditingController priceController = TextEditingController();
  String currencyDropdownValue = "lkr";
  String typeDropdownValue;
  String imageUrl = '';
  Instructor selectedInstructor;
  int selectedInstructorIndex;
  int preInstructorIndex;

  List<String> typesList;

  File _image;
  final picker = ImagePicker();

  bool loading = false;

  setData() {
    setState(() {
      sessionNameController.text = preName;
      startTimeController.text = preStartTime.toString();
      start = preStartTime;
      endTimeController.text = preEndTime.toString();
      end = preEndTime;
      languageDropdownValue = preLanguage;

      currencyDropdownValue = prePrice.split(" ")[0];
      priceController.text = prePrice.split(" ")[1];
      typeDropdownValue = preType;
      imageUrl = preImage;
      _image = null;
      int i = 0;
      for (var inst in providerDatabase.gymUser.instructors) {
        if (inst.toString() == preInstructor) {
          selectedInstructor = providerDatabase.gymUser.instructorDocs[i];
          selectedInstructorIndex = i;
          preInstructorIndex = i;
        }
        i = i + 1;
      }
    });
  }

  checkData() {
    if (preName == sessionNameController.text &&
        preStartTime == start &&
        preEndTime == end &&
        currencyDropdownValue == prePrice.split(" ")[0] &&
        prePrice.split(" ")[1] == priceController.text &&
        preLanguage == languageDropdownValue &&
        preType == typeDropdownValue &&
        preInstructor.split("/")[1] == selectedInstructor.id &&
        !imageChanged) {
      setState(() {
        edited = false;
      });
    } else {
      setState(() {
        edited = true;
      });
    }
  }

  resetData() {
    setData();
  }

  Future<Null> selectStart(BuildContext context) async {
    DatePicker.showDateTimePicker(
      context,
      showTitleActions: true,
      currentTime: start,
      minTime: DateTime.now(),
      onChanged: (date) {
        setState(() {
          start = date;
          startTimeController.text = start.toString();
        });
        checkData();
      },
      theme: DatePickerTheme(
        cancelStyle: AppTheme.datePickerCancelTS,
        doneStyle: AppTheme.datePickerDoneTS,
      ),
      onConfirm: (date) {
        setState(
          () {
            setState(() {
              start = date;
              startTimeController.text = start.toString();
            });
            checkData();
          },
        );
      },
    );
  }

  Future<Null> selectEnd(BuildContext context) async {
    DatePicker.showDateTimePicker(
      context,
      showTitleActions: true,
      minTime: start,
      currentTime: end,
      onChanged: (date) {
        setState(() {
          end = date;
          endTimeController.text = end.toString();
        });
      },
      theme: DatePickerTheme(
        cancelStyle: AppTheme.datePickerCancelTS,
        doneStyle: AppTheme.datePickerDoneTS,
      ),
      onConfirm: (date) {
        setState(
          () {
            setState(() {
              end = date;
              endTimeController.text = end.toString();
            });
          },
        );
      },
    );
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        if (_image != File(pickedFile.path)) {
          _image = File(pickedFile.path);
          imageChanged = true;
        }
      } else {
        print('No image selected.');
      }
    });
    checkData();
  }

  Widget showImage(BuildContext context) {
    if (_image == null) {
      if (imageUrl == '') {
        return Center(
          child: IconButton(
            icon: Icon(
              Icons.add,
              color: mainGreen,
              size: 20,
            ),
            onPressed: () {
              if (edit) {
                print("click");
                getImage();
              }
            },
          ),
        );
      } else {
        return Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                  color: Color(0xffECF0F6).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: IconButton(
                icon: Icon(
                  Icons.add,
                  color: mainGreen,
                  size: 20,
                ),
                onPressed: () {
                  if (edit) {
                    print("click");
                    getImage();
                  }
                },
              ),
            ),
          ],
        );
      }
    } else {
      return Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                color: Color(0xffECF0F6).withOpacity(0.8),
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: Image.file(_image).image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: mainGreen,
                size: 20,
              ),
              onPressed: () {
                print("click");
                getImage();
              },
            ),
          ),
        ],
      );
    }
  }

  OverlaySupportEntry errorMessage(String error) {
    return showSimpleNotification(
      Text(error),
      background: mainRed,
    );
  }

  Future editSession() async {
    debugPrint("add Session");
    if (sessionNameController.text.isEmpty) {
      return errorMessage("Error! Please add a Session name!!");
    } else if (startTimeController.text.isEmpty) {
      return errorMessage("Error! Please add a Session start time!!");
    } else if (endTimeController.text.isEmpty) {
      return errorMessage("Error! Please add a Session end time!!");
    } else if (priceController.text.isEmpty) {
      return errorMessage("Error! Please add a Price!!");
    } else if (languageDropdownValue == null) {
      return errorMessage("Error! Please select a language!!");
    } else if (typeDropdownValue == null) {
      return errorMessage("Error! Please select a type!!");
    } else if (selectedInstructor == null) {
      return errorMessage("Error! Please select an instructor!!");
    } else if (imageUrl == '') {
      return errorMessage("Error! Please add an Image!!");
    } else {
      try {
        bool save = true;
        if (_image != null && imageChanged) {
          String fileName = path.basename(_image.path); // should create best id
          Reference firebaseStorageRef = FirebaseStorage.instance
              .ref('/GYM/session-images')
              .child(fileName);
          UploadTask uploadTask = firebaseStorageRef.putFile(_image);
          TaskSnapshot taskSnapshot = await uploadTask.whenComplete(
            () {
              print("uploaded");
            },
          );
          save = await taskSnapshot.ref.getDownloadURL().then(
            (value) {
              setState(() {
                imageUrl = value;
              });
              if (imageUrl != '') {
                return true;
              } else {
                return false;
              }
            },
          );
          print(imageUrl);
        }
        debugPrint("add Session");
        if (save) {
          var _sessionData = {
            "end_timestamp": end,
            "langusge": languageDropdownValue,
            "name": sessionNameController.text,
            "price": currencyDropdownValue + " " + priceController.text,
            "start_timestamp": start,
            "type": typeDropdownValue,
            "image": imageUrl,
            "instructor": "gym_instructors/" + selectedInstructor.id,
          };
          await updateInFirestore(context, _sessionData);
        }
      } catch (e) {
        setState(() {
          loading = false;
        });
      }
    }
  }

  void updateInFirestore(BuildContext context, var _sessionData) async {
    await providerDatabase.updateSession(_sessionData, selectedInstructorIndex,
        widget.session.id, preInstructor);

    if (providerDatabase.sessionUpdateStatus) {
      print("Successfully recorded");
      setState(() {
        loading = false;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => GYMDrawerHandler(),
        ),
      );
    } else {
      errorMessage("Error! Please try again");
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    providerAuth = Provider.of<AuthFunctions>(context, listen: false);
    providerDatabase = Provider.of<Database>(context, listen: false);
    super.initState();
    setState(() {
      typesList = List<String>.from(providerDatabase.gymUser.types);
      gym = "gym_users/" + providerAuth.firebaseUser.uid;
    });

    debugPrint(widget.session.id);
    preName = widget.session.name;
    preStartTime = widget.session.start_timestamp;
    preEndTime = widget.session.end_timestamp;
    prePrice = widget.session.price;
    preLanguage = widget.session.langusge;
    preType = widget.session.type;
    preInstructor = widget.session.instructor;
    preImage = widget.session.image;
    setData();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundGrey,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
            size: 35,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: ElevatedButton(
                onPressed: () {
                  if (!loading) {
                    setState(() {
                      edit = !edit;
                    });
                    if (!edit) {
                      resetData();
                      edited = false;
                    }
                  }
                },
                child: loading
                    ? CircularProgressIndicator()
                    : Text(!edit ? 'edit' : 'cancel'),
                style: ElevatedButton.styleFrom(
                  primary: !edit ? mainGreen : mainRed,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
              ),
            ),
          ),
        ],
        elevation: 0,
        title: Text(
          "View Session",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        toolbarHeight: 60,
      ),
      floatingActionButton: edit
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: MainButton(
                loading: loading,
                width: width * 0.7,
                height: height,
                onPressed: () async {
                  if (!loading) {
                    setState(() {
                      loading = true;
                    });
                    await editSession();
                    setState(() {
                      loading = false;
                    });
                  }
                },
                text: "Save changes",
                boxColor: !edited ? Colors.grey : mainGreen,
                shadowColor: !edited ? Colors.grey : mainGreen,
              ),
            )
          : Container(),
      backgroundColor: backgroundGrey,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 16.0, bottom: 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                readOnly: !edit ? true : false,
                onChanged: (String value) {
                  checkData();
                },
                height: height,
                width: width - 60,
                controller: sessionNameController,
                hintText: "Session name",
                prefixBoxColor: darkYellow,
                prefixIcon: Icon(
                  Icons.ondemand_video_rounded,
                  color: lightYellow,
                ),
              ),
              CustomTextField(
                onTap: () {
                  if (edit) {
                    selectStart(context);
                  }
                },
                height: height,
                width: width - 60,
                readOnly: true,
                controller: startTimeController,
                hintText: "Session Start Time",
                prefixBoxColor: darkYellow,
                prefixIcon: Icon(
                  Icons.access_time_outlined,
                  color: lightYellow,
                ),
              ),
              CustomTextField(
                onTap: () {
                  if (edit) {
                    selectEnd(context);
                  }
                },
                height: height,
                width: width - 60,
                readOnly: true,
                controller: endTimeController,
                hintText: "Session End Time",
                prefixBoxColor: darkYellow,
                prefixIcon: Icon(
                  Icons.access_time_filled_outlined,
                  color: lightYellow,
                ),
              ),
              CustomTextField(
                readOnly: !edit ? true : false,
                phoneNumberPrefixWidth: 90,
                keyboardType: TextInputType.number,
                height: height,
                width: width - 60,
                controller: priceController,
                hintText: "Price",
                prefixBoxColor: darkYellow,
                prefixIcon: Icon(
                  Icons.attach_money,
                  color: lightYellow,
                ),
                onChanged: (String value) {
                  checkData();
                },
                phoneNumberPrefix: Row(
                  children: [
                    SizedBox(
                      width: 9,
                    ),
                    IgnorePointer(
                      ignoring: !edit ? true : false,
                      child: DropdownButton<String>(
                        underline: SizedBox(),
                        value: currencyDropdownValue,
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: textGrey,
                        ),
                        style: AppTheme.dropDownTS,
                        onChanged: (String newValue) {
                          setState(() {
                            currencyDropdownValue = newValue;
                          });

                          checkData();
                        },
                        items: <String>['lkr']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 13.0, bottom: 13.0),
                      child: VerticalDivider(
                        color: textGrey,
                        width: 1,
                      ),
                    ),
                  ],
                ),
              ),
              CustomTextField(
                readOnly: true,
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
                    IgnorePointer(
                      ignoring: !edit ? true : false,
                      child: DropdownButton<String>(
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

                          checkData();
                        },
                        hint: Text(
                          'Language',
                          style: AppTheme.textFieldTS,
                        ),
                        items: <String>[
                          'Sinhala',
                          'English',
                          "Tamil",
                          "French",
                          "German",
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              CustomTextField(
                readOnly: true,
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
                    IgnorePointer(
                      ignoring: !edit ? true : false,
                      child: DropdownButton<String>(
                        underline: SizedBox(),
                        value: typeDropdownValue,
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: textGrey,
                        ),
                        style: AppTheme.dropDownTS,
                        onChanged: (String newValue) {
                          setState(() {
                            typeDropdownValue = newValue;
                          });

                          checkData();
                        },
                        hint: Text(
                          "Type",
                          style: AppTheme.textFieldTS,
                        ),
                        items: typesList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          width: 38,
                          height: 54,
                          child: Row(
                            children: [
                              Container(
                                width: 38,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: darkYellow,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.image,
                                  color: lightYellow,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        'Add Instructor',
                        style: TextStyle(
                          color: textGrey,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 12,
                    ),
                    child: Container(
                      constraints:
                          BoxConstraints(minHeight: 130, maxHeight: 150),
                      child: ListView.builder(
                        itemCount:
                            providerDatabase.gymUser.instructorDocs.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) =>
                            GestureDetector(
                          onTap: () {
                            if (edit) {
                              setState(() {
                                selectedInstructor = providerDatabase
                                    .gymUser.instructorDocs[index];
                                selectedInstructorIndex = index;
                              });

                              checkData();
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.only(right: 10),
                            child: Column(
                              children: [
                                Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: selectedInstructor ==
                                                    providerDatabase.gymUser
                                                        .instructorDocs[index]
                                                ? mainGreen
                                                : textGrey,
                                            width: 3.0),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(providerDatabase
                                                .gymUser
                                                .instructorDocs[index]
                                                .image)))),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  providerDatabase
                                      .gymUser.instructorDocs[index].name,
                                  overflow: TextOverflow.fade,
                                  style: selectedInstructor !=
                                          providerDatabase
                                              .gymUser.instructorDocs[index]
                                      ? TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: textGrey,
                                          fontSize: 22,
                                        )
                                      : TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: mainGreen,
                                          fontSize: 22,
                                        ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          width: 38,
                          height: 54,
                          child: Row(
                            children: [
                              Container(
                                width: 38,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: darkYellow,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.image,
                                  color: lightYellow,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        'Add Image',
                        style: TextStyle(
                          color: textGrey,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                            color: Color(0xffECF0F6).withOpacity(0.8),
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: showImage(context),
                        ),
                      ),
                      SizedBox(width: 8),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'One high resolution image',
                            style: TextStyle(
                              color: Color(0xff878787),
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'PNG, JPG + 500x500 or 1600 x 1600',
                            style: TextStyle(
                              color: Color(0xffC3CAD4),
                              fontSize: 12,
                            ),
                            softWrap: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
