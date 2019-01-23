import Foundation

public protocol NibBase:ClassName {
    static func nib() throws -> UINib
    static func nib(name:String) throws -> UINib
}


extension NibBase {
    public static func nib() throws -> UINib {
        return try nib(name: className())
    }
    
    
    public static func nib(name:String) throws -> UINib {
        let bundle = Bundle(for:self)
        guard bundle.path(forResource: name, ofType: "nib") != nil else {
            throw NibBaseError.noNibFile
        }
        return UINib(nibName: name, bundle: bundle)
    }
}
