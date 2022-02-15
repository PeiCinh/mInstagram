//
//  IGFeedPostTableViewCell.swift
//  mInstagram
//
//  Created by Huang YangChing on 2022/2/15.
//

import UIKit

final class IGFeedPostTableViewCell: UITableViewCell {

    static let identifier :String = "IGFeedPostTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(){
        //configure the cell
    }
}
