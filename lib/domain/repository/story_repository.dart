import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

abstract class StoryRepository {
  Future<List<ParseObject>> readStories();
  Future<bool> createStory(String title, String content);
  Future<bool> updateStory(String objectId, String title, String content);
  Future<bool> deleteStory(String objectId);
  Future<ParseObject?> getStoryById(String objectId);
}