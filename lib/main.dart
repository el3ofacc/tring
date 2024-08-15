import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tring/addpage.dart';

List mydata = [];
void main() async {
  var response = await http.get(Uri.parse("http://10.0.2.2/trying/view.php"));
  if (response.statusCode == 200) {
    var jsondecode = jsonDecode(response.body)['data'] as List;
    mydata = jsondecode;
    print(jsondecode);
  } else {
    print("an error happnd");
  }
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homepage(),
    );
  }
}

class homepage extends StatelessWidget {
  homepage({super.key});
  TextEditingController firstname = TextEditingController();
  TextEditingController secondname = TextEditingController();
  TextEditingController fullname = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Addpage()));
        },
        child: Icon(
          Icons.add,
          color: Colors.red,
          size: 40,
        ),
      ),
      body: ListView.builder(
          itemCount: mydata.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text(mydata[index]['nameid']),
              title: Text(mydata[index]['firstname']),
              subtitle: Text(mydata[index]['fullname']),
            );
          }),
    );
  }
}
