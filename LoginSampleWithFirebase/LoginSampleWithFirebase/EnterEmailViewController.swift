//
//  EnterEmailViewController.swift
//  LoginSampleWithFirebase
//
//  Created by 류창휘 on 2022/01/10.
//

import Foundation
import UIKit
import FirebaseAuth

class EnterEmailViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 30
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        //커서가 뷰가 로드되었을 때 textfield로 설정
        emailTextField.becomeFirstResponder()
        
        
        //비활성화
        nextButton.isEnabled = false
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Navigation Bar 보이기
        navigationController?.navigationBar.isHidden = false
    }
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        //Firebase 이메일/비밀번호 인증
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        //신규 사용자 생성
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            
            
            if let error = error {
                let code = (error as NSError).code
                switch code {
                case 17997: //이미 가입한 게정일 때
                    //로그인하기
                    self.loginUser(withEmail: email, password: password)
                default:
                    self.errorLabel.text = error.localizedDescription
                }
                
            } else  {
                self.showMainViewController()
            }
            
        }
        
    }
    private func showMainViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainViewController = storyboard.instantiateViewController(identifier: "MainViewController")
        mainViewController.modalPresentationStyle = .fullScreen
        navigationController?.show(mainViewController, sender: nil)
    }
    
    private func loginUser(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] _, error in
            guard let self = self else { return }
            
            if let error = error {
                self.errorLabel.text = error.localizedDescription
            } else {
                self.showMainViewController()
            }
        }
    }
}

extension EnterEmailViewController: UITextFieldDelegate {
    //return을 눌렀을 때 키보드가 내려가게 설정
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //두개의 textfield가 채워졌을 때 활성화
        let isEmailEmpty = emailTextField.text == ""
        let isPasswordEmpty = passwordTextField.text == ""
        nextButton.isEnabled = !isEmailEmpty && !isPasswordEmpty
    }
}
