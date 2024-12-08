import 'package:e_comm_app/utils/common_colors.dart';
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
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(orangeColor),
        foregroundColor: WidgetStatePropertyAll(whiteColor),
      ),
      onPressed: () {
        callback.call();
      },
      child: Text(
        title,
      ),
    );
  }
}
