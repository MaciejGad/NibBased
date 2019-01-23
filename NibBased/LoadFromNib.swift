import Foundation

public protocol LoadFromNib:NibBase {
    static func loadFromNib(name:String) throws -> Self
    static func loadFromNib() throws -> Self
}

extension LoadFromNib {
    
    public static func loadFromNib() throws -> Self {
        return try loadFromNib(name: className())
    }
    
    public static func loadFromNib(name:String) throws -> Self {
        let nib = try self.nib(name:name)
        let potentialViews = nib.instantiate(withOwner: nil, options: nil)
        for potentialView in potentialViews {
            if let view  = potentialView as? Self {
                return view
            }
        }
        throw NibBaseError.noViewInNib
    }
}
