import Foundation
import UIKit

open class NibBaseViewController: UIViewController, IsNibBaseViewController, ClassName {
    
    public static weak var analyticsLogger:AnalyticsScreenLogger? = nil
    
    public required init() {
        let classType = type(of: self)
        let className = classType.className()
        let bundle = Bundle(for:classType)
        guard bundle.path(forResource: className, ofType: "nib") != nil else {
            fatalError("No nib file for \(className)")
        }
        super.init(nibName:className, bundle: bundle)
        edgesForExtendedLayout = []
    }
    
    open var isNavigationBarHidden:Bool? {
        return nil
    }
    
    open var statusBarLightContent:Bool {
        return true
    }
    
    open var screenName:String {
        let classNameComponents = NSStringFromClass(type(of: self)).components(separatedBy: ".")
        guard let className = classNameComponents.last else {
            return ""
        }
        return className
    }
    
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        if statusBarLightContent {
            return .lightContent
        } else {
            return .default
        }
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        setupStatusBarStyle()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logScreenOpen()
    }
    
    private func setupNavigationBar() {
        guard let isNavigationBarHidden = isNavigationBarHidden else {
            return
        }
        navigationController?.setNavigationBarHidden(isNavigationBarHidden, animated: true)
    }

    private func setupStatusBarStyle() {
        if statusBarLightContent {
            UIApplication.shared.statusBarStyle = .lightContent
        } else {
            UIApplication.shared.statusBarStyle = .default
        }
        setNeedsStatusBarAppearanceUpdate()
    }
    
    private func logScreenOpen() {
        NibBaseViewController.analyticsLogger?.log(screenName: screenName)
    }
    
    @available(*, unavailable, message: "don't use sotryboard! use nib and init()")
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NibBaseViewController: UIPopoverPresentationControllerDelegate {
    open func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}

public protocol IsNibBaseViewController:IsViewController {}

public protocol IsViewController:class {
    init()
    func asViewController() -> UIViewController
}

extension UIViewController: IsViewController {
    public func asViewController() -> UIViewController {
        return self
    }
    
}

public enum NibBaseError:String, Error {
    case badClassName
    case noNibFile
    case noStoryboard
    case noViewInNib
}
