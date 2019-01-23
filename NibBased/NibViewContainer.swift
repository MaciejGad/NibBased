import Foundation
import UIKit

open class NibViewContainer<View>:UIView where View:LoadFromNib, View:UIView {
    
    public let view:View?
    
    override open var intrinsicContentSize: CGSize {
        guard let view = view else {
            return CGSize.zero
        }
        return view.intrinsicContentSize
    }
    
    public override init(frame: CGRect) {
        view = NibViewContainer.loadView()
        super.init(frame: frame)
        setupView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        view = NibViewContainer.loadView()
        super.init(coder: aDecoder)
        setupView()
    }
    
    public static func loadView() -> View? {
        return try? View.loadFromNib()
    }
    
    public func setupView() {
        guard let view = view else {
            return
        }
        view.frame = CGRect(origin: CGPoint.zero, size: frame.size)
        addSubview(view)
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}


public class EmptyView:UIView, LoadFromNib {}
