import 'package:project/models/parent_model.dart';
import 'package:project/service/parent_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'parent_provider.g.dart';

@riverpod
Future<List<Parent>> getAllParentsEmails(GetAllParentsEmailsRef ref) {
  return ParentService().getAllParentsEmail();
}
