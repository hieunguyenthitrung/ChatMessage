//
//  MasterViewController.swift
//  ExampleApplication
//
//  Created by Hieu Nguyen Thi Trung on 5/22/20.
//  Copyright © 2020 Hieu Nguyen Thi Trung. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {

    var detailViewController: DetailViewController? = nil
    var objects = [Any]()
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var confirmEmailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var errorNameLabel: UILabel!
    @IBOutlet weak var heightErrorNameConstraint: NSLayoutConstraint!
    @IBOutlet weak var errorEmailLabel: UILabel!
    @IBOutlet weak var heightErrorEmailConstraint: NSLayoutConstraint!
    @IBOutlet weak var errorConfirmEmailLabel: UILabel!
    @IBOutlet weak var heightErrorConfirmEmailConstraint: NSLayoutConstraint!
    @IBOutlet weak var errorPassLabel: UILabel!
    @IBOutlet weak var heightErrorPassConstraint: NSLayoutConstraint!
    @IBOutlet weak var errorConfirmPassLabel: UILabel!
    
    let NAME_LIMIT_LENGHT : Int = 25
    let errorName = "Name isn't null"
    let errorEmailNull = "Email isn't null"
    let errorEmail = "Email is invalid"
    let errorConfirmEmail = "Confirm email don't like email"
    let errorConfirmEmailNull = "Confirm email isn't null"
    let errorPass = "Password isn't null"
    let errorConfirmPass = "Confirm password don't like password"
    let errorConfirmPassNull = "Confirm password isn't null"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        navigationItem.leftBarButtonItem = editButtonItem
