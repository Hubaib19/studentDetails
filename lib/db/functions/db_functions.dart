import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../model/data_model.dart';


ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

 Future<void> addStudent(StudentModel value) async{
  final studentDB = await Hive.openBox<StudentModel>('data');

   studentDB.add(value);

  studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
}

Future<void> getAllStudents() async {
  final studentDB = await Hive.openBox<StudentModel>('data');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}

Future<void> deletestudent(index) async{
  final studentDB = await Hive.openBox<StudentModel>('data');
  await studentDB.deleteAt(index);
  getAllStudents();
}

Future<void> editstudent(index, StudentModel value) async {
  final studentDB = await Hive.openBox<StudentModel>('data');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
  studentDB.putAt(index, value);
  getAllStudents();
}