import 'package:flutter/material.dart';

class UploadImage extends StatefulWidget {
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
//  File _image;
//  Future _getImageFromSource() async {
//    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
//    _image = image as File;
//    setState(() {});
//  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Container(
                  color: Colors.blueAccent,
                  width: 250,
                  height: 150,
                  child: Center(
                    child: Text(
                      "Upload Image",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )),
            onTap: () {
              print("Pressed");
            },
          )
        ],
      ),
    );
  }
}