//
//        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
//        navigationItem.rightBarButtonItem = addButton
//        if let split = splitViewController {
//            let controllers = split.viewControllers
//            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
//        }
        
        self.hiddenErrorField()
        self.unactiveRegisterButton()
    }
    
    func hiddenErrorField(){
        self.errorNameLabel.text = ""
        self.heightErrorNameConstraint.constant = 15
        self.errorEmailLabel.text = ""
        self.heightErrorEmailConstraint.constant = 15
        self.errorConfirmEmailLabel.text = ""
        self.heightErrorConfirmEmailConstraint.constant = 15
        self.errorPassLabel.text = ""
        self.heightErrorPassConstraint.constant = 15
        self.errorConfirmPassLabel.text = ""
    }
    
    func unactiveRegisterButton(){
        self.registerButton.isEnabled = false
        self.registerButton.backgroundColor = .lightGray
        self.registerButton.layer.cornerRadius = 5
    }
    
    func activeRegisterButton(){
        self.registerButton.isEnabled = true
        self.registerButton.backgroundColor = .systemBlue
        self.registerButton.layer.cornerRadius = 5
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: - Register Action

    @IBAction func registerAction() {
        self.nameTextField.text = ""
        self.emailTextField.text = ""
        self.confirmEmailTextField.text = ""
        self.passwordTextField.text =  ""
        self.confirmPasswordTextField.text = ""
        self.unactiveRegisterButton()
        
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let usersViewController = mainStoryBoard.instantiateViewController(withIdentifier: "UserListViewController") as? UserListViewController
        self.navigationController?.pushViewController(usersViewController!, animated: true)
    }
    
    //MARK: Check error in input field

    func isValidEmail(_ testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result =  emailTest.evaluate(with: testStr)
        return result
    }
    
    func checkErrorField(currentTextField : UITextField, string : String? = "", didEndEditing: Bool? = false) -> Bool{
        var isSuccess = true
        if let textField = self.nameTextField{
            var text = textField.text!
            if currentTextField == textField && string != ""{
                text = text + string!
            }
            let name =  text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).lowercased()
            if name == "" {
                isSuccess = false
            }
        }
        
        
        if let textField = self.emailTextField{
            var text = textField.text!
            var _didEndEditing = didEndEditing!
            if currentTextField != textField{
                _didEndEditing = true
            }
            else if currentTextField == textField && string != "" {
                text = text + string!
            }
            let email =  text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).lowercased()
            if email == ""{
                self.errorEmailLabel.text = ""
                self.heightErrorEmailConstraint.constant = 15
                isSuccess = false
            }
            else if email != "" && !self.isValidEmail(email){
                if(_didEndEditing){
                    self.errorEmailLabel.text = self.errorEmail
                    self.heightErrorEmailConstraint.constant = 25
                    
                }else {
                    self.errorEmailLabel.text = ""
                    self.heightErrorEmailConstraint.constant = 15
                }
                isSuccess = false
            }else{
                self.errorEmailLabel.text = ""
                self.heightErrorEmailConstraint.constant = 15
            }
        }
        
        if let textField = self.confirmEmailTextField{
            var text = textField.text!
            var _didEndEditing = didEndEditing!
            if currentTextField != textField{
                _didEndEditing = true
            }
            else if currentTextField == textField{
                text = text + string!
                if  string == "" && text != "" && !_didEndEditing{
                    let lenght = text.lengthOfBytes(using: String.Encoding.utf8)
                    if(lenght == 1){
                        text = ""
                    }
                    else{
                        text = String(text.suffix(lenght - 2))
                    }
                }
            }
            let email =  self.emailTextField.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).lowercased()
            let confirmEmail =  text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).lowercased()
            if(confirmEmail == ""){
                self.errorConfirmEmailLabel.text = ""
                self.heightErrorConfirmEmailConstraint.constant = 15
                isSuccess = false
            }else if confirmEmail != email{
                if(_didEndEditing){
                    self.errorConfirmEmailLabel.text = self.errorConfirmEmail
                    self.heightErrorConfirmEmailConstraint.constant = 25
                }else {
                    self.errorConfirmEmailLabel.text = ""
                    self.heightErrorConfirmEmailConstraint.constant = 15
                }
                isSuccess = false
            }
            else{
                self.errorConfirmEmailLabel.text = ""
                self.heightErrorConfirmEmailConstraint.constant = 15
            }
        }

        if let textField = self.passwordTextField{
            var text = textField.text!
            var _didEndEditing = didEndEditing!
            if currentTextField != textField{
                _didEndEditing = true
            }
            else if currentTextField == textField && string != "" {
                text = text + string!
            }
            let pass =  text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).lowercased()
            if pass == ""{
                self.heightErrorPassConstraint.constant = 15
                self.errorPassLabel.text = ""
                isSuccess = false
            }else if pass == ""{
                if(_didEndEditing){
                    self.heightErrorPassConstraint.constant = 25
                    self.errorPassLabel.text = self.errorPass
                }else {
                    self.heightErrorPassConstraint.constant = 15
                    self.errorPassLabel.text = ""
                }
                isSuccess = false
            }
            else{
                self.heightErrorPassConstraint.constant = 15
                self.errorPassLabel.text = ""
            }
        }

        if let textField = self.confirmPasswordTextField{
            var text = textField.text!
            var _didEndEditing = didEndEditing!
            if currentTextField != textField{
                _didEndEditing = true
            }
            else if currentTextField == textField{
                text = text + string!
                if  string == "" && text != "" && !_didEndEditing{
                    let lenght = text.lengthOfBytes(using: String.Encoding.utf8)
                    if(lenght == 1){
                        text = ""
                    }
                    else{
                        text = String(text.suffix(lenght - 2))
                    }
                }
            }
            let pass =  self.passwordTextField.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).lowercased()
            let confirmPass =  text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).lowercased()
            if(confirmPass == ""){
                self.errorConfirmPassLabel.text = ""
                isSuccess = false
            }else if confirmPass != pass{
                if(_didEndEditing){
                    self.errorConfirmPassLabel.text = self.errorConfirmPass
                }else {
                    self.errorConfirmPassLabel.text = ""
                }
                isSuccess = false
            }
            else{
                self.errorConfirmPassLabel.text = ""
            }
        }
        
        if(isSuccess){
            self.activeRegisterButton()
        }else{
            self.unactiveRegisterButton()
        }
        return isSuccess
    }
    
    // MARK: - UITextField Delagate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let textInTextField = textField.text! + string
        if textField == self.nameTextField {
            if(string == " " && (textField.text! as NSString).length == 0){
                return false
            }
        }
        else if textField == self.emailTextField {
            if(string == " "){
                return false
            }
        }
        else if textField == self.confirmEmailTextField {
            if(string == " "){
                return false
            }
        }else if textField == self.passwordTextField {
            if(string == " "){
                return false
            }
        }
        else if textField == self.confirmPasswordTextField {
            if(string == " "){
                return false
            }
        }
        let _ = !self.checkErrorField(currentTextField: textField, string : string)
        let newLength = textInTextField.lengthOfBytes(using: String.Encoding.utf8)
        if(newLength < Int(NAME_LIMIT_LENGHT) && string != ""){
            return true
        }else if(string == ""){
            return true
        }
        else{
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let _ = self.checkErrorField(currentTextField: textField, didEndEditing: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

