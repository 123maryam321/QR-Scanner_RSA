import 'package:flutter/material.dart';
import 'dart:math';
import 'package:starfruit/starfruit.dart';

class EncryptionPage extends StatefulWidget {
  final String qrVal;
  EncryptionPage({Key key, @required this.qrVal}) : super(key: key);
  @override
  State<StatefulWidget> createState() => EncryptionPageState();
}

class EncryptionPageState extends State<EncryptionPage> {
  List puKey = new List(2);
  List prKey = new List(2);
  List alphList = [];


  String cipher;
  String message;
  @override
  void initState() {
    super.initState();
    for (int i = 97; i <= 122; ++i) alphList.add(String.fromCharCode(i));
    rsaCalc();
    cipher = getCipher(message: (widget.qrVal).toLowerCase());
    message = getMessage(cipher: cipher);
  }

  @override
  Widget build(BuildContext context) {
    rsaCalc();

    return Scaffold(
      appBar: AppBar(
        title: Text("Encryption"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                  "Encrypted Text is $cipher",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            Center(
              child: Text(
                  "Decrypted Text is $message",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void rsaCalc() {
    int p = 2, q = 13;
    int n = p * q;
    int phiN = (p - 1) * (q - 1); //12
    int e = relPrime(phiN: phiN);
    int d = e.modInverse(phiN);
    puKey = [e, n];
    prKey = [d, n];

  }

  String getCipher({@required message}) {
    List<String> characters = message.split('');
    List<dynamic> messageNum = [];
    List<dynamic> cipherNum = [];
    String cipher = '';
    for (String char in characters) {
      if (alphList.contains(char))
        messageNum.add(alphList.indexOf(char));
      else
        messageNum.add(char);
    }
    for (var mNum in messageNum) {
      if (mNum is int)
        cipherNum.add(pow(mNum, puKey[0]) % puKey[1]);
      else
        cipherNum.add(mNum);
    }
    for (var cipNum in cipherNum) {
      if (cipNum is int)
        cipher += alphList[cipNum];
      else
        cipher += cipNum;
    }
    return cipher;
  }

  String getMessage({@required cipher}) {
    List<String> cipherList = cipher.split('');
    List<dynamic> cipherNum = [];
    List<dynamic> messageNum = [];
    String message = '';
    for (String char in cipherList) {
      if (alphList.contains(char))
        cipherNum.add(alphList.indexOf(char));
      else
        cipherNum.add(char);
    }
    for (var cNum in cipherNum) {
      if (cNum is int)
        messageNum.add(pow(cNum, prKey[0]) % prKey[1]);
      else
        messageNum.add(cNum);
    }
    for (var mNum in messageNum) {
      if (mNum is int)
        message += alphList[mNum];
      else
        message += mNum;
    }
    debugPrint(message);
    return message;
  }

  int relPrime({@required int phiN}) {
    int i;
    for (i = 2; i < phiN; ++i) {
      int factor = phiN.gcd(i);
      if (factor == 1) return i;
    }
  }
}
