import 'package:flutter/material.dart';
import 'package:trufi/blocs/theme/default_theme.dart';

class FromMarker extends StatelessWidget {
  final double height;
  const FromMarker({
    Key? key,
    this.height = 15,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: height,
      child: FittedBox(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 5.2,
              height: 5.2,
              decoration: BoxDecoration(
                color: Color(0xffF65D53),
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 3,
              height: 3,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
