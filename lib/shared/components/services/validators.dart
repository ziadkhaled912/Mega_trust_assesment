import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Validators {
  static String? defaultValidation(String? value, {String? message}) {
    if (value == null || value.isEmpty) {
      return message ?? 'هذا حقل مطلوب';
    } else {
      return null;
    }
  }

  static String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "برجاء إدخال عنوان البريد الإلكتروني الخاص بك";
    } else {
      return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)
          ? null
          : 'برجاء تحقق من بريدك الالكتروني';
    }
  }

  static String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'من فضلك ادخل كلمة المرور';
    } else {
      return value.length < 6
          ? 'كلمة المرور الخاصة بك ضعيفة ، أدخل أكثر من ستة أحرف'
          : null;
    }
  }

  static String? confirmPasswordValidation(
      String? value, {
        required TextEditingController confirmPassword,
        required TextEditingController password,
      }) {
    if (value == null || value.isEmpty) {
      return 'تأكيد كلمة المرور مطلوبة';
    } else {
      return confirmPassword.text != password.text
          ? 'تأكيد كلمة المرور لا يساوي كلمة المرور'
          : null;
    }
  }

  static String? phoneValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'رقم الهاتف مطلوب';
    } else {
      return value.length < 7 ? 'من فضلك ادخل رقم هاتف صحيح' : null;
    }
  }

  static TextInputFormatter numbersOnlyFormatter() =>
      FilteringTextInputFormatter.digitsOnly;


  static String? defaultCheckboxValidation(bool? value, {String? message}) {
    if (value == false) {
      return message ?? 'هذا حقل مطلوب';
    } else {
      return null;
    }
  }

  static void unFocusTextField(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}