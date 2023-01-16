import 'package:flutter/material.dart';

import 'package:storello/generate_song_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'STORELLO',
      theme: ThemeData(
        fontFamily: 'Space',
        primarySwatch: Colors.orange,
      ),
      home: SongGenerator(),
    );
  }
}

class SongGenerator extends StatefulWidget {
  SongGenerator({Key? key}) : super(key: key);

  @override
  State<SongGenerator> createState() => _SongGeneratorState();
}

class _SongGeneratorState extends State<SongGenerator> {
  TextEditingController _Apicontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome To STORELLO',
                        style: TextStyle(
                            letterSpacing: 2.5,
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    children: [
                      Text(
                        'Unleash your imagination and bring your wildest stories to life with our revolutionary app, utilizing the power of cutting-edge chatGPT technology to craft unique and captivating narratives that will transport you to new worlds and leave you on the edge of your seat, every time you use it',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'You Ready? 🤗',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Great Let\'s Get Started',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Image(
                      image: AssetImage('images/start.png'),
                    ),
                    height: 300,
                    width: double.infinity,
                  ),
                  // Padding(
                  //   padding:
                  //       const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //         color: Colors.grey[100],
                  //         shape: BoxShape.rectangle,
                  //         borderRadius: BorderRadius.all(Radius.circular(15))),
                  //     margin:
                  //         EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  //     width: double.infinity,
                  //     child: Form(
                  //       child: TextFormField(
                  //         decoration: InputDecoration(
                  //             hintText: 'Paste Your Api Key From OpenAi'),
                  //         controller: _Apicontroller,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(300, 60)),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Generate_Songs();
                      }));
                    },
                    child: Text(
                      'Let\'s Get Started',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600),
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
