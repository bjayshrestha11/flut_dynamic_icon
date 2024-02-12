import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flut_dynamic_icon_platform_interface.dart';

/// An implementation of [FlutDynamicIconPlatform] that uses method channels.
class MethodChannelFlutDynamicIcon extends FlutDynamicIconPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flut_dynamic_icon');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
