//
//  LoginViewController.swift
//  FirebaseChatDemo
//
//  Created by sagar.thummar on 23/06/17.
//  Copyright © 2017 Solution Analysts Pvt. Ltd. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    private let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let loginRegisterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.backgroundColor = UIColor(r: 80, g: 101, b: 161, a: 1.0)
        button.layer.cornerRadius = 5.0
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()

    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let nameSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email Address"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let emailSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let profileImageView: UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "iTunesArtwork"))
        imgView.contentMode = .scaleAspectFill
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(r: 61, g: 91, b: 151, a: 1.0)

        view.addSubview(inputsContainerView)
        view.addSubview(loginRegisterButton)
        view.addSubview(profileImageView)

        setupInputsViewConstraint()
        setupLoginRegisterConstraint()
        setupProfileImageConstraint()
    }

    fileprivate func setupInputsViewConstraint() {
        //Center X, Center Y, Width, Height
        self.inputsContainerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.inputsContainerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.inputsContainerView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -24).isActive = true
        self.inputsContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true

        inputsContainerView.addSubview(nameTextField)
        inputsContainerView.addSubview(nameSeperatorView)
        inputsContainerView.addSubview(emailTextField)
        inputsContainerView.addSubview(emailSeperatorView)
        inputsContainerView.addSubview(passwordTextField)

        //Name Constraint: X, Y, Width, Height
        self.nameTextField.leadingAnchor.constraint(equalTo: self.inputsContainerView.leadingAnchor, constant: 12).isActive = true
        self.nameTextField.topAnchor.constraint(equalTo: self.inputsContainerView.topAnchor).isActive = true
        self.nameTextField.widthAnchor.constraint(equalTo: self.inputsContainerView.widthAnchor).isActive = true
        self.nameTextField.heightAnchor.constraint(equalTo: self.inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true

        self.nameSeperatorView.leadingAnchor.constraint(equalTo: self.inputsContainerView.leadingAnchor).isActive = true
        self.nameSeperatorView.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor).isActive = true
        self.nameSeperatorView.widthAnchor.constraint(equalTo: self.nameTextField.widthAnchor).isActive = true
        self.nameSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true

        //Email Constraint: X, Y, Width, Height
        self.emailTextField.leadingAnchor.constraint(equalTo: self.inputsContainerView.leadingAnchor, constant: 12).isActive = true
        self.emailTextField.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor).isActive = true
        self.emailTextField.widthAnchor.constraint(equalTo: self.inputsContainerView.widthAnchor).isActive = true
        self.emailTextField.heightAnchor.constraint(equalTo: self.inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true

        self.emailSeperatorView.leadingAnchor.constraint(equalTo: self.inputsContainerView.leadingAnchor).isActive = true
        self.emailSeperatorView.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor).isActive = true
        self.emailSeperatorView.widthAnchor.constraint(equalTo: self.emailTextField.widthAnchor).isActive = true
        self.emailSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true

        //Email Constraint: X, Y, Width, Height
        self.passwordTextField.leadingAnchor.constraint(equalTo: self.inputsContainerView.leadingAnchor, constant: 12).isActive = true
        self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor).isActive = true
        self.passwordTextField.widthAnchor.constraint(equalTo: self.inputsContainerView.widthAnchor).isActive = true
        self.passwordTextField.heightAnchor.constraint(equalTo: self.inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
    }

    fileprivate func setupLoginRegisterConstraint() {

        //Position: X,Y, Width & Height
        self.loginRegisterButton.centerXAnchor.constraint(equalTo: inputsContainerView.centerXAnchor).isActive = true
        self.loginRegisterButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 12).isActive = true
        self.loginRegisterButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        self.loginRegisterButton.heightAnchor.constraint(equalToConstant: 50.0)
    }

    fileprivate func setupProfileImageConstraint() {

        //Image View: Center-X, Y, Width & Height
        self.profileImageView.centerXAnchor.constraint(equalTo: inputsContainerView.centerXAnchor).isActive = true
        self.profileImageView.bottomAnchor.constraint(equalTo: self.inputsContainerView.topAnchor, constant: -12).isActive = true
        self.profileImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        self.profileImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
}
