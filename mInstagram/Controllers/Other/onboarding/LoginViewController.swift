//
//  LoginViewController.swift
//  mInstagram
//
//  Created by Huang YangChing on 2022/2/11.
//
import SafariServices
import UIKit

class LoginViewController: UIViewController {
    
    struct Constants{
        static let cornerRadius : CGFloat = 8.0
    }
    private let usernameEmailField: UITextField = {
        let field = UITextField()
        field.placeholder = "帳號或者信箱..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let passwordlField: UITextField = {
        let field = UITextField()
        field.placeholder = "密碼"
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("登入", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button;
    }()
    
    private let termsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Terms of Servicd", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button;
    }()
    
    private let privacyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button;
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("沒帳號?註冊新帳號", for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button;
    }()
    
    private let headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
        //        header.backgroundColor = .red
        let backgroundImageView = UIImageView(image: UIImage(named: "gradient"))
        header.addSubview(backgroundImageView)
        return header
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.addTarget(self,
                              action: #selector(didTapLoginButton),
                              for: .touchUpInside)
        
        createAccountButton.addTarget(self,
                              action: #selector(didTapCreateAccount),
                              for: .touchUpInside)
        
        termsButton.addTarget(self,
                              action: #selector(didTapTermButton),
                              for: .touchUpInside)
        
        privacyButton.addTarget(self,
                              action: #selector(didTapPravacyButton),
                              for: .touchUpInside)
        
        usernameEmailField.delegate = self
        passwordlField.delegate = self
        addSubViews()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //assign frames
        headerView.frame = CGRect(x: 0,
                                  y: 0.0,
                                  width: view.width,
                                  height: view.height/3.0)
        
        usernameEmailField.frame = CGRect(x: 25,
                                          y: headerView.bottom + 40,
                                          width: view.width - 50,
                                          height: 52.0)
        
        passwordlField.frame = CGRect(x: 25,
                                      y: usernameEmailField.bottom + 10,
                                      width: view.width - 50,
                                      height: 52.0)
        
        loginButton.frame = CGRect(x: 25,
                                      y: passwordlField.bottom + 10,
                                      width: view.width - 50,
                                      height: 52.0)
        
        createAccountButton.frame = CGRect(x: 25,
                                      y: loginButton.bottom + 10,
                                      width: view.width - 50,
                                      height: 52.0)
        
        termsButton.frame = CGRect(x: 10,
                                   y: view.height-view.safeAreaInsets.bottom - 100  ,
                                      width: view.width - 20,
                                      height: 52.0)

        
        privacyButton.frame = CGRect(x: 10,
                                   y: view.height-view.safeAreaInsets.bottom - 50  ,
                                      width: view.width - 20,
                                      height: 52.0)
        
        configureHeaderView()
    }
    
    private func configureHeaderView(){
        guard headerView.subviews.count == 1 else {
            return
        }
        
        guard let backgroundView = headerView.subviews.first else{
            return
        }
        backgroundView.frame = headerView.bounds
        
        // Add instagram logo
        
        let imageView = UIImageView(image: UIImage(named: "text"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width / 4.0,
                                 y: view.safeAreaInsets.top,
                                 width: headerView.width/2.0,
                                 height: headerView.height - view.safeAreaInsets.top)
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
    
    @objc private func didTapLoginButton(){
        passwordlField.resignFirstResponder()
        usernameEmailField.resignFirstResponder()
        
        guard let usernameEmail = usernameEmailField.text, !usernameEmail.isEmpty,
              let password = passwordlField.text, !password.isEmpty, password.count > 8 else{
                  return
              }
        
        // login functional
    }
    @objc private func didTapTermButton(){
        guard let url = URL(string: "https://help.instagram.com/581066165581870")else{
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    @objc private func didTapPravacyButton(){
        guard let url = URL(string: "https://help.instagram.com/519522125107875/?maybe_redirect_pol=0")else{
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    @objc private func didTapCreateAccount(){
        let vc = RegistrationViewController()
        present(vc, animated: true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension LoginViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        if textField == usernameEmailField{
            passwordlField.becomeFirstResponder()
        }
        else if textField == passwordlField{
            didTapLoginButton()
        }
        
        return true
    }
}
