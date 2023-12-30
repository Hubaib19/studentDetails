// ignore_for_file: prefer_typing_uninitialized_variables, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:students/db/functions/db_functions.dart';
import 'package:students/model/data_model.dart';
import 'package:students/screen/list_student.dart';

// ignore: must_be_immutable
class Edit extends StatefulWidget {
  final name;
  final phone;
  final place;
  dynamic index;

  Edit(
      {super.key, required this.index,
      required this.name,
      required this.phone,
      required this.place});

  @override
  State<Edit> createState() => _editState();
}

class _editState extends State<Edit> {
  TextEditingController _nameController = TextEditingController();

  TextEditingController _phoneController = TextEditingController();

  TextEditingController _placeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _phoneController = TextEditingController(text: widget.phone);
    _placeController = TextEditingController(text: widget.place);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
          body: Container(
            height: double.infinity,
            width: double.infinity,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 50),
                    Container(
                      margin: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(children: [
                        TextField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Name',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                          keyboardType: TextInputType.number,
                          controller: _phoneController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'phone',
                            filled: true,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: _placeController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'place',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              updateall(context);
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.brown[600]),
                            child: const Text('Update')
                            ),
                      ]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
  }

  Future<void> updateall(ctx) async {
    final ih = _nameController.text.trim();
    final ih1 = _phoneController.text.trim();
    final ih2 = _placeController.text.trim();

    if (ih.isEmpty || ih1.isEmpty || ih2.isEmpty) {
      return;
    } else {
      final updation = StudentModel(
        name: ih,
        phone: ih1,
        place: ih2,
      );

      editstudent(widget.index, updation);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ListStudentWidget()));
    }
  }
}
