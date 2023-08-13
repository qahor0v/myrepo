import 'package:flutter/material.dart';
import 'package:sws/web_app/src/presentation/widgets/helpers/back_wrapper.dart';
import 'package:sws/web_app/src/utils/extensions/get_device_type.dart';

class SizerWrapper extends StatelessWidget {
  final Widget child;
  const SizerWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    DeviceType type = getDeviceType(context);
    bool isDesktop = (type == DeviceType.DESKTOP);
    bool isTablet = (type == DeviceType.TABLET);
    if (isDesktop || isTablet) {
      return WebBackWrapper(
        child: SizedBox(
          width:
              isDesktop || isTablet ? 900 : MediaQuery.of(context).size.width,
          child: child,
        ),
      );
    } else {
      return child;
    }
  }
}
