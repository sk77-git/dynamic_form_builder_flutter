import 'package:dropdown_search/dropdown_search.dart';
import 'package:dynamic_form_builder_flutter/config/decorations.dart';
import 'package:dynamic_form_builder_flutter/config/styles.dart';
import 'package:dynamic_form_builder_flutter/utils/validator.dart';
import 'package:flutter/material.dart';

class DropDownField extends StatelessWidget {
  const DropDownField({
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
        DropdownSearch<String>(
          popupProps: PopupProps.menu(
            searchDelay: const Duration(milliseconds: 200),
            fit: FlexFit.loose,
            title: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: options.length > 5
                    ? const Text(
                        "Search or select",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    : Container()),
            showSearchBox: options.length > 5 ? true : false,
            searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                  hintText: "Search"),
            ),
            menuProps: MenuProps(
              borderOnForeground: true,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          validator: (value) => isRequired
              ? Validator.validateIsEmpty(string: value ?? "")
              : Validator.validateNothing(string: value ?? ""),
          dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: const TextStyle(fontSize: 14),
            dropdownSearchDecoration: Decorations.inputDecoration(null, hint),
          ),
          selectedItem: initialValue,
          items: options,
          onSaved: (value) {
            onChangedCallback?.call(value ?? "");
          },
        )
      ],
    );
  }
}
