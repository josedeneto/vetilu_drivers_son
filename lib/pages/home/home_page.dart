import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vetiludriversons/controllers/data_routes_controller.dart';
import 'package:vetiludriversons/pages/student_list/student_list_page.dart';

import '../../models/routes_model.dart';
import '../choice_data/choice_data_page.dart';

class RoutePage extends StatefulWidget {
  const RoutePage({Key? key}) : super(key: key);

  @override
  State<RoutePage> createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  final routes = DataRoutesController();

  void addRoutes(RoutesModel route) {
    setState(() {
      routes.listRouter.add(route);
    });
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 3),
        content: Text(
          'Rota salva com sucesso',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pink,
        title: const Text('Routas'),
        actions: [
          IconButton(
            onPressed: (() => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChoiceDataPage(onSave: addRoutes),
                  ),
                )),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: routes.listRouter.isEmpty
          ? const Center(
              child: Text(
                'Nenhuma rota disponível para levar os candengues',
              ),
            )
          : ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, r) => ListTile(
                onTap: showAction,
                title: Text(
                  routes.listRouter[r].time!.format(context),
                ),
                subtitle: Text(
                  DateFormat(
                    DateFormat.YEAR_MONTH_DAY,
                  ).format(routes.listRouter[r].dateTime!),
                ),
              ),
              separatorBuilder: (_, __) => const Divider(
                thickness: 0.5,
              ),
              itemCount: routes.listRouter.length,
            ),
    );
  }

  showAction() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Escolher uma acção'),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const StudentListPage(),
                    ),
                  );
                },
                child: const Text('Executar rota'),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {},
                child: const Text('Editar rota'),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {},
                child: const Text('Apagar rota'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
