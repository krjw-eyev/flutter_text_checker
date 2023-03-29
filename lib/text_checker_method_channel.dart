import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'text_checker_platform_interface.dart';

/// An implementation of [TextCheckerPlatform] that uses method channels.
class MethodChannelTextChecker extends TextCheckerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('text_checker');

  @override
  Future<List<String>> guesses(String text, int startIndex, int endIndex, {String? language}) async {
    final results = await methodChannel.invokeMethod('guesses', {'text': text, 'startIndex': startIndex, 'endIndex': endIndex, 'language': language}) ?? [];
    List<String> res = [];
    for (final result in results) {
      res.add(result as String);
    }
    return res;
  }

  @override
  Future<List<String>> completions(String text, int startIndex, int endIndex, {String? language}) async {
    final results = await methodChannel.invokeMethod('completions', {'text': text, 'startIndex': startIndex, 'endIndex': endIndex, 'language': language}) ?? [];
    List<String> res = [];
    for (final result in results) {
      res.add(result as String);
    }
    return res;
  }

  @override
  Future<String> getLanguage(String text) async {
    return await methodChannel.invokeMethod('completions', {'text': text}) ?? [];
  }
}
