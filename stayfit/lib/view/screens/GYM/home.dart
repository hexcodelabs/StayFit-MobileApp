import 'package:flutter/material.dart';
import 'event_card.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF264D59),
      appBar: AppBar(
        backgroundColor: Color(0xFF264D59),
        centerTitle: true,
        title: Text(
          'StayFit',
          style: TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
        ),
      ),
      body: GridView.count(
        childAspectRatio: 1.25,
        crossAxisCount: 1,
        children: [
          EventCard(
            eventName: 'Yoga',
            date: 'May 21st',
            likes: 2500,
            imagePath: 'assets/images/yoga.jpeg',
            time: '1.00pm - 2.00pm ',
          ),
          EventCard(
            eventName: 'Body \nBuilding',
            date: 'May 22st',
            likes: 2200,
            imagePath: 'assets/images/gym.jpeg',
            time: '1.00pm - 2.00pm ',
          ),
        ],
      ),
    );
  }
}
