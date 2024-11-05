import 'package:flutter/material.dart';

class SubjectTile extends StatelessWidget {
  final String subject;
  final Widget screen;

  const SubjectTile({super.key, required this.subject, required this.screen});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(subject),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }
}
