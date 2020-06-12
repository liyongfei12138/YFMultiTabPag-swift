//
//  YFCommonTabScrollView.swift
//

import Foundation
import UIKit
class YFCommonTabScrollView: UIScrollView, UIGestureRecognizerDelegate {

    public var scrollViewWhites: Set<UIScrollView>?
    
    override func touchesShouldCancel(in view: UIView) -> Bool {
        return true
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        guard let scrollViewWhites = scrollViewWhites else { return true }
        for item in scrollViewWhites {
            if let view = otherGestureRecognizer.view, view == item {
                return true
            }
        }
        return true
    }
}
