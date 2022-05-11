import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.onPressed});
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.green,
      splashColor: Colors.greenAccent,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Icon(
              Icons.face,
              color: Colors.amber,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              "Tap Me",
              maxLines: 1,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}

 //     : super(onPressed: onPressed, child: child);
  // final GestureTapCallback onPressed;

  // @override
  // Widget build(BuildContext context) {
  //   return Theme(
  //     data: Theme.of(context).copyWith(
  //         buttonTheme: Theme.of(context).buttonTheme.copyWith(
  //               shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(30.0)),
  //             )),
  //     child: Builder(builder: super.build),
  //   );