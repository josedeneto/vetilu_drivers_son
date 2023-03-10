import 'package:vetiludriversons/models/routes_model.dart';
import 'package:vetiludriversons/models/selected_students_route_model.dart';

class DriverRoutesRepository {
  List<SelectedStudentsRouteModel> _selectedStudentsRoute = [];

  List<SelectedStudentsRouteModel> get selectedStudents=>_selectedStudentsRoute;

  void executeRoute(RoutesModel routesModel,
      SelectedStudentsRouteModel selectedStudentsRouteModel) {
        routesModel.includeStudents.add(selectedStudentsRouteModel);
      }
}
