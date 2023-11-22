// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:students/db/functions/db_functions.dart';
import '../model/data_model.dart';

class search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(onPressed: () => query = "", icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: studentListNotifier,
        builder:
            (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
          return ListView.builder(
            itemBuilder: (ctx, index) {
              final data = studentList[index];
              if (data.name.toLowerCase().contains(query.toUpperCase())) {
                return Column(
                  children: [
                    ListTile(
                      // onTap: () {
                      //   Navigator.of(context).push(
                      //     MaterialPageRoute(
                      //       builder: (ctx) => ViewDetails(
                      //       index: index,
                      //       name: data.name,
                      //       phone: data.phone,
                      //       place: data.place,
                      //       ),
                      //     ),
                      //   );
                      // },
                      title: Text(data.name),
                    ),
                    const Divider()
                  ],
                );
              } else {
                return Container();
              }
            },
            itemCount: studentList.length,
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) => ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder: (BuildContext context, List<StudentModel> studentlist,
          Widget? child) {
        return ListView.builder(
            itemCount: studentlist.length,
            itemBuilder: (BuildContext context, index) {
              final data = studentlist[index];

              if (data.name
                  .toLowerCase()
                  .contains(query.toLowerCase().trim())) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(data.name),
                      subtitle: Text(data.place),
                    ),
                  ],
                );
              } else {
                return Container();
              }
            });
      });
}
