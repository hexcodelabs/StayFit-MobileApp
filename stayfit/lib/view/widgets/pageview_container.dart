import 'package:flutter/cupertino.dart';

class PageViewContainer extends StatelessWidget {
  const PageViewContainer({
    Key key,
    @required this.height,
    @required this.width,
    this.image,
    this.imageBoxColor,
    this.topic,
    this.topicTS,
    this.description,
    this.descriptionTS,
  }) : super(key: key);

  final double height;
  final double width;
  final String image;
  final Color imageBoxColor;
  final String topic;
  final TextStyle topicTS;
  final String description;
  final TextStyle descriptionTS;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 40.0, left: 17.0, bottom: 15, right: 17.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: imageBoxColor,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(image),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              topic,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: topicTS,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              description,
              textAlign: TextAlign.center,
              style: descriptionTS,
            ),
          ],
        ),
      ),
    );
  }
}
