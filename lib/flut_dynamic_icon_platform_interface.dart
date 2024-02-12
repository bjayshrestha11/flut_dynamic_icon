import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flut_dynamic_icon_method_channel.dart';

abstract class FlutDynamicIconPlatform extends PlatformInterface {
  /// Constructs a FlutDynamicIconPlatform.
  FlutDynamicIconPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutDynamicIconPlatform _instance = MethodChannelFlutDynamicIcon();

  /// The default instance of [FlutDynamicIconPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutDynamicIcon].
  static FlutDynamicIconPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutDynamicIconPlatform] when
  /// they register themselves.
  static set instance(FlutDynamicIconPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
