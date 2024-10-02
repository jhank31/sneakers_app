import 'package:flutter/material.dart';

extension ScreenSizeExtension on BuildContext {
  //* Se obtiene la altura ajustada, con un valor opcional para hisVar
  double screenHeight({double hisVar = 1.0}) {
    final screeenSize = MediaQuery.of(this).size;
    return (screeenSize.height -
            MediaQuery.of(this).viewPadding.left -
            MediaQuery.of(this).viewPadding.right) *
        hisVar;
  }

  //* Se obtiene el ancho ajustado, con un valor opcional para hisVar
  double screenWidth({double hisVar = 1.0}) {
    final screeenSize = MediaQuery.of(this).size;
    return (screeenSize.width -
            MediaQuery.of(this).viewPadding.left -
            MediaQuery.of(this).viewPadding.right) *
        hisVar;
  }
}
