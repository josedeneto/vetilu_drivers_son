// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_student_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailStudentStore on _DetailStudentStore, Store {
  Computed<bool>? _$isActiveComputed;

  @override
  bool get isActive =>
      (_$isActiveComputed ??= Computed<bool>(() => super.isActive,
              name: '_DetailStudentStore.isActive'))
          .value;

  late final _$isSelectedAtom =
      Atom(name: '_DetailStudentStore.isSelected', context: context);

  @override
  bool get isSelected {
    _$isSelectedAtom.reportRead();
    return super.isSelected;
  }

  @override
  set isSelected(bool value) {
    _$isSelectedAtom.reportWrite(value, super.isSelected, () {
      super.isSelected = value;
    });
  }

  late final _$_DetailStudentStoreActionController =
      ActionController(name: '_DetailStudentStore', context: context);

  @override
  void activeStudentHome() {
    final _$actionInfo = _$_DetailStudentStoreActionController.startAction(
        name: '_DetailStudentStore.activeStudentHome');
    try {
      return super.activeStudentHome();
    } finally {
      _$_DetailStudentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSelected: ${isSelected},
isActive: ${isActive}
    ''';
  }
}
