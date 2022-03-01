import 'package:flutter/material.dart';

import '../../styles/app_colors.dart';
import '../../styles/font_styles.dart';

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField({
    Key? key,
    required String title,
    required FormFieldSetter<bool> onSaved,
    required FormFieldValidator<bool> validator,
    bool initialValue = false,
    bool autoValidate = false,
  }) : super(
            key: key,
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            builder: (FormFieldState<bool> state) {
              return CheckboxListTile(
                dense: state.hasError,
                title: Text(title, style: AppTextStyles.thirdTextStyle()),
                value: state.value,
                onChanged: state.didChange,
                contentPadding: EdgeInsets.zero,
                subtitle: state.hasError
                    ? Builder(
                        builder: (BuildContext context) => Text(
                          state.errorText!,
                          style: AppTextStyles.subTextStyle().copyWith(color: AppColors.errorColor),
                        ),
                      )
                    : null,
              );
            });
}
