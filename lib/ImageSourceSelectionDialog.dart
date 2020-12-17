import 'package:flutter/material.dart';

class ImageSourceSelectionDialog extends StatefulWidget {
  Function callback;

  ImageSourceSelectionDialog(callback) {
    this.callback = callback;
  }

  @override
  ImageSourceSelectionDialogState createState() =>
      new ImageSourceSelectionDialogState(this.callback);
}

class ImageSourceSelectionDialogState
    extends State<ImageSourceSelectionDialog> {
  Function callback;

  ImageSourceSelectionDialogState(callback) {
    this.callback = callback;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 300,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          color: Colors.white,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.black),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      callback("camera");
                      Navigator.of(context).pop();
                    },
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.camera_alt, size: 100.0),
                        Container(height: 10),
                        Text("Camera",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w500),
                            textAlign: TextAlign.start)
                      ],
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      callback("gallery");
                      Navigator.of(context).pop();
                    },
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.image, size: 100.0),
                        Container(height: 10),
                        Text("Gallery",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w500),
                            textAlign: TextAlign.start)
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
              Container(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
