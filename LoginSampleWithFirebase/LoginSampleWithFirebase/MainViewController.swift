//
//  MainViewController.swift
//  LoginSampleWithFirebase
//
//  Created by 류창휘 on 2022/01/10.
//

import Foundation
import UIKit
import FirebaseAuth

class MainViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //pop을 막아줌
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
        
        //이메일을 가져옴
        let email = Auth.auth().currentUser?.email ?? "고객"
        
        welcomeLabel.text = """
            환영합니다.
            \(email)님
            """
    }
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        
        do {
            try firebaseAuth.signOut()
            //루트뷰 컨트롤러로 이동
            self.navigationController?.popToRootViewController(animated: true)
            

        } catch let signOutError as NSError {
            print("ERROR: signOut \(signOutError.localizedDescription)")
        }
    
    }
    
}
