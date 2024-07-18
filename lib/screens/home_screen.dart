import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_comments_assignment/widgets/custom_app_bar.dart';
import 'package:user_comments_assignment/widgets/home/comment_item.dart';
import '../providers/comment_provider.dart';

/// The `HomeScreen` class in Dart represents a screen displaying comments fetched from a
/// `CommentProvider` with a custom app bar and a list view of comment items.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Comments'),
      body: Consumer<CommentProvider>(
        builder: (context, provider, child) {
          if (provider.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.comments.isEmpty) {
            return const Center(child: Text('No comments available'));
          }

          return ListView.builder(
            itemCount: provider.comments.length,
            itemBuilder: (context, index) {
              final comment = provider.comments[index];
              return CommentItem(
                avatarLetter: comment.name[0],
                name: comment.name,
                email: comment.email,
                comment: comment.body,
              );
            },
          );
        },
      ),
    );
  }
}
