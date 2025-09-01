import 'dart:ui';

extension ColorParsing on String {
  Color parseToColor() {
    int hexColor = int.parse("0xff$this");
    return Color(hexColor);
  }
}
