import 'package:flutter/material.dart';

class CategoryItemChip extends StatelessWidget {
  const CategoryItemChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              decoration: ShapeDecoration(
                color: Colors.red,
                shadows: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 20,
                    spreadRadius: -5,
                    offset: Offset(0, 15),
                  ),
                ],
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              height: 56,
              width: 56,
            ),

            Icon(Icons.shopping_cart, size: 30, color: Colors.white),
          ],
        ),
        SizedBox(height: 10),
        Text("همه", style: TextStyle(fontFamily: "SB", fontSize: 12)),
      ],
    );
  }
}
