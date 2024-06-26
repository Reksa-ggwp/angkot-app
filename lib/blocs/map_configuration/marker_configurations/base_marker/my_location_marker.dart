import 'package:flutter/material.dart';

class MyLocationMarker extends StatelessWidget {
  const MyLocationMarker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.all(10),
      child: Transform.scale(
        scale: 0.5,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff212544),
            border: Border.all(color: Colors.white, width: 3.5),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0xff212544),
                spreadRadius: 8.0,
                blurRadius: 30.0,
              ),
            ],
          ),
          child: const Icon(
            Icons.circle_outlined,
            color: Color(0xff212544),
          ),
        ),
      ),
    );
  }
}
