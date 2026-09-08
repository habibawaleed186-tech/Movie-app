import 'package:flutter/cupertino.dart';

class Customwidget extends StatelessWidget {
  final String text;
  final Widget? icon;
  final VoidCallback? onPressed;
  final Color? bgColor;
  final Color? textColor;

  const Customwidget({
    super.key,
    required this.text,
    this.icon,
    this.onPressed,
    this.bgColor = const Color(0xFFFFBB3B),
    this.textColor = const Color(0xFF121312),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // لتنفيذ الأكشن عند الضغط
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: textColor,
              ),
            ),
            if (icon != null) const SizedBox(width: 8),
            if (icon != null) icon!,
          ],
        ),
      ),
    );
  }
}