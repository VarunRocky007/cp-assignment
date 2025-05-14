import 'package:auto_route/auto_route.dart';
import 'package:cross_platform_assignment/domain/usecase/delete_story_use_case.dart';
import 'package:cross_platform_assignment/domain/usecase/update_story_use_case.dart';
import 'package:cross_platform_assignment/navigation/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

@RoutePage()
class ReadStoryScreen extends StatefulWidget {
  final ParseObject story;
  const ReadStoryScreen({super.key, required this.story});

  @override
  State<ReadStoryScreen> createState() => _ReadStoryScreenState();
}

class _ReadStoryScreenState extends State<ReadStoryScreen> {

  late DeleteStoryUseCase _deleteStoryUseCase;
  late UpdateStoryUseCase _updateStoryUseCase;
  bool _isLoading = false;
  bool _isError = false;
  String _errorMessage = "";
  bool _isEditMode = false;
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  late ParseObject _story;
  late String _storyId;
  late String _storyTitle;
  late String _storyContent;

  @override
  void initState() {
    _deleteStoryUseCase = DeleteStoryUseCase();
    _updateStoryUseCase = UpdateStoryUseCase();
    _story = widget.story;
    _storyId = _story.objectId!;
    _storyTitle = _story.get<String>('title')!;
    _storyContent = _story.get<String>('content')!;
    _titleController = TextEditingController(text: _storyTitle);
    _contentController = TextEditingController(text: _storyContent);

    super.initState();
  }

  void _deleteStory() async {
    setState(() {
      _isLoading = true;
      _isError = false;
      _errorMessage = "";
    });
    try {
      final response = await _deleteStoryUseCase.execute(objectId:_storyId);
      if (response) {
        setState(() {
          _isLoading = false;
        });
        navigateToHome();
      } else {
        setState(() {
          _isLoading = false;
          _isError = true;
          _errorMessage = "Failed to delete story";
        });
      }
    } catch(e) {
      setState(() {
        _isLoading = false;
        _isError = true;
        _errorMessage = "Failed to delete story: ${e.toString()}";
      });
    }
  }

  void _updateStory() async {
    setState(() {
      _isLoading = true;
      _isError = false;
      _errorMessage = "";
    });
    try {
      final response = await _updateStoryUseCase.execute(
        _storyId,
        _titleController.text,
        _contentController.text,
      );
      if (response) {
        setState(() {
          _isLoading = false;
        });
        navigateToHome();
      } else {
        setState(() {
          _isLoading = false;
          _isError = true;
          _errorMessage = "Failed to update story";
        });
      }
    } catch(e) {
      setState(() {
        _isLoading = false;
        _isError = true;
        _errorMessage = "Failed to update story: ${e.toString()}";
      });
    }
  }

  void navigateToHome() {
    context.router.replaceAll([
      const HomeRoute(),
    ]);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Read Story"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              _deleteStory();
            },
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              setState(() {
                _isEditMode = !_isEditMode;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              readOnly: !_isEditMode,
              decoration: InputDecoration(
                labelText: 'Title',
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _contentController,
              readOnly: !_isEditMode,
              maxLines: 10,
              decoration: InputDecoration(
                labelText: 'Content',
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            if (_isEditMode)
              ElevatedButton(
                onPressed: () {
                  _updateStory();
                },
                child: const Text('Update Story'),
              ),
          ],
        ),
      ),
    );
  }
}
