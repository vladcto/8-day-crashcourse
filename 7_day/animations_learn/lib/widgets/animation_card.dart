import 'package:flutter/material.dart';

class AnimationCard extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;

  const AnimationCard({super.key, this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 600,
        height: 400,
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Expanded(child: child),
                if (onPressed != null)
                  ElevatedButton(
                    onPressed: onPressed,
                    child: const Padding(padding: EdgeInsets.all(8)),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
