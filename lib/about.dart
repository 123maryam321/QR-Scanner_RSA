import 'package:flutter/material.dart';
import 'package:qrcode/scan.dart';
import 'Encryption.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
                " Maryam Azhar \n Cs-172035 \n maryam25azhar@gmail.com \n \n Neha Fatima  \n Cs-172022 \n nehafatima318@gmail.com",
              style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            //  flatButton("Generate QR CODE", GeneratePage()),
          ],
        ),
      ),
    );
  }

  Widget flatButton(String text, Widget widget) {
    return FlatButton(
      padding: EdgeInsets.all(15.0),
      onPressed: () async {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => widget));
      },
      child: Text(
        text,
        style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
      ),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.deepPurple, width: 3.0),
          borderRadius: BorderRadius.circular(20.0)),
    );
  }
}
