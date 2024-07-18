import 'package:flutter/material.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:user_comments_assignment/widgets/home/info_row.dart';

/// The UserDetails class in Dart is a StatefulWidget that displays user details including name and
/// email, with the email being potentially masked based on a remote configuration.
class UserDetails extends StatefulWidget {
  final String name;
  final String email;

  const UserDetails({
    required this.name,
    required this.email,
    super.key,
  });

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  late bool shouldHideEmail; // Initialize as late, since it's set in initState

  @override
  void initState() {
    super.initState();
    shouldHideEmail = true; // Initial value until fetched from remote config
    _fetchRemoteConfig();
  }

  Future<void> _fetchRemoteConfig() async {
    try {
      final remoteConfig = FirebaseRemoteConfig.instance;
      await remoteConfig.fetchAndActivate();
      setState(() {
        shouldHideEmail = remoteConfig.getBool('hideEmail');
      });

      remoteConfig.onConfigUpdated.listen((event) {
        setState(() {
          shouldHideEmail = remoteConfig.getBool('hideEmail');
        });
      });
    } catch (e) {}
  }

  String getMaskedEmail(String email, bool shouldHideEmail) {
    if (!shouldHideEmail) return email;

    final atIndex = email.indexOf('@');
    if (atIndex == -1) return email;

    final localPart = email.substring(0, atIndex);
    final domainPart = email.substring(atIndex);

    final maskedLocalPart =
        '${localPart.substring(0, 3)}${'*' * (localPart.length - 3)}'; // Always mask local part

    return '$maskedLocalPart$domainPart';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InfoRow(label: 'Name:', value: widget.name),
        InfoRow(
          label: 'Email:',
          value: getMaskedEmail(widget.email, shouldHideEmail),
        ),
      ],
    );
  }
}
