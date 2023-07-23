class DynamicForm {
  var jsonBody = {
    "form_fields": [
      {
        "id": "field1",
        "type": "text",
        "is_paragraph": true,
        "title": "Text Input as Paragraph",
        "hint": "Enter your paragraph here",
        "is_required": true
      },
      {
        "id": "field2",
        "type": "number",
        "min": 0,
        "max": 100,
        "title": "Number Input",
        "hint": "Enter a number between 0 and 100",
        "is_required": true
      },
      {
        "id": "field3",
        "type": "address",
        "title": "Address Input",
        "hint": "Enter your address",
        "is_required": true
      },
      {
        "id": "field4",
        "type": "datetime",
        "enableDate": true,
        "enableTime": true,
        "title": "Date and Time Input",
        "hint": "Select a date and time",
        "is_required": true
      },
      {
        "id": "field5",
        "type": "dropdown",
        "options": ["Option 1", "Option 2", "Option 3"],
        "title": "Dropdown Selection",
        "hint": "Select an option from the dropdown",
        "is_required": true
      },
      {
        "id": "field6",
        "type": "checkbox",
        "options": ["Option 1", "Option 2", "Option 3"],
        "title": "Checkbox Selection",
        "hint": "Select one or more options",
        "is_required": true
      },
      {
        "id": "field7",
        "type": "radio",
        "options": ["Option 1", "Option 2", "Option 3"],
        "title": "Radio Button Selection",
        "hint": "Select one option",
        "is_required": true
      },
      {
        "id": "field8",
        "type": "question",
        "options": ["Option 1", "Option 2", "Option 3"],
        "title": "Question with Options",
        "hint": "Select the best option",
        "is_required": true
      },
      {
        "id": "field9",
        "type": "media",
        "title": "Media Upload",
        "hint": "Upload a media file",
        "is_required": true
      }
    ]
  };
  List<FormFieldData>? formFields;

  DynamicForm({this.formFields});

  DynamicForm.fromJson(Map<String, dynamic> json) {
    if (json['form_fields'] != null) {
      formFields = <FormFieldData>[];
      json['form_fields'].forEach((v) {
        formFields!.add(FormFieldData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.formFields != null) {
      data['form_fields'] = this.formFields!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FormFieldData {
  int? id;
  String? type;
  bool? isParagraph;
  String? title;
  String? hint;
  bool? isRequired;
  int? min;
  int? max;
  bool? enableDate;
  bool? enableTime;
  List<String>? options;

  FormFieldData(
      {this.id,
      this.type,
      this.isParagraph,
      this.title,
      this.hint,
      this.isRequired,
      this.min,
      this.max,
      this.enableDate,
      this.enableTime,
      this.options});

  FormFieldData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    isParagraph = json['is_paragraph'];
    title = json['title'];
    hint = json['hint'];
    isRequired = json['is_required'];
    min = json['min'];
    max = json['max'];
    enableDate = json['enableDate'];
    enableTime = json['enableTime'];
    options = json['options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['type'] = type;
    data['is_paragraph'] = isParagraph;
    data['title'] = title;
    data['hint'] = hint;
    data['is_required'] = isRequired;
    data['min'] = min;
    data['max'] = max;
    data['enableDate'] = enableDate;
    data['enableTime'] = enableTime;
    data['options'] = options;
    return data;
  }
}
