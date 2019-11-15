import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Caroul',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int photoIndex = 0;

  List<String> photos = [
    'assets/images/burger1.jpg',
    'assets/images/burger2.jpg',
    'assets/images/burger3.jpg',
  ];

  void _previousPhoto() {
    setState(() {
      photoIndex = photoIndex > 0 ? photoIndex - 1 : 0;
    });
  }

  void _nextPhoto() {
    setState(() {
      photoIndex = photoIndex < photos.length - 1 ? photoIndex + 1 : photoIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(photoIndex);
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Stack(
              children: <Widget>[
                Container(
                  height: 500,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                        image: AssetImage(
                          photos[photoIndex],
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                iconSize: 30,
                color: Colors.blueAccent,
                onPressed: _previousPhoto,
              ),
              IconButton(
                onPressed: _nextPhoto,
                icon: Icon(Icons.arrow_forward_ios),
                iconSize: 30,
                color: Colors.blueAccent,
              )
            ],
          )
        ],
      ),
    );
  }
}
