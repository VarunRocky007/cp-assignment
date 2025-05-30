import 'package:auto_route/auto_route.dart';
import 'package:cross_platform_assignment/domain/usecase/get_stories_use_case.dart';
import 'package:cross_platform_assignment/domain/usecase/logout_use_case.dart';
import 'package:cross_platform_assignment/navigation/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GetStoriesUseCase _getStoriesUseCase;
  late LogoutUseCase _logoutUseCase;
  bool _isLoading = false;
  List<ParseObject> _stories = [];
  bool _isError = false;
  String _errorMessage = "";

  @override
  void initState() {
    _getStoriesUseCase = GetStoriesUseCase();
    _logoutUseCase = LogoutUseCase();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchStories();
    });
    super.initState();
  }

  void _fetchStories() async {
    setState(() {
      _isLoading = true;
      _isError = false;
      _stories = [];
      _errorMessage = "";
    });
    try {
      final response = await _getStoriesUseCase.execute();
      if (response.isNotEmpty) {
        setState(() {
          _stories = response;
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _isError = true;
        _stories = [];
        _errorMessage = "Failed to fetch stories: ${e.toString()}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stories"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              context.router.push(AddStoryRoute());
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              _logoutUseCase.execute();
              context.router.replaceAll([const LoginRoute()]);
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _isError
              ? Center(
                  child: Text(
                    _errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                )
              : _stories.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'No stories available',
                            style: TextStyle(fontSize: 20),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                _fetchStories();
                              },
                              child: Text('Refresh')),
                          ElevatedButton(
                              onPressed: () {
                                context.router.push(AddStoryRoute());
                              },
                              child: Text('Add a Story')),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: _stories.length,
                      itemBuilder: (context, index) {
                        final story = _stories[index];
                        return InkWell(
                          onTap: () {
                            context.router.push(
                              ReadStoryRoute(
                                story: story,
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Title: ${story.get<String>('title') ?? ''}",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                        "createdOn: ${story.get<DateTime>('createdAt')?.toLocal().toString() ?? ''}"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
    );
  }
}
