import 'package:mobx/mobx.dart';

part 'detail_student_store.g.dart';

class DetailStudentStore = _DetailStudentStore with _$DetailStudentStore;

abstract class _DetailStudentStore with Store {
  
  @observable
  bool isSelected = false;
  @action
  void activeStudentHome() {
    isSelected = !isSelected;
  }


@computed
bool get isActive => isSelected;
}

