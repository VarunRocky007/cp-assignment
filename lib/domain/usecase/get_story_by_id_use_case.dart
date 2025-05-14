import 'package:cross_platform_assignment/data/repository/story_repository_impl.dart';
import 'package:cross_platform_assignment/domain/repository/story_repository.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class GetStoryByIdUseCase {
  final StoryRepository _repository;

  GetStoryByIdUseCase({StoryRepository? repository})
      : _repository = repository ?? StoryRepositoryImpl();

  Future<ParseObject?> execute(String objectId) async {
    return await _repository.getStoryById(objectId);
  }
}