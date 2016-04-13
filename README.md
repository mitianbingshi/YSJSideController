# YSJSideController
swift侧边菜单初始化版本0.1

借鉴OC版本的侧边滑动写的swift版本的侧边滑动，耦合性比较低
1.建立2个空的viewcontroller（mainViewController和leftViewController）
2.将YSJSideViewController导入到项目
3.在Appdelegate里面初始化
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    internal let leftSide = YSJSideViewController()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: false);
        self.window?.rootViewController = leftSide
        return true
    }


