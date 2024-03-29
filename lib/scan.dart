import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:qrcode/Encryption.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String qrCodeResult = "Not Yet Scanned";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scanner"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Result",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              qrCodeResult,
              style: TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            FlatButton(
              padding: EdgeInsets.all(15.0),
              onPressed: () async {
                String codeSanner =
                    await BarcodeScanner.scan(); //barcode scnner
                setState(
                  () {
                    qrCodeResult = codeSanner;
                  },
                );
              },
              child: Column(
                children: <Widget>[
                  Icon(Icons.qr_code_scanner),
                  Text(
                    "Open Scanner",
                    style: TextStyle(color: Colors.deepPurple, fontSize: 15, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.deepPurple, width: 3.0),
                  borderRadius: BorderRadius.circular(20.0)),
            ),
            FlatButton(
              padding: EdgeInsets.all(15.0),
              onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EncryptionPage(qrVal: qrCodeResult),
                      ),
                    );
              },

              child: Column(
                children: <Widget>[
                  Icon(Icons.enhanced_encryption),
                  Text(
                    "Encrypt Text",
                    style: TextStyle(color: Colors.deepPurple, fontSize: 15, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.deepPurple, width: 3.0),
                  borderRadius: BorderRadius.circular(20.0)),
            )
          ],
        ),
      ),
    );
  }
}
