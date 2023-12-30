// ignore_for_file: prefer_const_constructors_in_immutables, no_leading_underscores_for_local_identifiers, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:students/db/functions/db_functions.dart';
import 'package:students/model/data_model.dart';
import 'package:students/view/list_student.dart';

class AddStudentWidget extends StatelessWidget {
  AddStudentWidget({Key? key}) : super(key: key);

  final _nameController = TextEditingController();

  final _phonecontrolller = TextEditingController();

  final _placecontroller = TextEditingController();

    final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
      appBar: AppBar(
        title: const Text('Enter details'),
        backgroundColor: Colors.brown[600],
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'Enter Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'value is empty';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              TextFormField(
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.phone,
                controller: _phonecontrolller,
                decoration: const InputDecoration(
                  hintText: 'Enter Number',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'value is empty';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 15, width: 10),
              TextFormField(
                controller: _placecontroller,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: 'Enter Place',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty ) {
                    return 'value is empty';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 10
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom
                (backgroundColor: Colors.brown[600],
                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20))
                ),
                onPressed: (){
                  if(_formkey.currentState!.validate()){
                    onAddStudentButtonClicked(context);

                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ListStudentWidget(),));

                  }
                  else{
                    print('empty value');
                  }

                }, 
                child: const Text('Add student',
                style: TextStyle(color: Colors.white)
                ,)),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onAddStudentButtonClicked(BuildContext context) async {
    final _name = _nameController.text.trim();
    final _phone = _phonecontrolller.text.trim();
    final _place = _placecontroller.text.trim();
    
    if (_name.isEmpty || _phone.isEmpty || _place.isEmpty) {
      return;
    }

    final _student = StudentModel(
        name: _name,
        phone: _phone,
        place: _place,
    );

    addStudent(_student);
   }
}
