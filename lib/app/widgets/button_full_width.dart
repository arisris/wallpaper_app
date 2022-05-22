import 'package:flutter/material.dart';

class ButtonFullWidth extends StatelessWidget {
  final Widget child;
  final Function? onPressed;
  const ButtonFullWidth({Key? key, required this.child, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: double.infinity,
      ),
      child: ElevatedButton(
        onPressed: () => {
          if (onPressed != null) onPressed!(),
        },
        child: child,
      ),
    );
  }
}
