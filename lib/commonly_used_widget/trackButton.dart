import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrackButton extends StatelessWidget {
  const TrackButton({Key? key, required this.changeModeFunction, required this.currentMode}) : super(key: key);
  final ValueSetter<int> changeModeFunction;
  final int currentMode;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0),
        fixedSize: MaterialStateProperty.all<Size>(
          Size(
            100,50
          )
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
            Colors.white
        ) ,
        foregroundColor: currentMode == 0 ? MaterialStateProperty.all<Color>(
          Color(0xFF7283FC),
        ) : MaterialStateProperty.all<Color>(
          Colors.grey,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
            )
        )
      ),
      onPressed: () =>{
        changeModeFunction(0)
      },
      child: Text(
        "Track"
      ),
    );
  }
}
