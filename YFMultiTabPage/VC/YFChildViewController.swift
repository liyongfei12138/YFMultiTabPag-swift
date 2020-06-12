//
//  YFChildViewController.swift
//  YFMultiTabPage
//
//  Created by liyongfi on 2020/6/11.
//  Copyright © 2020 liyongfi. All rights reserved.
//

import UIKit

class YFChildViewController: YFMultiTabChildPageViewController {

    
    var collectionViewTopPadding: CGFloat = 0
    var beginPoint: CGPoint = CGPoint.zero // 记录开始滑动的起始点
//    weak var delegate: ZFCollectionDemoViewControllerDelegate?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = 10.0
        layout.minimumInteritemSpacing = 10
        layout.itemSize =  CGSize(width: (UIScreen.main.bounds.size.width - 40) / 2, height: 200.0)
        let viewHeight: CGFloat = UIScreen.main.bounds.size.height - YFMainViewController.Constants.titleBarHeight - YFMainViewController.Constants.tabViewHeight
        let frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: viewHeight)
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(YFCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(YFCollectionViewCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
        
        if #available(iOS 11.0, *) {
            collectionView.contentInsetAdjustmentBehavior = .never
        }
        return collectionView
    }()
    //MARK: - Private Property
    private var toIndex: Int = 0
    
    //MARK: - Override FCCommonTabChildViewController
    override var offsetY: CGFloat {
        set {
            collectionView.contentOffset = CGPoint(x: 0, y: newValue)
        }
        get {
            return collectionView.contentOffset.y
        }
    }
//    override var isCanScroll: Bool {
//        didSet{
//            if isCanScroll {
//                collectionView.setContentOffset(CGPoint(x: 0, y: offsetY), animated: false)
//            }
//        }
//    }
    override func viewDidLoad() {
        super.viewDidLoad()

        configSubviews()
    }
    
    //MARK: - Private Mehtods
    private func configSubviews() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(collectionView)
    }
}
extension YFChildViewController: UIScrollViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        beginPoint = scrollView.contentOffset
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollDelegate?.commonTabChildViewController(self, scrollViewDidScroll: scrollView)
//        delegate?.waterfallViewController(self, scrollViewDidScroll: scrollView)
    }
}


extension YFChildViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(YFCollectionViewCell.self), for: indexPath) as? YFCollectionViewCell{
            cell.backgroundColor = .randomColor
            return cell
        }
        return UICollectionViewCell()
    }
    

    
}
extension UIColor {
    //返回随机颜色
    class var randomColor: UIColor {
        get
        {
            let red = CGFloat(arc4random() % 256) / 255.0
            let green = CGFloat(arc4random() % 256) / 255.0
            let blue = CGFloat(arc4random() % 256) / 255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
}
