import 'package:flutter/cupertino.dart';

class ErrorCode{
  static const int unknownError = -1;

  //Custom define error code
  static const int loginConfirmPINDoesNotMatch = -2;

  // Default error code
  static const int serverErrorCode = 0;

  // Server error code

}

extension ErrorCodeConverter on int{
  String? toErrorMessage(BuildContext context) {
    switch(this){
      case ErrorCode.unknownError :{
        return 'Unknown error';
      }
    }
    return null;
  }
}
