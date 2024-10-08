import UIKit
import Flutter
import background_locator_2

@main
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)

        // Set the plugin registrant callback
        BackgroundLocatorPlugin.setPluginRegistrantCallback { registry in
            // Safely unwrap the registrar for the background locator plugin
            if let registrar = registry.registrar(forPlugin: "background_locator_2") {
                BackgroundLocatorPlugin.register(with: registrar)
            }
            // Register any other plugins as needed
            GeneratedPluginRegistrant.register(with: registry)
        }

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
