import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:text_checker/text_checker_method_channel.dart';

void main() {
  MethodChannelTextChecker platform = MethodChannelTextChecker();
  const MethodChannel channel = MethodChannel('text_checker');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  // test('getPlatformVersion', () async {
  //   expect(await platform.getPlatformVersion(), '42');
  // });
}
