import '../models/routes_model.dart';

class DataRoutesController {
  final List<RoutesModel> _listRouter = [];
  List<RoutesModel> get listRouter => _listRouter;

  void addRoute(RoutesModel routeDriverModel) {
    _listRouter.add(routeDriverModel);
  }
}
