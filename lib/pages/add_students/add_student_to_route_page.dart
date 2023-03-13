import 'package:flutter/material.dart';
import 'package:vetiludriversons/pages/student_list/student_list_page.dart';

import '../../repositories/driver_routes_repository.dart';

class AddStudentToRoutePage extends StatefulWidget {
  const AddStudentToRoutePage({Key? key}) : super(key: key);

  @override
  State<AddStudentToRoutePage> createState() => _AddStudentToRoutePageState();
}

class _AddStudentToRoutePageState extends State<AddStudentToRoutePage> {
  final studentsSelected = DriverRoutesRepository();
 
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
                  itemBuilder: (_, student) => const ListTile(
                    title: Text('Embarque para casa'),
                  ),
                  separatorBuilder: (_, __) => const Divider(
                    thickness: 0.5,
                  ),
                  itemCount: studentsSelected.selectedStudents.length,
                ),
        ),
      ),
    );
  }
}
