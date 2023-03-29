import 'package:flutter_test/flutter_test.dart';
import 'package:text_checker/text_checker.dart';
import 'package:text_checker/text_checker_platform_interface.dart';
import 'package:text_checker/text_checker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTextCheckerPlatform with MockPlatformInterfaceMixin implements TextCheckerPlatform {
  @override
  Future<List<String>> guesses(String text, int startIndex, int endIndex, {String? language}) {
    // TODO: implement guesses
    throw UnimplementedError();
  }

  @override
  Future<List<String>> completions(String text, int startIndex, int endIndex, {String? language}) {
    // TODO: implement completions
    throw UnimplementedError();
  }

  @override
  Future<String> getLanguage(String text) {
    // TODO: implement getLanguage
    throw UnimplementedError();
  }
  // @override
  // Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final TextCheckerPlatform initialPlatform = TextCheckerPlatform.instance;

  test('$MethodChannelTextChecker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTextChecker>());
  });

  test('getPlatformVersion', () async {
    TextChecker textCheckerPlugin = TextChecker();
    MockTextCheckerPlatform fakePlatform = MockTextCheckerPlatform();
    TextCheckerPlatform.instance = fakePlatform;

    // expect(await textCheckerPlugin.getPlatformVersion(), '42');
  });
}
