import 'package:cross_platform_assignment/app_constants.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class StoryRemoteDataSource {
  Future<List<ParseObject>> readStories() async {
    final QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject('Story'))
          ..whereEqualTo("author", AppConstants.loggedInUser?.objectId ?? "")
          ..orderByDescending('createdAt');

    final ParseResponse apiResponse = await queryBuilder.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      if (apiResponse.success) {
        if (apiResponse.results == null) {
          return [];
        }
      }
      throw Exception('Failed to load stories');
    }
  }

  Future<bool> createStory(String title, String content) async {
    if (AppConstants.loggedInUser == null) {
      return false;
    }
    final ParseObject story = ParseObject('Story')
      ..set('title', title)
      ..set('content', content)
      ..set('author', AppConstants.loggedInUser?.objectId ?? "");

    final ParseResponse apiResponse = await story.save();

    return apiResponse.success;
  }

  Future<bool> updateStory(
      String objectId, String title, String content) async {
    final ParseObject story = ParseObject('Story')
      ..objectId = objectId
      ..set('title', title)
      ..set('content', content);

    final ParseResponse apiResponse = await story.save();

    return apiResponse.success;
  }

  Future<bool> deleteStory(String objectId) async {
    final ParseObject story = ParseObject('Story')..objectId = objectId;

    final ParseResponse apiResponse = await story.delete();

    return apiResponse.success;
  }

  Future<ParseObject?> getStoryById(String objectId) async {
    final QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject('Story'))
          ..whereEqualTo('objectId', objectId);

    final ParseResponse apiResponse = await queryBuilder.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results?.first as ParseObject;
    } else {
      return null;
    }
  }
}
