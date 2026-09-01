import 'package:flutter/cupertino.dart';

class Customwidget extends StatelessWidget{

  final String text;
  final Widget? icon;
  final VoidCallback? onPressed;

  const Customwidget({
    super.key,
    required this.text,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          color: const Color(0xFFFFBB3B),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF282A28)
              ),
            ),
            if (icon != null)
              const SizedBox(width: 8),

            if (icon != null)
              icon!,
          ],
        ),
      ),
    );
  }
}