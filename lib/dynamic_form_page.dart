import 'dart:developer';

import 'package:dynamic_form_builder_flutter/models/dynamic_form.dart';
import 'package:dynamic_form_builder_flutter/widgets/dynamic_form/address_field.dart';
import 'package:dynamic_form_builder_flutter/widgets/dynamic_form/checkbox_field.dart';
import 'package:dynamic_form_builder_flutter/widgets/dynamic_form/datetime_field.dart';
import 'package:dynamic_form_builder_flutter/widgets/dynamic_form/dropdown_field.dart';
import 'package:dynamic_form_builder_flutter/widgets/dynamic_form/number_field.dart';
import 'package:dynamic_form_builder_flutter/widgets/dynamic_form/question_field.dart';
import 'package:dynamic_form_builder_flutter/widgets/dynamic_form/radio_field.dart';
import 'package:dynamic_form_builder_flutter/widgets/dynamic_form/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DynamicFormPage extends StatefulWidget {
  const DynamicFormPage({Key? key}) : super(key: key);

  @override
  State<DynamicFormPage> createState() => _DynamicFormPageState();
}

class _DynamicFormPageState extends State<DynamicFormPage> {
  List<FormFieldData> formFields = [
    FormFieldData(type: "text", title: "Text", hint: "Enter text"),
    FormFieldData(type: "number", title: "Number", hint: "Enter number"),
    FormFieldData(
        type: "datetime", title: "DateTime", hint: "Select date and time"),
    FormFieldData(
        type: "address", title: "Address", hint: "Pick address on map"),
    FormFieldData(
        type: "dropdown",
        title: "DropDown",
        options: ["Option 1", "Option 2"],
        hint: "Select one option from dropdown"),
    FormFieldData(
      type: "checkbox",
      title: "Checkbox",
      options: ["Male", "Female"],
    ),
    FormFieldData(type: "radio", title: "Radio", options: ["Yes", "No"]),
    FormFieldData(type: "question", title: "Question", options: ["One", "Two"]),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dynamic Form"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: formFields.length,
                  itemBuilder: (ctx, index) {
                    return getInputWidget(formFields[index]);
                  }),
              ElevatedButton(onPressed: () {}, child: const Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }

  Widget getInputWidget(FormFieldData form) {
    Widget inputWidget = Container();
    switch (form.type) {
      case "text":
        {
          inputWidget = CustomTextField(
            title: form.title ?? "",
            id: form.id ?? 0,
            hint: form.hint ?? "",
            isMultiline: form.isParagraph ?? false,
            isRequired: form.isRequired ?? false,
            onChangedCallback: (value) {
              log(value);
            },
          );
          break;
        }
      case "number":
        {
          inputWidget = NumberField(
            title: form.title ?? "",
            id: form.id ?? 0,
            hint: form.hint ?? "",
            isRequired: form.isRequired ?? false,
            minLength: form.min ?? 0,
            maxLength: form.max ?? 100,
            onChangedCallback: (value) {
              log(value);
            },
          );
          break;
        }
      case "address":
        {
          inputWidget = AddressField(
            title: form.title ?? "",
            id: form.id ?? 0,
            hint: form.hint ?? "",
            isRequired: form.isRequired ?? false,
            onChangedCallback: (value) {
              log(value);
            },
          );
          break;
        }
      case "datetime":
        {
          inputWidget = DateTimeField(
            title: form.title ?? "",
            id: form.id ?? 0,
            hint: form.hint ?? "",
            isRequired: form.isRequired ?? false,
            inputType: getDateTimeInputType(form),
            onChangedCallback: (value) {
              log(value.microsecondsSinceEpoch.toString());
            },
          );
          break;
        }
      case "dropdown":
        {
          inputWidget = DropDownField(
            title: form.title ?? "",
            id: form.id ?? 0,
            hint: form.hint ?? "",
            isRequired: form.isRequired ?? false,
            options: form.options ?? [],
            onChangedCallback: (value) {
              log(value);
            },
          );
          break;
        }
      case "checkbox":
        {
          inputWidget = CheckboxesField(
            title: form.title ?? "",
            id: form.id ?? 0,
            hint: form.hint ?? "",
            isRequired: form.isRequired ?? false,
            options: form.options ?? [],
            onChangedCallback: (value) {
              log(value);
            },
          );
          break;
        }
      case "radio":
        {
          inputWidget = RadiosField(
            title: form.title ?? "",
            id: form.id ?? 0,
            hint: form.hint ?? "",
            isRequired: form.isRequired ?? false,
            options: form.options ?? [],
            onChangedCallback: (value) {
              log(value);
            },
          );
          break;
        }
      case "question":
        {
          inputWidget = QuestionField(
            title: form.title ?? "",
            id: form.id ?? 0,
            hint: form.hint ?? "",
            isRequired: form.isRequired ?? false,
            options: form.options ?? [],
            onChangedCallback: (value) {
              log(value);
            },
          );
          break;
        }
      /* case "media":
        {
          inputWidget = MediaField(
            title: form.formLabel ?? "",
            id: form.id ?? 0,
            hint: "Select file",
            isRequired: options["is_required"] ?? false,
            onChangedCallback: (value) {
              var templateResponseResult = TemplateResponseResult(
                  templateItemsId: form.id ?? 0, result: value);
              templateResponseResults.add(templateResponseResult);
            },
          );
          break;
        }*/
      default:
        inputWidget = Container();
    }
    return inputWidget;
  }

  InputType getDateTimeInputType(FormFieldData form) {
    bool enableDate = form.enableDate ?? true;
    bool enableTime = form.enableTime ?? true;

    if (!enableDate && enableTime) {
      return InputType.time;
    } else if (enableDate && !enableTime) {
      return InputType.date;
    } else {
      return InputType.both;
    }
  }
}
