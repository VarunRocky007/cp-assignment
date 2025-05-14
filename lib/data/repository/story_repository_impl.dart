import 'package:cross_platform_assignment/data/remote_data_source/story_remote_data_source.dart';
import 'package:cross_platform_assignment/domain/repository/story_repository.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class StoryRepositoryImpl extends StoryRepository {
  final StoryRemoteDataSource _storyRemoteDataSource;

  StoryRepositoryImpl({
    StoryRemoteDataSource? storyRemoteDataSource,
  }) : _storyRemoteDataSource =
            storyRemoteDataSource ?? StoryRemoteDataSource();

  @override
  Future<bool> createStory(String title, String content) {
    return _storyRemoteDataSource.createStory(
      title,
      content,
    );
  }

  @override
  Future<bool> deleteStory(String objectId) {
    return _storyRemoteDataSource.deleteStory(
      objectId,
    );
  }

  @override
  Future<ParseObject?> getStoryById(String objectId) {
    return _storyRemoteDataSource.getStoryById(
      objectId,
    );
  }

  @override
  Future<List<ParseObject>> readStories() {
    return _storyRemoteDataSource.readStories();
  }

  @override
  Future<bool> updateStory(String objectId, String title, String content) {
    return _storyRemoteDataSource.updateStory(
      objectId,
      title,
      content,
    );
  }
}
