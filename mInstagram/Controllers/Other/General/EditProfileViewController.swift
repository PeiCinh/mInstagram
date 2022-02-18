//
//  EditProfileViewController.swift
//  mInstagram
//
//  Created by Huang YangChing on 2022/2/11.
//

import UIKit

struct EditorProfileFormModel{
    let label:String
    let placeholder:String
    var value:String?
}

final class EditProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let tableView : UITableView = {
        let tableview = UITableView()
        tableview.register(FormTableViewCell.self, forCellReuseIdentifier: FormTableViewCell.identifier)
        return tableview
    }()
    
    private var models = [[EditorProfileFormModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        view.backgroundColor  = .systemBackground
        tableView.tableHeaderView = createtableViewHeaderView()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "儲存",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapSave))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消",
                                                           style: .plain,
                                                            target: self,
                                                            action: #selector(didTapCancel))

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func configureModels(){
        let sectionLabel1 = ["姓名","暱稱","Bio"]
        var section1 = [EditorProfileFormModel]()
        for label in sectionLabel1{
            let model = EditorProfileFormModel(label: label,
                                               placeholder: "Enter \(label)...",
                                               value: nil)
            section1.append(model)
        }
        
        let sectionLabel2 = ["信箱","電話","Gender"]
        var section2 = [EditorProfileFormModel]()
        for label in sectionLabel2{
            let model = EditorProfileFormModel(label: label,
                                               placeholder: "Enter \(label)...",
                                               value: nil)
            section2.append(model)
        }
        models.append(section1)
        models.append(section2)
    }
    //MARK - TableView
    
    private func createtableViewHeaderView() ->UIView{
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: view.height / 4 ).integral)
        let size = header.height / 1.5
        let profilePhotonButoon = UIButton(frame: CGRect(x: (view.width - size)/2, y: (header.height - size)/2, width: size, height: size))
        
        header.addSubview(profilePhotonButoon)
        profilePhotonButoon.layer.masksToBounds = true
        profilePhotonButoon.layer.cornerRadius = size / 2.0
        profilePhotonButoon.tintColor = .label
        profilePhotonButoon.addTarget(self,
                                      action: #selector(didTapProfilePhotoButton),
                                      for: .touchUpInside)
        
        profilePhotonButoon.setBackgroundImage(UIImage(systemName: "person.circle"),
                                               for: .normal)
        profilePhotonButoon.layer.borderWidth = 1
        profilePhotonButoon.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        return header
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: FormTableViewCell.identifier, for: indexPath) as! FormTableViewCell
        cell.configure(with: model)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard section == 1 else{
            return nil
        }
        return "個人資料"
    }
    
    // MARK - Action
    @objc private func didTapProfilePhotoButton(){
        
    }
    
    @objc private func didTapSave(){
        
    }
    
    @objc private func didTapCancel(){
        dismiss(animated: true)
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

extension EditProfileViewController:FormTableViewCellDelegate{
    func formTableViewCell(_ cell: FormTableViewCell, didUpdateField updateModel: EditorProfileFormModel?) {
        let strings = ["John", "Paul", "George", "Ringo"]
        let t = strings.map { $0 }
        print(t)
    }

}
