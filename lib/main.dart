import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:students/view/list_student.dart';
import 'model/data_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
    await Hive.openBox<StudentModel>('data');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListStudentWidget(),
    );
  }
}
