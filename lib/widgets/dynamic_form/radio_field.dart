import 'package:dynamic_form_builder_flutter/config/decorations.dart';
import 'package:dynamic_form_builder_flutter/config/styles.dart';
import 'package:dynamic_form_builder_flutter/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RadiosField extends StatelessWidget {
  const RadiosField({
    super.key,
    required this.title,
    required this.id,
    required this.hint,
    required this.isRequired,
    this.initialValue,
    required this.options,
    this.onChangedCallback,
  });

  final String title;
  final int id;
  final String hint;
  final bool isRequired;
  final String? initialValue;
  final List<String> options;
  final Function(String)? onChangedCallback;

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
        FormBuilderRadioGroup(
          initialValue: initialValue,
          validator: (value) => isRequired
              ? Validator.validateIsEmpty(string: value ?? "")
              : Validator.validateNothing(string: ""),
          name: id.toString(),
          decoration: Decorations.inputDecoration(null, hint),
          options: options
              .map(
                (option) => FormBuilderFieldOption(value: option),
              )
              .toList(),
          onSaved: (value) {
            onChangedCallback?.call(value ?? "");
          },
        ),
      ],
    );
  }
}
