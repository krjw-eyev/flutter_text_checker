import Flutter
import UIKit
import NaturalLanguage

@available(iOS 12.0, *)
public class SwiftTextCheckerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "text_checker", binaryMessenger: registrar.messenger())
    let instance = SwiftTextCheckerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      let arguments = call.arguments as? Dictionary<String, Any>
      if call.method == "guesses" {
          
          print("Guesses in swift \(arguments?["text"] as! String) \(arguments?["language"] as! String)")
          
          let checker = UITextChecker()
          let str = arguments?["text"] as! String
          let startIndex = arguments?["startIndex"] as! Int
          let endIndex = arguments?["endIndex"] as! Int
          
          result(checker.guesses(forWordRange: NSRange(location: startIndex, length: endIndex - startIndex), in: str, language: arguments?["language"] as! String))
      } else if call.method == "completions" {
          
          print("Completions in swift \(arguments?["text"] as! String) \(arguments?["language"] as! String)")
          var language: String? = arguments?["language"] as? String
          if language == nil || language == "" {
              let languageRecognizer = NLLanguageRecognizer()
              languageRecognizer.processString(arguments?["text"] as! String)
              language = languageRecognizer.dominantLanguage?.rawValue
          }
          
          let checker = UITextChecker()
          let str = arguments?["text"] as! String
          let startIndex = arguments?["startIndex"] as! Int
          let endIndex = arguments?["endIndex"] as! Int
          
          result(checker.completions(forPartialWordRange: NSRange(location: startIndex, length: endIndex - startIndex), in: str, language: arguments?["language"] as! String))
      } else if call.method == "getLanguage" {
          let languageRecognizer = NLLanguageRecognizer()
          languageRecognizer.processString(arguments?["text"] as! String)
          result(languageRecognizer.dominantLanguage?.rawValue)
      }
  }
}
