//
//  EditProfileViewController.swift
//  mInstagram
//
//  Created by Huang YangChing on 2022/2/11.
//

import UIKit

class EditProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "儲存",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapSave))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消",
                                                           style: .plain,
                                                            target: self,
                                                            action: #selector(didTapCancel))

    }

    @objc private func didTapSave(){
        
    }
    
    @objc private func didTapCancel(){
        
    }
    
    @objc private func didTapChangeProfilePicture(){
        let actionSheet = UIAlertController(title: "個人照",
                                            message: "更換大頭照",
                                            preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "拍照",
                                            style: .default, handler: { _ in
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "從相簿選擇",
                                            style: .default, handler: { _ in
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "取消",
                                            style: .cancel, handler: nil))
        
        actionSheet.popoverPresentationController?.sourceView = view
        actionSheet.popoverPresentationController?.sourceRect = view.bounds
        
        present(actionSheet, animated: true)
    }
}
