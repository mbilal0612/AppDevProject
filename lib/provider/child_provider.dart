import 'package:project/models/child_model.dart';
import 'package:project/models/classroom_model.dart';
import 'package:project/service/child_service.dart';
import 'package:project/service/classroom_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'child_provider.g.dart';

@riverpod
Future<List<ChildModel>> getChildrenInClassroom(
    GetChildrenInClassroomRef ref, String classroom) {
  return ChildService().getChildrenInClass(classroom);
}
