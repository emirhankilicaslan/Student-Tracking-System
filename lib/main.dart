import 'package:flutter/material.dart';
import 'package:flutter_ornekler/screens/student_add.dart';
import 'package:flutter_ornekler/screens/student_edit.dart';

import 'models/student.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //cupertino
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  List<Student> students = [
    Student.withId(1, "Buse", "Balkanlı", 95),
    Student.withId(2, "Emirhan", "Kılıçaslan", 45),
    Student.withId(3, "Yunus", "Emre", 25),
  ];
  Student selectedStudent = Student.withId(0, "", "", 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Öğrenci Takip Sistemi"),
        ),
        body: buildBody());
  }

  Widget buildBody() {
    return Column(children: <Widget>[
      Expanded(
        child: ListView.builder(
            itemCount: students.length,
            itemBuilder: (BuildContext, int index) {
              return ListTile(
                title: Text(
                    students[index].firstName + " " + students[index].lastName),
                subtitle: Text("Sınavdan aldığı not : " +
                    students[index].grade.toString() +
                    "[" +
                    students[index].getStatus +
                    "]"),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://cdn.pixabay.com/photo/2018/06/27/07/45/student-3500990_960_720.jpg"),
                ),
                trailing: buildStatusIcon(students[index].grade),
                onTap: () {
                  setState(() {
                    this.selectedStudent = students[index];
                  });
                },
                onLongPress: () {
                  print("Uzun basıldı");
                },
              );
            }),
      ),
      Text("Seçili öğrenci : " + selectedStudent.firstName + " " + selectedStudent.lastName),
      Row (
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: RaisedButton(
              color: Colors.greenAccent,
              child: Row(
                children: <Widget>[
                  Icon(Icons.add),
                  SizedBox(width: 5.0,),
                  Text("Yeni Öğrenci")
                ],
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)));
              },
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: RaisedButton(
              color: Colors.black12,
              child: Row(
                children: <Widget>[
                  Icon(Icons.add),
                  SizedBox(width: 5.0,),
                  Text("Güncelle")
                ],
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentEdit(selectedStudent)));
              },
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: RaisedButton(
              color: Colors.amberAccent,
              child: Row(
                children: <Widget>[
                  Icon(Icons.add),
                  SizedBox(width: 5.0,),
                  Text("Sil")
                ],
              ),
              onPressed: () {
                setState(() {
                  students.remove(selectedStudent);
                });
                var message = "Silindi : " + selectedStudent.firstName;
                showMessage(context, message);
              },
            ),
          )
        ],
      )
    ]);
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }

  void showMessage(BuildContext context, String message) {
    var alert = AlertDialog(
      title: Text("İşlem Sonucu"),
      content: Text(message),
    );
  }
}
