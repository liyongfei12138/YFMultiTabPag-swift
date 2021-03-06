//
//  YFMultiTabChildPageViewController.swift
//

import Foundation
import UIKit
protocol YFMultiTabChildPageDelegate: NSObjectProtocol {
    func commonTabChildViewController(_ viewController: YFMultiTabChildPageViewController, scrollViewDidScroll scrollView: UIScrollView)
}

class YFMultiTabChildPageViewController: UIViewController {

    // 主要用来控制mainScrollView在上下滑动的时候在没到阈值的时候让child view相对静止
    public var offsetY: CGFloat = 0.0
    public var isCanScroll: Bool = false
    public weak var scrollDelegate: YFMultiTabChildPageDelegate?
    public func getScrollView () -> UIScrollView? {
        return nil
    }
}
