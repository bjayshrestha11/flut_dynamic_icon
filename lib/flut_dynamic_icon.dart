import 'dart:io';

import 'package:flutter_dynamic_icon/flutter_dynamic_icon.dart';

import 'flut_dynamic_icon_platform_interface.dart';

class FlutDynamicIcon {
  Future<void> changeAppIcon({
    required String bundleId,
    required String defaultIcon,
    required String iconName,
    required List<String> iconNames,
    bool showAlert = false,
  }) async {
    if (Platform.isAndroid) {
      return FlutDynamicIconPlatform.instance.changeAppIcon(
        bundleId: bundleId,
        defaultIcon: defaultIcon,
        iconName: iconName,
        iconNames: iconNames,
      );
    } else {
      return await FlutterDynamicIcon.setAlternateIconName(iconName,
          showAlert: showAlert);
    }
  }
}
