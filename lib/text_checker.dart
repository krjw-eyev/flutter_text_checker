import 'text_checker_platform_interface.dart';

class TextChecker {
  // func rangeOfMisspelledWord(in: String, range: NSRange, startingAt: Int, wrap: Bool, language: String) -> NSRange

  // func guesses(forWordRange: NSRange, in: String, language: String?) -> [String]?
  Future<List<String>> guesses(String text, int startIndex, int endIndex, {String? language}) {
    return TextCheckerPlatform.instance.guesses(text, startIndex, endIndex, language: language);
  }

  // func completions(forPartialWordRange: NSRange, in: String, language: String?) -> [String]?
  Future<List<String>> completions(String text, int startIndex, int endIndex, {String? language}) {
    return TextCheckerPlatform.instance.guesses(text, startIndex, endIndex, language: language);
  }

  Future<String> getLanguage(String text) {
    return TextCheckerPlatform.instance.getLanguage(text);
  }
}
