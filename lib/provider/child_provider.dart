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

@riverpod
Future<List<ChildModel>> getChildrenByParentEmail(
    GetChildrenByParentEmailRef ref, String email) {
  return ChildService().getChildByParentEmail(email);
}

@riverpod
Future<List<ChildModel>> getNotWaitListedChildrenInClass(
    GetNotWaitListedChildrenInClassRef ref, String classroom) {
  return ChildService().getNotWaitListedChildrenInClass(classroom);
}

@riverpod
Future<List<ChildModel>> getWaitListedChildrenInClass(
    GetWaitListedChildrenInClassRef ref, String classroom) {
  return ChildService().getWaitListedChildrenInClass(classroom);
}

@riverpod
Future<int> getNotWaitListedChildrenInClassCount(
    GetNotWaitListedChildrenInClassCountRef ref, String classroom) {
  return ChildService().getNotWaitListedChildrenInClassCount(classroom);
}
