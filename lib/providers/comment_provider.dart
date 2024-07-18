import 'package:flutter/material.dart';
import '../models/comment.dart';
import '../services/comment_service.dart';

/// The `CommentProvider` class manages comments data and loading state using a `CommentService` in
/// Dart.
class CommentProvider with ChangeNotifier {
  final CommentService _commentService = CommentService();
  List<Comment> _comments = [];
  bool _loading = false;

  List<Comment> get comments => _comments;
  bool get loading => _loading;

  CommentProvider() {
    fetchComments();
  }

  Future<void> fetchComments() async {
    _loading = true;
    notifyListeners();

    try {
      _comments = await _commentService.fetchComments();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
