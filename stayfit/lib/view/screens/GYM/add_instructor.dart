import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:stayfit/controller/databaseController.dart';
import 'package:stayfit/utils/color.dart';
import 'package:stayfit/utils/themes.dart';
import 'package:stayfit/view/screens/GYM/GYM_bottom_nav_handler.dart';
import 'package:stayfit/view/screens/GYM/GYM_drawer_handler.dart';
import 'package:stayfit/view/widgets/customTextField.dart';
import 'package:stayfit/view/widgets/mainButton.dart';

class AddInstructor extends StatefulWidget {
  @override
  _AddInstructorState createState() => _AddInstructorState();
}

class _AddInstructorState extends State<AddInstructor> {
  var providerDatabase;

  String gym;

  final TextEditingController instructorNameController =
      TextEditingController();
  String imageUrl = '';

  File _image;
  final picker = ImagePicker();

  bool loading = false;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Widget showImage(BuildContext context) {
    if (_image == null) {
      return Center(
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

  Future addInstructor(BuildContext context) async {
    providerDatabase = await Provider.of<Database>(context, listen: false);
    debugPrint("add Instructor");
    if (instructorNameController.text.isEmpty) {
      return errorMessage("Error! Please add a Instructor name!!");
    } else if (_image == null) {
      return errorMessage("Error! Please add an Image!!");
    } else {
      try {
        String fileName = basename(_image.path); // should create best id
        Reference firebaseStorageRef = FirebaseStorage.instance
            .ref('/GYM/instructor-images')
            .child(fileName);
        UploadTask uploadTask = firebaseStorageRef.putFile(_image);
        TaskSnapshot taskSnapshot = await uploadTask.whenComplete(
          () {
            print("uploaded");
          },
        );

        bool save = await taskSnapshot.ref.getDownloadURL().then(
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
        if (save) {
          var _instructoData = {
            "name": instructorNameController.text,
            "image": imageUrl,
            "gym": gym,
          };
          await saveInFirestore(context, _instructoData);
        }
      } catch (e) {
        setState(() {
          loading = false;
        });
        print(e);
      }
    }
  }

  void saveInFirestore(BuildContext context, var _instructoData) async {
    await providerDatabase.createInstructor(
      _instructoData,
    );

    if (providerDatabase.sessionCreateStatus) {
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
    super.initState();
    setState(() {
      gym = "gym_users/gym_test_user";
    });
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
        elevation: 0,
        title: Text(
          "Add Instructor",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        toolbarHeight: 60,
      ),
      floatingActionButton: Padding(
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
              await addInstructor(context);
              setState(() {
                loading = false;
              });
            }
          },
          text: "Add Instructor",
          boxColor: mainGreen,
          shadowColor: mainGreen,
        ),
      ),
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
                height: height,
                width: width - 60,
                controller: instructorNameController,
                hintText: "Instructor name",
                prefixBoxColor: darkYellow,
                prefixIcon: Icon(
                  Icons.ondemand_video_rounded,
                  color: lightYellow,
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
