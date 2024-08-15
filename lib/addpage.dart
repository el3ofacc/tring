import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tring/main.dart';

class Addpage extends StatefulWidget {
  const Addpage({super.key});

  @override
  State<Addpage> createState() => _AddpageState();
}

class _AddpageState extends State<Addpage> {
  TextEditingController firstname = TextEditingController();
  TextEditingController secondname = TextEditingController();
  TextEditingController fullname = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: firstname,
              decoration: InputDecoration(
                  hintText: "first name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: secondname,
              decoration: InputDecoration(
                  hintText: "second name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: fullname,
              decoration: InputDecoration(
                  hintText: "full name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: () async {
              var response = await http
                  .post(Uri.parse("http://10.0.2.2/trying/adddata.php"), body: {
                "firstname": firstname.text,
                "secondname": secondname.text,
                "fullname": fullname.text
              });
              firstname.clear();
              secondname.clear();
              fullname.clear();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => homepage()));
            },
            child: Text("add"),
          )
        ],
      ),
    );
  }
}
