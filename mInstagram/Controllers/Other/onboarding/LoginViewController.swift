//
//  LoginViewController.swift
//  mInstagram
//
//  Created by Huang YangChing on 2022/2/11.
//

import UIKit

class LoginViewController: UIViewController {

    private let usernameEmailField: UITextField = {
        return UITextField();
    }()
    
    private let passwordlField: UITextField = {
        return UITextField();
    }()
    
    private let loginButton: UIButton = {
        return UIButton();
    }()
    
    private let termsButton: UIButton = {
        return UIButton();
    }()
    
    private let privacyButton: UIButton = {
        return UIButton();
    }()
    
    private let createAccountButton: UIButton = {
        return UIButton();
    }()
    
    private let headerView: UIView = {
        return UIView();
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //assign frames
    }
    
    private func addSubViews(){
        view.addSubview(usernameEmailField)
        view.addSubview(passwordlField)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(createAccountButton)
        view.addSubview(headerView)
        
    }
    
    @objc private func didTapLoginButton(){}
    @objc private func didTapTermButton(){}
    @objc private func didTapPravacyButton(){}
    @objc private func didTapCreateAccount(){}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
