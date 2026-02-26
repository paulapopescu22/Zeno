import UIKit
import Firebase
import FirebaseAuth

@main
class AppDelegate: UIResponder, UIApplicationDelegate{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
     
        FirebaseApp.configure()
       
        return true
    }
    
   
    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
        # Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'MW' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MW
pod 'Firebase'
pod 'Firebase/Auth'
pod 'Firebase/Analytics'
pod 'Firebase/Crashlytics'
pod 'SideMenu'
pod 'Firebase/Core'
pod 'Firebase/Database'
pod 'Firebase/Storage'
pod 'MessageKit'
pod 'FirebaseUI/Storage'
pod 'Firebase/Firestore'
end
