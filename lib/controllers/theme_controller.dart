import 'package:flutter/cupertino.dart';

class ThemeController {
  //Con esta instancia todas las referencias a ThemeControler seran las mismas
  //Se referiran al mismo objeto y a sus valores
  //patron de diseño singleton
  static final ThemeController instacia = ThemeController._();
  ThemeController._();

  ValueNotifier<bool> isDark = ValueNotifier<bool>(false);

  void changeTheme(bool value) {
    isDark.value = value;
    print('ingreso al cambio de tema');
  }
}
