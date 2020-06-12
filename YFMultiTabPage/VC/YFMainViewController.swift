//
//  YFMainViewController.swift
//  YFMultiTabPage
//
//  Created by liyongfi on 2020/6/11.
//  Copyright © 2020 liyongfi. All rights reserved.
//

import UIKit

class YFMainViewController: UIViewController {
    
    struct Constants {
        static let titleBarHeight: CGFloat = 88.0
        static let tabViewHeight: CGFloat = 40.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configViews()
        
    }
    
    private func configViews() {
        self.view.addSubview(titleBar)
        self.addChild(multiTabPageVC)
        self.view.addSubview(multiTabPageVC.view)
        
        titleBar.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self.view)
            make.height.equalTo(Constants.titleBarHeight)
        }

        
        self.view.bringSubviewToFront(titleBar)
    }
    
    
    private lazy var tabView: YFMultipleTabView = {
        let tabConfig = YFMultipleTabViewConfig()
        let tabView = YFMultipleTabView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: Constants.tabViewHeight), titles: ["类别1", "类别2", "类别3"], config: tabConfig)
        tabView.delegate = self
        return tabView
    }()
    
    private lazy var headerView: YFCollectionHeaderView = {
        let headerView = YFCollectionHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300.0))
        return headerView
    }()
    
    // 多tab控制器
    private lazy var multiTabPageVC: YFMultiTabPageViewController = {
        let multiTabPageVC = YFMultiTabPageViewController(tabCount: 3, headerView: headerView, tabView: tabView, titleBarHeight: Constants.titleBarHeight)
        multiTabPageVC.delegate = self
        multiTabPageVC.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        // 处理右滑退出手势冲突
        if let navi = self.navigationController {
            multiTabPageVC.handlePopGestureRecognizer(navi: navi)
        }
        addChild(multiTabPageVC)
        multiTabPageVC.move(to: 0, animated: false)
        return multiTabPageVC
    }()
    
    private lazy var titleBar: YFTitleBar = {
        let titleBar = YFTitleBar()
        titleBar.maxScrollY = 20.0
        titleBar.titleString = "123"
        return titleBar
    }()
}



extension YFMainViewController:YFMultipleTabViewDelegate{
    func selectedIndexInMultipleTabView(multipleTabView: YFMultipleTabView, selectedIndex: Int) {
        self.multiTabPageVC.move(to: selectedIndex, animated: false)
    }
}

extension YFMainViewController:YFMultiTabPageDelegate{
    // 横向collectionView滑动
    
    func multiTabPageViewController(_ viewController: YFMultiTabPageViewController, pageScrollViewDidScroll scrollView: UIScrollView) {
        
        tabView.pagerDidScroll(pager: scrollView)
    }
     // 横向collectionView滑动
    func multiTabPageViewController(_ viewController: YFMultiTabPageViewController, pageScrollViewDidEndDecelerating scrollView: UIScrollView) {
        
        if scrollView.bounds.size.width > 0 {
            tabView.pagerDidEndDecelerating(pager: scrollView)
        }
    }
    
    func multiTabPageViewController(_ viewController: YFMultiTabPageViewController, pageScrolllViewDidEndScrollingAnimation scrollView: UIScrollView) {
        if scrollView.bounds.size.width > 0 {
            tabView.pagerDidEndScrollingAnimation(pager: scrollView)
        }
    }
//    mainScrollView 滑动
    func multiTabPageViewController(_ viewController: YFMultiTabPageViewController, mainScrollViewDidScroll scrollView: UIScrollView) {
        titleBar.setTransparent(scrollView.contentOffset.y)
    }
    
    func multiTabPageViewController(_ viewController: YFMultiTabPageViewController, childViewController index: Int) -> YFMultiTabChildPageViewController? {

      let childVC = YFChildViewController.init()
      return childVC
    }
    

}
