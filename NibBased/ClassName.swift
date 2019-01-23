import Foundation

public protocol ClassName:class  {
    static func className() -> String
}


extension ClassName {
    public static func className() -> String {
        let name = typeName(self)
        let classNameComponents = name.components(separatedBy: ".")
        guard let className = classNameComponents.last else {
            return name
        }
        return className
    }
}

private func typeName(_ some: Any) -> String {
    return (some is Any.Type) ? "\(some)" : "\(type(of: some))"
}
