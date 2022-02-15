//
//  RegistationViewController.swift
//  mInstagram
//
//  Created by Huang YangChing on 2022/2/11.
//

import UIKit

class RegistrationViewController: UIViewController {

    struct Constants{
        static let cornerRadius : CGFloat = 8.0
    }
    
    private let usernameField: UITextField = {
        let field = UITextField()
        field.placeholder = "帳號..."
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
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.placeholder = "信箱..."
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
        field.isSecureTextEntry = true
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
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("登入", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button;
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.addTarget(self, action: #selector(disTapRegisterButton), for: .touchUpInside)
        usernameField.delegate = self
        passwordlField.delegate = self
        emailField.delegate = self
        view.addSubview(usernameField)
        view.addSubview(emailField)
        view.addSubview(passwordlField)
        view.addSubview(registerButton)
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        usernameField.frame = CGRect(x: 20, y: view.safeAreaInsets.top+10, width: view.width - 40, height: 52)
        emailField.frame = CGRect(x: 20, y: usernameField.bottom+10, width: view.width - 40, height: 52)
        passwordlField.frame = CGRect(x: 20, y: emailField.bottom+10, width: view.width - 40, height: 52)
        registerButton.frame = CGRect(x: 20, y: passwordlField.bottom+10, width: view.width - 40, height: 52)
    }
    
    @objc func disTapRegisterButton(){
        usernameField.resignFirstResponder()
        emailField.resignFirstResponder()
        passwordlField.resignFirstResponder()
        
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordlField.text, !password.isEmpty, password.count > 7,
              let username = usernameField.text, !username.isEmpty else{
                  return
              }
        print(123)
        AuthManager.shared.registerNewUser(username: username, email: email, password: password){register in
            DispatchQueue.main.async {
                if register{
                    
                }else{
                    //failed
                }
            }
        }
        
    }

}

extension RegistrationViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField{
            emailField.becomeFirstResponder()
        }else if textField == emailField {
            passwordlField.becomeFirstResponder()
        }else {
            disTapRegisterButton()
        }
        
        return true
    }
}
