import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.callback,
    required this.title,
  });
  final VoidCallback callback;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        callback.call();
      },
      child: Text(
        title,
      ),
    );
  }
}
