
import 'flut_dynamic_icon_platform_interface.dart';

class FlutDynamicIcon {
  Future<String?> getPlatformVersion() {
    return FlutDynamicIconPlatform.instance.getPlatformVersion();
  }
}
