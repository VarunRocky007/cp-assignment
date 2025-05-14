import 'package:cross_platform_assignment/data/repository/story_repository_impl.dart';
import 'package:cross_platform_assignment/domain/repository/story_repository.dart';

class DeleteStoryUseCase {
  final StoryRepository _storyRepository;
  DeleteStoryUseCase({StoryRepository? storyRepository})
      : _storyRepository = storyRepository ?? StoryRepositoryImpl();

  Future<bool> execute({
    required String objectId,
  }) {
    return _storyRepository.deleteStory(
      objectId,
    );
  }
}