import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateScreen extends StatefulWidget {
  @override
  _GenerateState createState() => _GenerateState();
}

class _GenerateState extends State<GenerateScreen> {
  String qrData = "";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            QrImage(data: qrData),
            SizedBox(height: 10.0),
            TextField(
              controller: qrText,
              decoration: InputDecoration(hintText: "Enter the data"),
            ),
            SizedBox(height: 10.0),
            FlatButton(
              padding: EdgeInsets.all(15.0),
              child: Text("Generate"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.blue, width: 2.0),
              ),
              onPressed: () {
                if (qrText.text.isEmpty) {
                  setState(
                    () {
                      qrData = "https://youtube.com";
                    },
                  );
                } else {
                  setState(
                    () {
                      qrData = qrText.text;
                    },
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  final qrText = TextEditingController();
}
