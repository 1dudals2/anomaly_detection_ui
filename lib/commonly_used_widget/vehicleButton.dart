import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VehicleButton extends StatelessWidget {
  const VehicleButton({Key? key}) : super(key: key);

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
          ),
          foregroundColor: MaterialStateProperty.all<Color>(
            Color(0xFF7283FC),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              )
          )
      ),
      onPressed: () =>{

      },
      child: Text(
          "Vehicle"
      ),
    );
  }
}
