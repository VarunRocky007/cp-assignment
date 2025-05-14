import 'package:cross_platform_assignment/data/repository/story_repository_impl.dart';
import 'package:cross_platform_assignment/domain/repository/story_repository.dart';

class UpdateStoryUseCase {
  final StoryRepository _repository;

  UpdateStoryUseCase({StoryRepository? repository})
      : _repository = repository ?? StoryRepositoryImpl();

  Future<bool> execute(
    String objectId,
    String title,
    String content,
  ) async {
    return await _repository.updateStory(
      objectId,
      title,
      content,
    );
  }
}
