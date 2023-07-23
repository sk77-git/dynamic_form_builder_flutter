import 'package:dynamic_form_builder_flutter/config/decorations.dart';
import 'package:dynamic_form_builder_flutter/config/styles.dart';
import 'package:dynamic_form_builder_flutter/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CheckboxesField extends StatelessWidget {
  const CheckboxesField({
    super.key,
    required this.title,
    required this.id,
    required this.hint,
    this.initialValue,
    required this.isRequired,
    required this.options,
    this.onChangedCallback,
  });

  final String title;
  final int id;
  final String hint;
  final List<String>? initialValue;
  final List<String> options;
  final bool isRequired;
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
        FormBuilderCheckboxGroup(
          initialValue: initialValue,
          separator: const SizedBox(
            width: 5,
          ),
          validator: (selectedItems) => isRequired
              ? Validator.validateIsListEmpty(items: selectedItems ?? [])
              : Validator.validateNothing(string: ""),
          name: id.toString(),
          decoration: Decorations.inputDecoration(null, hint),
          options: options
              .map((e) => FormBuilderFieldOption(value: e.toString()))
              .toList(),
          onSaved: (value) {
            var ans = "";
            value?.forEach((element) {
              ans = "$ans$element,";
            });
            onChangedCallback?.call(ans ?? "");
          },
        ),
      ],
    );
  }
}
