//
//  SettingViewController.swift
//  mInstagram
//
//  Created by Huang YangChing on 2022/2/11.
//
import SafariServices
import UIKit

struct SettingCellModel{
    let title:String
    let handler : (()->Void)
}

final class SettingViewController: UIViewController {

    private let tableview:UITableView = {
        let tableView = UITableView(frame: .zero,
                                    style: .grouped)
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private var data = [[SettingCellModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        view.backgroundColor = .systemBackground
        view.addSubview(tableview)
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableview.frame = view.bounds
    }
    
    private func configureModels(){
        data.append([
            SettingCellModel(title: "修改個人資料"){ [weak self]in
                self?.didTapEditProfile()
            },
            SettingCellModel(title: "邀請朋友"){ [weak self]in
                self?.didTapInviteFriend()
            },
            SettingCellModel(title: "儲存原始推文"){ [weak self]in
                self?.didTapSaveOriginPost()
            },
        ])
        
        data.append([
            SettingCellModel(title: "Terms of Service"){ [weak self]in
                self?.openURL(tyep: .terms)
            },
            SettingCellModel(title: "Privacy Policy"){ [weak self]in
                self?.openURL(tyep: .privacy)
            },
            SettingCellModel(title: "Help / FeedBack"){ [weak self]in
                self?.openURL(tyep: .help)
            }
        ])
        
        data.append([
            SettingCellModel(title: "登出"){ [weak self]in
                self?.didTapLogOut()
            
            }
        ])
    }
    
    private func didTapLogOut(){
        let actionSheet = UIAlertController(title: "登出",
                                            message: "你確定要登出",
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "登出", style: .destructive, handler: { _ in
            AuthManager.shared.logOut(){success in
                DispatchQueue.main.async {
                    if success {
                        let loginVC = LoginViewController()
                        loginVC.modalPresentationStyle = .fullScreen
                        self.present(loginVC, animated: true){
                            self.navigationController?.popToRootViewController(animated: false)
                            self.tabBarController?.selectedIndex = 0
                        }
                    }else{
                        fatalError("無法登出")
                    }
                }
            }
        }))
        
        actionSheet.popoverPresentationController?.sourceView = tableview
        actionSheet.popoverPresentationController?.sourceRect = tableview.bounds
        present(actionSheet, animated: true)
    }
    enum SettingsUrlType{
        case terms, privacy, help
    }
    
    private func openURL(tyep: SettingsUrlType){
        let urlString : String
        switch tyep {
        case .help:urlString = "https://help.instagram.com/"
        case .privacy:urlString = "https://help.instagram.com/519522125107875/?maybe_redirect_pol=0"
        case .terms:urlString = "https://help.instagram.com/581066165581870"
        }
        
        guard let url = URL(string: urlString) else{
            return
        }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    private func didTapEditProfile(){
        let vc = EditProfileViewController()
        vc.title = "編輯個人資料"
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC,animated: true)
    }
    
    private func didTapInviteFriend(){
        
    }
    
    private func didTapSaveOriginPost(){
        
    }

}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
        data[indexPath.section][indexPath.row].handler()
    }
}
