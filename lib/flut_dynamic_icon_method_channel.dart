import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flut_dynamic_icon_platform_interface.dart';

/// An implementation of [FlutDynamicIconPlatform] that uses method channels.
class MethodChannelFlutDynamicIcon extends FlutDynamicIconPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flut_dynamic_icon');

  @override
  Future<void> changeAppIcon(
      {required String bundleId,
      required String defaultIcon,
      required String iconName,
      required List<String> iconNames}) async {
    dynamic params = {
      "bundleId": bundleId,
      "defaultIcon": defaultIcon,
      "iconName": iconName,
      "iconNames": iconNames,
    };
    await methodChannel.invokeMethod<String>('changeAppIcon', params);
  }
}
