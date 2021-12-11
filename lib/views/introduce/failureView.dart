import 'package:flutter/material.dart';

class FailureVier extends StatelessWidget {
  final String title, message;
  final VoidCallback onPressed;
  FailureVier(
      {required this.title, required this.message, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              const Icon(
                Icons.error,
                color: Colors.red,
                size: 100,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                message,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
