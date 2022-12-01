//
//  SignUpViewController.swift
//  AppdevHackathonProject
//
//  Created by Youssef Ahmed on 11/28/22.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let signUpLabel = UILabel()
    let emailLabel = UILabel()
    let emailTextField = UITextField()
    let usernameLabel = UILabel()
    let usernameTextField = UITextField()
    let firstNameLabel = UILabel()
    let firstNameTextField = UITextField()
    let lastNameLabel = UILabel()
    let lastNameTextField = UITextField()
    let passwordLabel = UILabel()
    let passwordTextField = UITextField()
    let confirmPasswordLabel = UILabel()
    let confirmPasswordTextField = UITextField()
    let signUpButton = UIButton()

    let maroon = UIColor(red: 197/255, green: 61/255, blue: 61/255, alpha: 1.0)

    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.backgroundColor = maroon
        
        signUpLabel.text = "Create an account"
        signUpLabel.font = .boldSystemFont(ofSize: 32)
        signUpLabel.textColor = .white
        signUpLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signUpLabel)
        
        emailLabel.text = "EMAIL"
        emailLabel.font = .systemFont(ofSize: 15)
        emailLabel.textColor = .white
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailLabel)
        
        emailTextField.backgroundColor = maroon
        emailTextField.textColor = .white
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailTextField)
        
        let horzEmailLine = CGRect(x: 54, y: 240, width: 281.5, height: 0.5) //TODO: Change
        let view1 = UIView(frame: horzEmailLine)
        view1.backgroundColor = .white
        self.view.addSubview(view1)
        
        usernameLabel.text = "USERNAME"
        usernameLabel.font = .systemFont(ofSize: 15)
        usernameLabel.textColor = .white
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameLabel)
        
        usernameTextField.backgroundColor = maroon
        usernameTextField.textColor = .white
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameTextField)
        
        let horzUsernameLine = CGRect(x: 54, y: 314, width: 281.5, height: 0.5) //TODO: Change
        let view2 = UIView(frame: horzUsernameLine)
        view2.backgroundColor = .white
        self.view.addSubview(view2)

        firstNameLabel.text = "FIRST NAME"
        firstNameLabel.font = .systemFont(ofSize: 15)
        firstNameLabel.textColor = .white
        firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(firstNameLabel)
        
        firstNameTextField.backgroundColor = maroon
        firstNameTextField.textColor = .white
        firstNameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(firstNameTextField)
        
        let horzFirstNameLine = CGRect(x: 54, y: 388, width: 281.5, height: 0.5) //TODO: Change
        let view3 = UIView(frame: horzFirstNameLine)
        view3.backgroundColor = .white
        self.view.addSubview(view3)
        
        lastNameLabel.text = "LAST NAME"
        lastNameLabel.font = .systemFont(ofSize: 15)
        lastNameLabel.textColor = .white
        lastNameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lastNameLabel)
        
        lastNameTextField.backgroundColor = maroon
        lastNameTextField.textColor = .white
        lastNameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lastNameTextField)
        
        let horzLastNameLine = CGRect(x: 54, y: 462, width: 281.5, height: 0.5) //TODO: Change
        let view4 = UIView(frame: horzLastNameLine)
        view4.backgroundColor = .white
        self.view.addSubview(view4)
        
        passwordLabel.text = "PASSWORD"
        passwordLabel.font = .systemFont(ofSize: 15)
        passwordLabel.textColor = .white
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordLabel)
        
        passwordTextField.backgroundColor = maroon
        passwordTextField.textColor = .white
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        
        let horzPasswordLine = CGRect(x: 54, y: 536, width: 281.5, height: 0.5) //TODO: Change
        let view5 = UIView(frame: horzPasswordLine)
        view5.backgroundColor = .white
        self.view.addSubview(view5)
        
        confirmPasswordLabel.text = "CONFIRM PASSWORD"
        confirmPasswordLabel.font = .systemFont(ofSize: 15)
        confirmPasswordLabel.textColor = .white
        confirmPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(confirmPasswordLabel)
        
        confirmPasswordTextField.backgroundColor = maroon
        confirmPasswordTextField.textColor = .white
        confirmPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(confirmPasswordTextField)
        
        let horzConfirmPasswaordLine = CGRect(x: 54, y: 610, width: 281.5, height: 0.5) //TODO: Change
        let view6 = UIView(frame: horzConfirmPasswaordLine)
        view6.backgroundColor = .white
        self.view.addSubview(view6)

        signUpButton.setTitle("Signup", for: .normal)
        signUpButton.setTitleColor(maroon, for: .normal)
        signUpButton.titleLabel?.font = .systemFont(ofSize: 16)
        signUpButton.backgroundColor = .white
        signUpButton.titleLabel?.textAlignment = .center
        signUpButton.layer.cornerRadius = 20
        signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signUpButton)
        
        setUpConstraints()
        }
    
    @objc func signUp() {
        
        let password=passwordTextField.text ?? ""
        let confirmPassword=confirmPasswordTextField.text ?? ""
        let username=usernameTextField.text ?? ""

        if(password.isEmpty || confirmPassword.isEmpty || username.isEmpty){
            let invalidInputAlert = UIAlertController(title: "Empty Field(s)", message: "Please make sure all text fields are completed", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                print("Invalid input alert invoked, user should check empty text fields")})
            invalidInputAlert.addAction(ok)
            self.present(invalidInputAlert, animated: true, completion: nil)
        }
        else if (password != confirmPassword) {
            let invalidInputAlert = UIAlertController(title: "Passwords Do Not Match", message: "Please make sure the password and confirm password fields match", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                print("Invalid input alert invoked, user should check empty text fields")})
            invalidInputAlert.addAction(ok)
            self.present(invalidInputAlert, animated: true, completion: nil)
        }
        else{
            //TODO: post info to database
            navigationController?.pushViewController(LoginViewController(), animated: true)
        }
    }
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            signUpLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 128),
            signUpLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54),
            signUpLabel.heightAnchor.constraint(equalToConstant: 39),
            signUpLabel.widthAnchor.constraint(equalToConstant: 287)
        ])
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 191),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54),
            emailLabel.heightAnchor.constraint(equalToConstant: 14),
            emailLabel.widthAnchor.constraint(equalToConstant: 117)
        ])
        
        NSLayoutConstraint.activate([
            emailTextField.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 240),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54),
            emailTextField.heightAnchor.constraint(equalToConstant: 20),
            emailTextField.widthAnchor.constraint(equalToConstant: 281.5)
        ])
        
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 265),
            usernameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54),
            usernameLabel.heightAnchor.constraint(equalToConstant: 14),
            usernameLabel.widthAnchor.constraint(equalToConstant: 117)
        ])
        
        NSLayoutConstraint.activate([
            usernameTextField.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 314),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54),
            usernameTextField.heightAnchor.constraint(equalToConstant: 20),
            usernameTextField.widthAnchor.constraint(equalToConstant: 281.5)
        ])
        
        NSLayoutConstraint.activate([
            firstNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 339),
            firstNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54),
            firstNameLabel.heightAnchor.constraint(equalToConstant: 14),
            firstNameLabel.widthAnchor.constraint(equalToConstant: 117)
        ])
        
        NSLayoutConstraint.activate([
            firstNameTextField.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 388),
            firstNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54),
            firstNameTextField.heightAnchor.constraint(equalToConstant: 20),
            firstNameTextField.widthAnchor.constraint(equalToConstant: 281.5)
        ])
        
        NSLayoutConstraint.activate([
            lastNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 413),
            lastNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54),
            lastNameLabel.heightAnchor.constraint(equalToConstant: 14),
            lastNameLabel.widthAnchor.constraint(equalToConstant: 117)
        ])
        
        NSLayoutConstraint.activate([
            lastNameTextField.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 462),
            lastNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54),
            lastNameTextField.heightAnchor.constraint(equalToConstant: 20),
            lastNameTextField.widthAnchor.constraint(equalToConstant: 281.5)
        ])
        
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 487),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54),
            passwordLabel.heightAnchor.constraint(equalToConstant: 14),
            passwordLabel.widthAnchor.constraint(equalToConstant: 117)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 536),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54),
            passwordTextField.heightAnchor.constraint(equalToConstant: 20),
            passwordTextField.widthAnchor.constraint(equalToConstant: 281.5)
        ])
        
        NSLayoutConstraint.activate([
            confirmPasswordLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 561),
            confirmPasswordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54),
            confirmPasswordLabel.heightAnchor.constraint(equalToConstant: 14),
            confirmPasswordLabel.widthAnchor.constraint(equalToConstant: 185)
        ])
        
        NSLayoutConstraint.activate([
            confirmPasswordTextField.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 610),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54),
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 20),
            confirmPasswordTextField.widthAnchor.constraint(equalToConstant: 281.5)
        ])
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 659),
            signUpButton.heightAnchor.constraint(equalToConstant: 38),
            signUpButton.widthAnchor.constraint(equalToConstant: 284),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }

}
