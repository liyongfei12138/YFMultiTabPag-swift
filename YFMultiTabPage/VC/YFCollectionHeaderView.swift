//
//  YFCollectionHeaderView.swift
//  YFMultiTabPage
//
//  Created by liyongfi on 2020/6/11.
//  Copyright © 2020 liyongfi. All rights reserved.
//

import UIKit

class YFCollectionHeaderView: UIView {

    private lazy var bgView: UIImageView = {
        var bgView = UIImageView()
        bgView.image = UIImage(named: "header_bg")
        bgView.contentMode = .scaleToFill
        return bgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configViews() {
        self.addSubview(bgView)
        bgView.snp.makeConstraints({ (make) in
            make.edges.equalTo(self)
        })
    }
}
