import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/student.dart';
import '../models/student.dart';


class StudentAdd extends StatefulWidget {
  List<Student> students;
  //StudentAdd(List<Student> students){
  //this.students = students;
  //}
  StudentAdd(this.students);
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State {
  late List<Student> students;
  var formKey = GlobalKey<FormState>();
  Student student = Student.withoutInfo();
  _StudentAddState(List<Student> students){
    this.students = students;
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
      decoration: InputDecoration(labelText: "Öğrenci Adı", hintText: "Engin"),
      onSaved: (String? value) {
        student.firstName = value!;
      },
    );
  }

  buildLastNameField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Öğrenci Soyadı", hintText: "Demiroğ"),
      onSaved: (String? value) {
        student.lastName = value!;
      },
    );
  }

  buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldığı not", hintText: "65"),
      onSaved: (String? value) {
        student.grade = int.parse(value!);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: () {
        formKey.currentState?.save();
        students.add(student);
        //widget.students.add(student);
        Navigator.pop(context);
      },
    );
  }
}
