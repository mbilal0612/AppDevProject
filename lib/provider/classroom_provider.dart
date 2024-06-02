import 'package:project/models/classroom_model.dart';
import 'package:project/service/classroom_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'classroom_provider.g.dart';

@riverpod
Future<List<ClassroomModel>> getAllClassrooms(GetAllClassroomsRef ref) {
  return ClassroomService().getClassrooms();
}

@riverpod
Future<void> removeChildFromWaitList(
    RemoveChildFromWaitListRef ref, String uuid, String classroom) {
  return ClassroomService().removeChildFromWaitList(uuid, classroom);
}
