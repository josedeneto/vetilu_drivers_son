import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vetiludriversons/pages/student_list/student_list_page.dart';

import '../../repositories/driver_routes_repository.dart';
import '../../repositories/son_data_repositories.dart';
import '../../store/detail_student_store.dart';
import '../detail_student/detail_student_page.dart';

class AddStudentToRoutePage extends StatefulWidget {
  const AddStudentToRoutePage({Key? key}) : super(key: key);

  @override
  State<AddStudentToRoutePage> createState() => _AddStudentToRoutePageState();
}

class _AddStudentToRoutePageState extends State<AddStudentToRoutePage> {
  final studentsSelected = DriverRoutesRepository();
   final detailStudentStore = DetailStudentStore();
    final students = SonDataRepositories();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar estudantes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const StudentListPage(),
              ),
            );
          },
          child: studentsSelected.selectedStudents.isEmpty
              ? const Card(
                  shadowColor: Colors.white70,
                  color: Colors.white,
                  elevation: 4,
                  child: ListTile(
                    leading: Icon(Icons.add_circle_outline_rounded,
                        size: 38, color: Color(0xFF5a3dbd)),
                    title: Text(
                      'Adicionar estudantes',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    subtitle: Text(
                      'Consoante ao espaço da sua viatura',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        color: Colors.black38,
                      ),
                    ),
                  ),
                )
              : ListView.separated(
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
              trailing: Observer(builder: (_) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.home),
                    Visibility(
                        visible: detailStudentStore.isActive,
                        child: Icon(
                          detailStudentStore.isActive
                              ? Icons.arrow_forward
                              : Icons.arrow_back,
                          color: Colors.green,
                        )),
                    const Icon(Icons.school)
                  ],
                );
              }),
            );
          },
        ),
        ),
      ),
    );
  }
}
