import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker_form_field/image_picker_form_field.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Form(
                key: key,
                child: ImagePickerFormField(
                  child: Container(
                    height: 40,
                    child: Center(child: Text("Select Photo")),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(
                            color: Theme.of(context).disabledColor, width: 1)),
                  ),
                  previewEnabled: true,
                  autovalidate: true,
                  context: context,
                  onSaved: (File value) {
                    print("on saved called");
                  },
                  validator: (File value) {
                    if (value == null)
                      return "Please select a photo!";
                    else
                      return null;
                  },
                  initialValue: null, //File("some source")
                ),
              ),
            ),
            RaisedButton(
              child: Text("Validate"),
              onPressed: () {
                if (key.currentState.validate()) key.currentState.save();
              },
            )
          ],
        ),
      ),
    );
  }
}
