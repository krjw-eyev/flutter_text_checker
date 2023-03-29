import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'text_checker_method_channel.dart';

abstract class TextCheckerPlatform extends PlatformInterface {
  /// Constructs a TextCheckerPlatform.
  TextCheckerPlatform() : super(token: _token);

  static final Object _token = Object();

  static TextCheckerPlatform _instance = MethodChannelTextChecker();

  /// The default instance of [TextCheckerPlatform] to use.
  ///
  /// Defaults to [MethodChannelTextChecker].
  static TextCheckerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TextCheckerPlatform] when
  /// they register themselves.
  static set instance(TextCheckerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<List<String>> guesses(String text, int startIndex, int endIndex, {String? language});
  Future<List<String>> completions(String text, int startIndex, int endIndex, {String? language});
  Future<String> getLanguage(String text);
}
