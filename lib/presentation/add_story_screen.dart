import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cross_platform_assignment/domain/usecase/create_story_use_case.dart';
import 'package:cross_platform_assignment/navigation/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AddStoryScreen extends StatefulWidget {
  const AddStoryScreen({super.key});

  @override
  State<AddStoryScreen> createState() => _AddStoryScreenState();
}

class _AddStoryScreenState extends State<AddStoryScreen> {
  bool _isLoading = false;
  bool _isError = false;
  String _errorMessage = "";
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  late CreateStoryUseCase _createStoryUseCase;

  @override
  void initState() {
    _createStoryUseCase = CreateStoryUseCase();
    _titleController = TextEditingController();
    _contentController = TextEditingController();
    super.initState();
  }

  void _createStory() async {
    setState(() {
      _isLoading = true;
      _isError = false;
      _errorMessage = "";
    });
    try {
      final response = await _createStoryUseCase.execute(
        title: _titleController.text,
        content: _contentController.text,
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
          _errorMessage = "Failed to create story";
        });
      }
    } catch(e) {
      setState(() {
        _isLoading = false;
        _isError = true;
        _errorMessage = "Failed to create story: ${e.toString()}";
      });
    }
  }

  void navigateToHome() {
    context.router.pushAndPopUntil(
      const HomeRoute(), predicate: (Route<dynamic> route) => false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Story"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: const OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: _contentController,
              maxLines: 25,
              decoration: InputDecoration(
                labelText: 'Content',
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _createStory,
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text("Create Story"),
            ),
            if (_isError)
              Text(
                _errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
