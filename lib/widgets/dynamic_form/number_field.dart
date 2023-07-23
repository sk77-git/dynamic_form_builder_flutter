import 'package:dynamic_form_builder_flutter/config/decorations.dart';
import 'package:dynamic_form_builder_flutter/config/styles.dart';
import 'package:dynamic_form_builder_flutter/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class NumberField extends StatelessWidget {
  const NumberField(
      {super.key,
      required this.title,
      required this.id,
      required this.hint,
      required this.isRequired,
      this.initialValue,
      this.onChangedCallback,
      this.maxLength = 10,
      this.minLength = 0});

  final String title;
  final int id;
  final String hint;
  final bool isRequired;
  final int minLength;
  final int maxLength;
  final String? initialValue;
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
        FormBuilderTextField(
          initialValue: initialValue,
          keyboardType: TextInputType.number,
          validator: isRequired
              ? (value) => Validator.validateMinMaxLength(
                  string: value ?? "",
                  minLength: minLength,
                  maxLength: maxLength)
              : null,
          name: id.toString(),
          decoration: Decorations.inputDecoration(
              const Icon(
                Icons.onetwothree_outlined,
                size: 32,
              ),
              hint),
          onSaved: (value) {
            onChangedCallback?.call(value ?? "");
          },
        ),
      ],
    );
  }
}
