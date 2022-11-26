import 'package:flutter/material.dart';

// ignore: camel_case_types
class CategoryItemChip extends StatelessWidget {
  const CategoryItemChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              height: 56,
              width: 56,
              decoration: ShapeDecoration(
                  color: Colors.red,
                  shadows: const [
                    BoxShadow(
                      color: Colors.red,
                      blurRadius: 25,
                      spreadRadius: -14,
                      offset: Offset(0.0, 15),
                    ),
                  ],
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(40))),
            ),
            const Icon(
              Icons.mouse,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "hello",
          style: TextStyle(fontFamily: 'SB', fontSize: 12),
        )
      ],
    );
  }
}
