import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../models/comment.dart';

/// The `CommentService` class fetches comments from a specified URL and handles potential errors during
/// the process.
class CommentService {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com/comments';

  Future<List<Comment>> fetchComments() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<Comment> comments =
            body.map((dynamic item) => Comment.fromJson(item)).toList();
        return comments;
      } else {
        throw Exception('Failed to load comments');
      }
    } catch (e) {
      log('Error fetching comments: $e');
      rethrow;
    }
  }
}
