import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vetiludriversons/models/son_data_model.dart';
import 'package:vetiludriversons/store/detail_student_store.dart';

class DetailStudentPage extends StatefulWidget {
  DetailStudentPage({
    Key? key,
    this.sonDataModel,
  }) : super(key: key);
  SonDataModel? sonDataModel;
  @override
  State<DetailStudentPage> createState() => _DetailStudentPageState();
}

class _DetailStudentPageState extends State<DetailStudentPage> {
  final detailStudentStore = DetailStudentStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person),
                      radius: 38,
                    ),
                    Text(
                      'Nome:${widget.sonDataModel!.name}',
                    ),
                    Text(
                      'Escola:${widget.sonDataModel!.nameSchool}',
                    ),
                    Text(
                        'Número do encarregado:${widget.sonDataModel!.phoneFather}'),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Embarcar para escola'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Observer(builder: (_) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.amber),
                    onPressed: () {
                      detailStudentStore.activeStudentHome();
                      Navigator.pop(context);
                    },
                    child: const Text('Embarcar para casa'),
                  );
                })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
