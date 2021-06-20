import 'package:flutter/material.dart';
import 'event_card.dart';

class Instructors extends StatelessWidget {
  const Instructors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF264D59),
      appBar: AppBar(
        backgroundColor: Color(0xFF264D59),
        title: Text(
          'Instructors',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: GridView.count(
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.8,
        crossAxisCount: 2,
        children: [
          InstructorCard(
            name: 'Jonny Sins',
            imagePath: 'assets/images/jonny.jpeg',
          ),
          InstructorCard(
            name: 'Danny Daniels',
            imagePath: 'assets/images/danny.jpeg',
          ),
          InstructorCard(
            name: 'Shasha Grey',
            imagePath: 'assets/images/sasha.jpeg',
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              child: IconButton(
                iconSize: 150,
                color: Colors.white60,
                icon: Icon(Icons.add),
                onPressed: () {},
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InstructorCard extends StatelessWidget {
  String name;
  String imagePath;

  InstructorCard({this.name, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Flexible(
            flex: 6,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(imagePath),
                ),
                color: Colors.white,
              ),
            ),
          ),
          Text(
            name,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white70),
          )
        ],
      ),
    );
  }
}

class Tag extends StatelessWidget {
  String tagName;
  Tag(this.tagName);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Container(
        child: Text(
          tagName,
          style: TextStyle(color: Colors.white70),
        ),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Color(0xFF264D59),
            borderRadius: BorderRadius.all(Radius.circular(40))),
      ),
    );
  }
}
