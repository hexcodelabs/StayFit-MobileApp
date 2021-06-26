import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:stayfit/controller/databaseController.dart';
import 'package:stayfit/utils/themes.dart';
import 'package:stayfit/view/screens/Trainee/trainee_checkout.dart';
import 'package:stayfit/view/widgets/customContainer.dart';
import 'package:stayfit/view/widgets/gymview_container.dart';
import 'package:stayfit/view/widgets/shared_widgets.dart';
import '../../../utils/color.dart';
import '../../widgets/pageview_container.dart';
import 'package:intl/intl.dart';

class GymSelectPage extends StatefulWidget {
  final int index;
  GymSelectPage({Key key, this.index}) : super(key: key);

  @override
  _GymSelectPageState createState() => _GymSelectPageState();
}

class _GymSelectPageState extends State<GymSelectPage> {
  int check = 0;
  String gymName = "Colombo Gym";

  PageController pageController =
      PageController(initialPage: 1, viewportFraction: 0.8, keepPage: true);

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    var providerDatabase = Provider.of<Database>(context, listen: false);
    providerDatabase.getSessionForGym(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    var providerDatabase = Provider.of<Database>(context);

    return !providerDatabase.getGymSessionFetchStatus
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
            backgroundColor: backgroundGrey,
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 40, 32, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          gymName,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: CustomContainer(
                            width: 50,
                            height: 50,
                            boxColor: mainGreen,
                            radius: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height * 0.8,
                    child: PageView(
                      controller: pageController,
                      reverse: false,
                      physics: BouncingScrollPhysics(),
                      onPageChanged: (int index) {
                        setState(() {
                          check = index;
                        });
                      },
                      children: providerDatabase.getGymSessions
                          .map<Widget>(
                            (event) => GymViewContainer(
                              onTap: () {
                                Navigator.of(context)
                                    .push(pageRoute(TraineeCheckout(data: (Map<String, dynamic>.from(event)))));
                              },
                              sessionId:event["id"],
                              height: height * 0.76,
                              width: width * 0.75,
                              imageBoxColor: mainGreen,
                              topic: event["type"],
                              image: "assets/images/p5.png",
                              day: DateFormat.yMMMd().format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                      event["start_timestamp"].seconds * 1000)),
                              time: DateFormat.jm().format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          event["start_timestamp"].seconds *
                                              1000)) +
                                  " - " +
                                  DateFormat.jm().format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          event["end_timestamp"].seconds *
                                              1000)),
                              topicTS: AppTheme.onBoardPageTopicTS,
                              descriptionTS: AppTheme.onBoardPageDescriptionTS,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
