import 'dart:developer';
import 'package:flut_dynamic_icon/flut_dynamic_icon.dart';
import 'package:flut_dynamic_icon_example/app_icons.dart';

class DynamicAppIconUtils {
  static Future<void> changeAppIcon(String iconName) async {
    try {
      FlutDynamicIcon flutDynamicIcon = FlutDynamicIcon();
      await flutDynamicIcon.changeAppIcon(
        bundleId: "np.com.bjayshrestha.flut_dynamic_icon_example",
        iconName: iconName,
        defaultIcon: AppIcons.tetoIcon,
        iconNames: AppIcons.appIconList,
      );
      log("App icon changed successfully: $iconName", name: "ChangeIcon");
    } catch (e) {
      log(e.toString(), name: "ChangeIcon");
    }
  }
}
