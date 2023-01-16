import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clipboard/clipboard.dart';

class Generate_Songs extends StatefulWidget {
  Generate_Songs({Key? key}) : super(key: key);

  @override
  State<Generate_Songs> createState() => _Generate_SongsState();
}

final _controller = TextEditingController();
String _generatedSong = '';
final apiKey = "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";

class _Generate_SongsState extends State<Generate_Songs> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Generate Your Short story Here',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Image.asset(
                  'images/story.png',
                  height: 200,
                ),
              ),
              Text(
                'What\'s The Setting Of Your Story',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black.withOpacity(0.8),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  width: double.infinity,
                  child: Form(
                    child: TextFormField(
                      decoration: InputDecoration(),
                      controller: _controller,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(300, 60)),
                onPressed: () async {
                  _generatedSong = await generateSong(_controller.text);

                  await showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: SingleChildScrollView(
                          child: Text(_generatedSong),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("Copy"),
                            onPressed: () async {
                              await Clipboard.setData(
                                  ClipboardData(text: _generatedSong));
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  width: double.infinity,
                                  content: Text("Copied"),
                                  duration: Duration(seconds: 2)));
                            },
                          ),
                          FlatButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  'Create',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    color: Colors.grey[100],
                    width: double.infinity,
                    height: 820,
                    child: Text(_generatedSong),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<String> generateSong(String keyword) async {
    final response = await http.post(
      Uri.parse(
        "https://api.openai.com/v1/engines/text-davinci-003/completions",
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $apiKey"
      },
      body: jsonEncode({
        "prompt":
            "Generate an interesting and inspiring short story of 1000 words, based on " +
                keyword,
        "max_tokens": 1000,
        "format": "text"
      }),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      String generatedText = jsonDecode(response.body)['choices'][0]['text'];
      final song = jsonData["choices"][0]["text"];
      return song;
    } else {
      return 'Oga I No Fit Do That One OOO (Error)';
    }
  }
}