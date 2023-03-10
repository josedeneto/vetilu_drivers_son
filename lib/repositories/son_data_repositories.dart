import 'package:vetiludriversons/models/son_data_model.dart';

class SonDataRepositories {
  List<SonDataModel> dataUserChild = [];

  SonDataRepositories() {
    dataUserChild.addAll([
      SonDataModel(
          name: 'Lucas',
          age: '14',
          nameSchool: 'Pitabel',
          route: 'Manhã',
          isActive: false,
          phoneFather: '921080429'),
      SonDataModel(
          name: 'José',
          age: '10',
          nameSchool: 'Colina do Sol',
          route: 'Tarde',
          isActive: false,
          phoneFather: '92246629'),
      SonDataModel(
          name: 'Mariana',
          age: '12',
          nameSchool: 'Pitabel',
          route: 'Manhã',
          isActive: false,
          phoneFather: '92356778'),
      SonDataModel(
          name: 'Dorivaldo',
          age: '14',
          nameSchool: 'Pitabel',
          route: 'Tarde',
          isActive: false,
          phoneFather: '921080429'),
      SonDataModel(
          name: 'Dart',
          age: '14',
          nameSchool: 'Pita',
          route: 'Tarde',
          isActive: false,
          phoneFather: '921080429'),
      SonDataModel(
          name: 'Stélvia rivaldo',
          age: '14',
          nameSchool: 'Itel',
          route: 'Manhã',
          isActive: false,
          phoneFather: '921080429'),
    ]);
  }
}
