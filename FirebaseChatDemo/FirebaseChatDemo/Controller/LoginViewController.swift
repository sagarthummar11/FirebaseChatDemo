//
//  LoginViewController.swift
//  FirebaseChatDemo
//
//  Created by sagar.thummar on 23/06/17.
//  Copyright © 2017 Solution Analysts Pvt. Ltd. All rights reserved.
//

import UIKit
import Firebase

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

        button.addTarget(self, action: #selector(handleLoginRegister), for: .touchUpInside)

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

    lazy var loginRegisterSegmentedControl: UISegmentedControl = {
        let segmentControl = UISegmentedControl(items: ["Login","Register"])
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.tintColor = .white
        segmentControl.selectedSegmentIndex = 1
        segmentControl.addTarget(self, action: #selector(handleLoginRegisterChange), for: .valueChanged)
         return segmentControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(r: 61, g: 91, b: 151, a: 1.0)

        view.addSubview(inputsContainerView)
        view.addSubview(loginRegisterButton)
        view.addSubview(profileImageView)
        view.addSubview(loginRegisterSegmentedControl)

        setupInputsViewConstraint()
        setupLoginRegisterConstraint()
        setupProfileImageConstraint()
        setupLoginRegisterSegmentedControl()
    }

    fileprivate func setupLoginRegisterSegmentedControl() {
        //Center X, Y, Width & Height
        loginRegisterSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterSegmentedControl.bottomAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: -12).isActive = true
        loginRegisterSegmentedControl.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        loginRegisterSegmentedControl.heightAnchor.constraint(equalToConstant: 36).isActive = true

    }

    var inputContainerViewHeightAnchor: NSLayoutConstraint?
    var nameTextFieldHeightAnchor: NSLayoutConstraint?
    var emailTextFieldHeightAnchor: NSLayoutConstraint?
    var passwordTextFieldHeightAnchor: NSLayoutConstraint?

    fileprivate func setupInputsViewConstraint() {
        //Center X, Center Y, Width, Height
        self.inputsContainerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.inputsContainerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.inputsContainerView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -24).isActive = true
        self.inputContainerViewHeightAnchor = self.inputsContainerView.heightAnchor.constraint(equalToConstant: 150)
        inputContainerViewHeightAnchor?.isActive = true

        inputsContainerView.addSubview(nameTextField)
        inputsContainerView.addSubview(nameSeperatorView)
        inputsContainerView.addSubview(emailTextField)
        inputsContainerView.addSubview(emailSeperatorView)
        inputsContainerView.addSubview(passwordTextField)

        //Name Constraint: X, Y, Width, Height
        self.nameTextField.leadingAnchor.constraint(equalTo: self.inputsContainerView.leadingAnchor, constant: 12).isActive = true
        self.nameTextField.topAnchor.constraint(equalTo: self.inputsContainerView.topAnchor).isActive = true
        self.nameTextField.widthAnchor.constraint(equalTo: self.inputsContainerView.widthAnchor).isActive = true
        self.nameTextFieldHeightAnchor = self.nameTextField.heightAnchor.constraint(equalTo: self.inputsContainerView.heightAnchor, multiplier: 1/3)
        self.nameTextFieldHeightAnchor?.isActive = true

        self.nameSeperatorView.leadingAnchor.constraint(equalTo: self.inputsContainerView.leadingAnchor).isActive = true
        self.nameSeperatorView.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor).isActive = true
        self.nameSeperatorView.widthAnchor.constraint(equalTo: self.nameTextField.widthAnchor).isActive = true
        self.nameSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true

        //Email Constraint: X, Y, Width, Height
        self.emailTextField.leadingAnchor.constraint(equalTo: self.inputsContainerView.leadingAnchor, constant: 12).isActive = true
        self.emailTextField.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor).isActive = true
        self.emailTextField.widthAnchor.constraint(equalTo: self.inputsContainerView.widthAnchor).isActive = true
        self.emailTextFieldHeightAnchor = self.emailTextField.heightAnchor.constraint(equalTo: self.inputsContainerView.heightAnchor, multiplier: 1/3)
        self.emailTextFieldHeightAnchor?.isActive = true

        self.emailSeperatorView.leadingAnchor.constraint(equalTo: self.inputsContainerView.leadingAnchor).isActive = true
        self.emailSeperatorView.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor).isActive = true
        self.emailSeperatorView.widthAnchor.constraint(equalTo: self.emailTextField.widthAnchor).isActive = true
        self.emailSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true

        //Email Constraint: X, Y, Width, Height
        self.passwordTextField.leadingAnchor.constraint(equalTo: self.inputsContainerView.leadingAnchor, constant: 12).isActive = true
        self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor).isActive = true
        self.passwordTextField.widthAnchor.constraint(equalTo: self.inputsContainerView.widthAnchor).isActive = true
        self.passwordTextFieldHeightAnchor = self.passwordTextField.heightAnchor.constraint(equalTo: self.inputsContainerView.heightAnchor, multiplier: 1/3)
        self.passwordTextFieldHeightAnchor?.isActive = true
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
        self.profileImageView.bottomAnchor.constraint(equalTo: self.loginRegisterSegmentedControl.topAnchor, constant: -12).isActive = true
        self.profileImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        self.profileImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }

    //MARK:- View Controller Selectore Methods -

    @objc func handleLoginRegister() {

        if loginRegisterSegmentedControl.selectedSegmentIndex == 0 {
            handleLogin()
        } else {
            handleRegister()
        }
    }

    func handleLogin() {

        guard let email = emailTextField.text, let password = passwordTextField.text else {
            print("Form input is not valid")
            return
        }

        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in

            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }

            //Successfully logged in User.
            self.dismiss(animated: true, completion: nil)
        })
    }

    @objc func handleRegister() {

        guard let email = emailTextField.text, let password = passwordTextField.text, let name = nameTextField.text else {
            print("Form input is not valid")
            return
        }

        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in

            if error != nil {
                print("Creating User Error: \(String(describing: error?.localizedDescription))")
                return
            }

            guard let uid = user?.uid else {
                return
            }

            //Successfully authenticated user
            let ref = FIRDatabase.database().reference(fromURL: "https://fir-chatapp-e90fe.firebaseio.com/")
            let userReference = ref.child("users").child(uid)
            let values = ["name": name, "email": email]

            userReference.updateChildValues(values, withCompletionBlock: { (err, ref) in

                if err != nil {
                    print("User Reference Error: \(err?.localizedDescription  ?? "-")")
                    return
                }

                print("Successfully saved user in firebase database.")
                self.dismiss(animated: true, completion: nil)
            })
        })
    }

    @objc func handleLoginRegisterChange() {
        let title = loginRegisterSegmentedControl.titleForSegment(at: loginRegisterSegmentedControl.selectedSegmentIndex)
        loginRegisterButton.setTitle(title, for: .normal)

        //Change height of input container view
        inputContainerViewHeightAnchor?.constant = (loginRegisterSegmentedControl.selectedSegmentIndex == 0) ? 100 : 150

        //Change height of name text field
        self.nameTextFieldHeightAnchor?.isActive = false
        self.nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: (loginRegisterSegmentedControl.selectedSegmentIndex == 0) ? 0 : 1/3)
        self.nameTextFieldHeightAnchor?.isActive = true

        //Change height of email text field
        self.emailTextFieldHeightAnchor?.isActive = false
        self.emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: (loginRegisterSegmentedControl.selectedSegmentIndex == 0) ? 1/2 : 1/3)
        self.emailTextFieldHeightAnchor?.isActive = true

        //Change height of password text field
        self.passwordTextFieldHeightAnchor?.isActive = false
        self.passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: (loginRegisterSegmentedControl.selectedSegmentIndex == 0) ? 1/2 : 1/3)
        self.passwordTextFieldHeightAnchor?.isActive = true
    }
}
