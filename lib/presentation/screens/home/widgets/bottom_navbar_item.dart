import 'package:e_comm_app/utils/common_colors.dart';
import 'package:e_comm_app/utils/extensions/builtcontext_extension.dart';
import 'package:flutter/material.dart';

class BottomNavbarItem extends StatelessWidget {
  const BottomNavbarItem({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.callback,
  });
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    var color = isSelected ? blackColor : greyColor;
    return GestureDetector(
      onTap: () {
        callback.call();
      },
      child: SizedBox(
        width: context.screenWidth / 4,
        child: Column(
          children: [
            const SizedBox(height: 6),
            Icon(
              icon,
              color: color,
            ),
            Text(
              title,
              style: TextStyle(color: color),
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
