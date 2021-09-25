import 'package:flutter/material.dart';
import 'package:http_test/post_model_result.dart';
import 'package:http_test/user_detail_model.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  PostResult? postResult = null;
  User? user = null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Api Demo")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text((postResult != null
                  ? postResult!.id +
                      " | " +
                      postResult!.name +
                      " | " +
                      postResult!.job +
                      " | " +
                      postResult!.crated
                  : "Tidak ada Data")),
              ElevatedButton(
                  onPressed: () {
                    PostResult.connectToApi("Dodo Widodo", "admin")
                        .then((value) {
                      postResult = value;
                      setState(() {});
                    });
                  },
                  child: Text("post"))
            ],
          ),
        ),
      ),
    );
  }
}
