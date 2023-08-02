import 'package:flutter/widgets.dart';

class Shadowed extends StatelessWidget {
  const Shadowed({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 10,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: child,
    );
  }
}
