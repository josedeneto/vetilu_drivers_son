import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vetiludriversons/pages/detail_student/detail_student_page.dart';
import 'package:vetiludriversons/repositories/son_data_repositories.dart';
import 'package:vetiludriversons/store/detail_student_store.dart';
import 'package:mobx/mobx.dart';

class StudentListPage extends StatefulWidget {
  const StudentListPage({Key? key}) : super(key: key);

  @override
  State<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  final detailStudentStore = DetailStudentStore();
  final students = SonDataRepositories();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estudantes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Observer(builder: (_) {
          return ListView.separated(
            separatorBuilder: (_, __) => const Divider(thickness: 0.5),
            itemCount: students.dataUserChild.length,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, e) {
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailStudentPage(
                        sonDataModel: students.dataUserChild[e],
                      ),
                    ),
                  );
                },
                leading: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blue,
                  child: Text(
                    students.dataUserChild[e].name[0],
                  ),
                ),
                title: Text(
                  students.dataUserChild[e].name,
                ),
                subtitle: Text(
                  students.dataUserChild[e].nameSchool,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.person,
                        color: detailStudentStore.isSelected
                            ? Colors.yellow
                            : Colors.red),
                    const SizedBox(
                      height: 5,
                    ),
                    const Icon(Icons.home)
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
