//
//  ProfileTabCollectionReusableView.swift
//  mInstagram
//
//  Created by Huang YangChing on 2022/2/17.
//

import UIKit

class ProfileTabCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileTabCollectionReusableView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orange
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
