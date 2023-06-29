import 'package:flutter/cupertino.dart';

extension ContextExtension on  BuildContext {
  void hideKeyBoard() {
    FocusScope.of(this).unfocus();
  }
}
