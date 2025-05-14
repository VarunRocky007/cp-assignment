import 'package:cross_platform_assignment/data/repository/story_repository_impl.dart';
import 'package:cross_platform_assignment/domain/repository/story_repository.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class GetStoriesUseCase {
  final StoryRepository _repository;

  GetStoriesUseCase({StoryRepository? repository})
      : _repository = repository ?? StoryRepositoryImpl();

  Future<List<ParseObject>> call() async {
    return await _repository.readStories();
  }
}
