import UIKit
import Flutter
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

      if let defines = Bundle.main.object(forInfoDictionaryKey: "DART_DEFINES") as? String {
                let decoded = defines
                    .components(separatedBy: ",")
                    .compactMap { $0.removingPercentEncoding } // decode percent encoding
                    .compactMap { Data(base64Encoded: $0) }    // decode base64
                    .compactMap { String(data: $0, encoding: .utf8) } // to string
                    .map { $0.components(separatedBy: "=") }   // split to key-value
                    .reduce(into: [String: String]()) { dict, pair in
                        if pair.count == 2 {
                            dict[pair[0]] = pair[1]
                        }
                    }
                
                if let apiKey = decoded["GOOGLE_MAPS_API_KEY"] {
                    GMSServices.provideAPIKey(apiKey)
                    print("✅ Google Maps API Key provided.")
                } else {
                    print("❌ mapsApiKey not found in DART_DEFINES.")
                }
            }

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
