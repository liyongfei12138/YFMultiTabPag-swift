
import Foundation
import UIKit
extension String {
    
    func strWidth(font: UIFont, size: CGSize) -> CGFloat {
        let rect = NSString(string: self).boundingRect(with: CGSize(width: size.width, height: size.height), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(rect.width)
    }
}
