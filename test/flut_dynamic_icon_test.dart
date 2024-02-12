import 'package:flutter_test/flutter_test.dart';
import 'package:flut_dynamic_icon/flut_dynamic_icon.dart';
import 'package:flut_dynamic_icon/flut_dynamic_icon_platform_interface.dart';
import 'package:flut_dynamic_icon/flut_dynamic_icon_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutDynamicIconPlatform
    with MockPlatformInterfaceMixin
    implements FlutDynamicIconPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutDynamicIconPlatform initialPlatform = FlutDynamicIconPlatform.instance;

  test('$MethodChannelFlutDynamicIcon is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutDynamicIcon>());
  });

  test('getPlatformVersion', () async {
    FlutDynamicIcon flutDynamicIconPlugin = FlutDynamicIcon();
    MockFlutDynamicIconPlatform fakePlatform = MockFlutDynamicIconPlatform();
    FlutDynamicIconPlatform.instance = fakePlatform;

    expect(await flutDynamicIconPlugin.getPlatformVersion(), '42');
  });
}
