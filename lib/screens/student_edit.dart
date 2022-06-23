import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/student.dart';
import '../models/student.dart';


class StudentEdit extends StatefulWidget {
  late Student selectedStudent;
  StudentEdit(Student selectedStudent){
    this.selectedStudent = selectedStudent;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(selectedStudent);
  }
}

class _StudentAddState extends State {
  late Student selectedStudent;
  var formKey = GlobalKey<FormState>();
  _StudentAddState(Student selectedStudent){
    this.selectedStudent = selectedStudent;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Öğrenci"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton()
            ],
          ),
        ),
      ),
    );
  }

  buildFirstNameField() {
    return TextFormField(
      initialValue: selectedStudent.firstName,
      decoration: InputDecoration(labelText: "Öğrenci Adı", hintText: "Engin"),
      onSaved: (String? value) {
        selectedStudent.firstName = value!;
      },
    );
  }

  buildLastNameField() {
    return TextFormField(
      initialValue: selectedStudent.lastName,
      decoration:
      InputDecoration(labelText: "Öğrenci Soyadı", hintText: "Demiroğ"),
      onSaved: (String? value) {
        selectedStudent.lastName = value!;
      },
    );
  }

  buildGradeField() {
    return TextFormField(
      initialValue: selectedStudent.grade.toString(),
      decoration: InputDecoration(labelText: "Aldığı not", hintText: "65"),
      onSaved: (String? value) {
        selectedStudent.grade = int.parse(value!);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: () {
        formKey.currentState?.save();
        Navigator.pop(context);
      },
    );
  }
}