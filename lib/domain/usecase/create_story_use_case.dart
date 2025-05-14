import 'package:cross_platform_assignment/data/repository/story_repository_impl.dart';
import 'package:cross_platform_assignment/domain/repository/story_repository.dart';

class CreateStoryUseCase {
  final StoryRepository _storyRepository;

  CreateStoryUseCase({StoryRepository? storyRepository})
      : _storyRepository = storyRepository ?? StoryRepositoryImpl();

  Future<bool> execute({
    required String title,
    required String content,
  }) {
    return _storyRepository.createStory(
      title,
      content,
    );
  }
}