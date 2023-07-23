import 'package:dynamic_form_builder_flutter/config/decorations.dart';
import 'package:dynamic_form_builder_flutter/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddressField extends StatelessWidget {
  const AddressField(
      {super.key,
      required this.title,
      required this.id,
      required this.hint,
      required this.isRequired,
      this.initialValue,
      this.onChangedCallback});

  final String title;
  final int id;
  final String hint;
  final bool isRequired;
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
        ),
        const SizedBox(
          height: 8,
        ),
        FormBuilderTextField(
          initialValue: initialValue,
          keyboardType: TextInputType.streetAddress,
          validator: isRequired
              ? (value) => Validator.validateIsEmpty(string: value ?? "")
              : null,
          name: id.toString(),
          decoration: Decorations.inputDecoration(null, hint),
          onChanged: (value) {},
          onSaved: (value) {
            onChangedCallback?.call(value ?? "");
          },
        ),
      ],
    );
  }
}
