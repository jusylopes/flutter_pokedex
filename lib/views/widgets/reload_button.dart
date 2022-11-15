import 'package:flutter/material.dart';

class ReloadButton extends StatelessWidget {
  const ReloadButton({
    Key? key,
    required this.maxWidth,
    required this.onPressed,
  }) : super(key: key);

  final double maxWidth;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: maxWidth / 6,
      onPressed: onPressed,
      color: Theme.of(context).colorScheme.primary,
      splashColor: Theme.of(context).colorScheme.background,
      icon: const Icon(
        Icons.refresh,
      ),
    );
  }
}
