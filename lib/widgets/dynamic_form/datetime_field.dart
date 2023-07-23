import 'package:dynamic_form_builder_flutter/config/decorations.dart';
import 'package:dynamic_form_builder_flutter/config/styles.dart';
import 'package:dynamic_form_builder_flutter/utils/date_formatter.dart';
import 'package:dynamic_form_builder_flutter/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DateTimeField extends StatelessWidget {
  const DateTimeField({
    super.key,
    required this.title,
    required this.id,
    required this.hint,
    required this.inputType,
    required this.isRequired,
    this.initialValue,
    this.onChangedCallback,
  });

  final String title;
  final int id;
  final String hint;
  final InputType inputType;
  final bool isRequired;
  final String? initialValue;
  final Function(DateTime)? onChangedCallback;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Styles.titleStyle,
        ),
        const SizedBox(
          height: 8,
        ),
        FormBuilderDateTimePicker(
          initialValue: DateFormatter.getDateTimeObject(initialValue),
          inputType: inputType,
          validator: isRequired
              ? (value) => Validator.validateIsNull(object: value)
              : null,
          name: id.toString(),
          decoration: Decorations.inputDecoration(null, hint),
          initialDate: DateTime.now(),
          onSaved: (value) {
            onChangedCallback?.call(value ?? DateTime.now());
          },
        ),
      ],
    );
  }
}
