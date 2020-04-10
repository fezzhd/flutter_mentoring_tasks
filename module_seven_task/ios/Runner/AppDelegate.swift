import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey(loadKey())
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
  private func loadKey() -> String {
    let path = Bundle.main.path(forResource: "map_key", ofType: "txt")!
    let text = try! String(contentsOfFile: path, encoding: String.Encoding.utf8)
    return text
  }
}
