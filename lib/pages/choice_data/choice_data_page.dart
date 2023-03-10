import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vetiludriversons/models/routes_model.dart';

class ChoiceDataPage extends StatefulWidget {
  ChoiceDataPage({Key? key, required this.onSave, this.routesModel})
      : super(key: key);
  RoutesModel? routesModel;
  ValueChanged<RoutesModel> onSave;
  @override
  State<ChoiceDataPage> createState() => _ChoiceDataPageState();
}

class _ChoiceDataPageState extends State<ChoiceDataPage> {
  TimeOfDay _timeOfDay = TimeOfDay.now();
  DateTime _dateTime = DateTime.now();
  late TextEditingController _cdateTime;
  Future<void> _showDatePicker() async {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }

  @override
  void initState() {
    _cdateTime = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escolher data'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('Escolher data'),
            TextFormField(
              controller: _cdateTime,
              readOnly: true,
              decoration: const InputDecoration(
                hintText: 'Definir data',
                border: OutlineInputBorder(),
              ),
              onTap: () async {
                final dataToday = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2030))
                    .then((value) {
                  setState(() {
                    _dateTime = value!;
                    _cdateTime.text =
                        DateFormat(DateFormat.YEAR_MONTH_DAY).format(_dateTime);
                  });
                });
                /*if (dataFinal != null) {
                  dataFinal = DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt_BR')
                      .format(dataToday);
                  
                }*/
              },
            ),
            const Text('Escolher hora'),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: _showDatePicker,
              child: Container(
                alignment: Alignment.center,
                width: 140,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25,
                  ),
                  border: Border.all(
                    color: Colors.blue,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _timeOfDay.format(context).toString(),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.arrow_drop_down_outlined,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                widget.onSave(
                  RoutesModel(time: _timeOfDay, dateTime: _dateTime),
                );
              },
              child: const Text('Salvar rota'),
            )
          ],
        ),
      ),
    );
  }
}
