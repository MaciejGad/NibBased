import Foundation
import UIKit

public protocol CanRegister {
    func register(nib: UINib?, forCellReuseIdentifier identifier: String)
    func register(cellClass: AnyClass?, forCellReuseIdentifier identifier: String)
}


public protocol Cell:ClassName {
    associatedtype ViewType:CanRegister
    static func identifier() -> String
    static func register(in view:ViewType)
    static func registerNib(in view:ViewType) throws
    static func registerNib(in view:ViewType, nibName:String) throws
    static func registerNib(in view:ViewType, nibName:String, identifier:String) throws
    func asCell() -> Self
}

extension Cell {
    public static func register(in view:ViewType) {
        let id = identifier()
        view.register(cellClass:self, forCellReuseIdentifier: id)
    }
    
    public static func registerNib(in view:ViewType) throws {
        try registerNib(in: view, nibName:className())
    }
    
    public static func registerNib(in view:ViewType, nibName:String) throws {
        try registerNib(in: view, nibName: nibName, identifier: identifier())
    }
    
    public static func registerNib(in view:ViewType, nibName:String, identifier:String) throws {
        let bundle = Bundle(for:self)
        guard bundle.path(forResource: nibName, ofType: "nib") != nil else {
            throw NibBaseError.noNibFile
        }
        let nib = UINib(nibName: nibName, bundle: bundle)
        view.register(nib: nib, forCellReuseIdentifier: identifier)
    }
    
    public func asCell() -> Self {
        return self
    }
    
    public static func identifier() -> String {
        return "\(self)"
    }
    
}

extension UITableViewCell: Cell {
    
    public typealias ViewType = UITableView
    
    public static func asCellClass() -> AnyClass {
        return self
    }
}

extension UICollectionViewCell: Cell {
    public typealias ViewType = UICollectionView
    
    public static func asCellClass() -> AnyClass {
        return self
    }
    
}

extension UITableView:CanRegister {
    public func register(nib: UINib?, forCellReuseIdentifier identifier: String) {
        self.register(nib, forCellReuseIdentifier: identifier)
    }
    public func register(cellClass: AnyClass?, forCellReuseIdentifier identifier: String) {
        self.register(cellClass, forCellReuseIdentifier: identifier)
    }
    
}

extension UICollectionView:CanRegister {
    public func register(nib: UINib?, forCellReuseIdentifier identifier: String) {
        self.register(nib, forCellWithReuseIdentifier: identifier)
    }
    
    public func register(cellClass: AnyClass?, forCellReuseIdentifier identifier: String) {
        self.register(cellClass, forCellWithReuseIdentifier: identifier)
    }
}
