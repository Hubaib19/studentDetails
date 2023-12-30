import 'package:flutter/material.dart';
import 'package:students/db/functions/db_functions.dart';
import 'package:students/model/data_model.dart';
import 'package:students/screen/add_student.dart';
import 'package:students/screen/edit_student.dart';
import 'package:students/screen/search_student.dart';

class ListStudentWidget extends StatefulWidget {
  const ListStudentWidget({super.key});

  @override
  State<ListStudentWidget> createState() => _ListStudentWidgetState();
}

class _ListStudentWidgetState extends State<ListStudentWidget> {
  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
      appBar: AppBar(
        backgroundColor: Colors.brown[600],
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => AddStudentWidget(),
              ));
            },
            icon: const Icon(Icons.arrow_back)),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: search());
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: ValueListenableBuilder(
          valueListenable: studentListNotifier,
          builder: (BuildContext ctx, List<StudentModel> studentList,
              Widget? child) {
            return ListView.separated(
              itemBuilder: (ctx, index) {
                final data = studentList[index];
                return GestureDetector(
                  child: ListTile(
                      title: Text(data.name),
                      subtitle: Text(data.place),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              deletestudent(index);
                            },
                            icon: const Icon(
                              Icons.delete,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Edit(
                                    name: data.name,
                                    index: index,
                                    phone: data.phone,
                                    place: data.place,
                                  ),
                                ));
                              },
                              icon: Icon(
                                Icons.edit,
                                color: Colors.brown[200],
                              ))
                        ],
                      )),
                );
              },
              separatorBuilder: (ctx, index) {
                return const Divider();
              },
              itemCount: studentList.length,
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddStudentWidget(),
          ));
        },
        backgroundColor: Colors.brown[600],
        child: const Icon(Icons.add),
      ),
    );
  }
}
