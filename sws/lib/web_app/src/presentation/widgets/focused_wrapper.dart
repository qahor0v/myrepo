import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FocusedWrapper extends HookConsumerWidget {
  final void Function()? onTap;
  final Widget Function(bool focused) child;
  const FocusedWrapper({
    super.key,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, ref) {
    final focused = useState<bool>(false);
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: MouseRegion(
        onEnter: (val) {
          focused.value = true;
        },
        onExit: (val) {
          focused.value = false;
        },
        child: child(focused.value),
      ),
    );
  }
}
