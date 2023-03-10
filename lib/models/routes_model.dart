import 'package:flutter/material.dart';

import 'selected_students_route_model.dart';

class RoutesModel {
  TimeOfDay? time;
  DateTime? dateTime;
  List< SelectedStudentsRouteModel> includeStudents = [];
  RoutesModel({
    required this.time,
    required this.dateTime,
  });
}
