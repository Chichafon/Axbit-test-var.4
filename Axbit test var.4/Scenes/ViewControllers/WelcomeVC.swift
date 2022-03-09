//
//  WelcomeVC.swift
//  Axbit test var.4
//
//  Created by 111 on 09.03.2022.
//

import UIKit

class WelcomeVC: UIViewController {

    //MARK: - Properties

    static var names = [String]()
    private lazy var firstName = ""
    private lazy var secondName = ""
    private lazy var thirdName = ""

    //MARK: - Outlets

    @IBOutlet weak var welcomeScreenFirstTextField: UITextField!
    @IBOutlet weak var welcomeScreenSecondTextField: UITextField!
    @IBOutlet weak var welcomeScreenThirdTextField: UITextField!
    @IBOutlet weak var button: UIButton!

    //MARK: - Actions

    @IBAction func buttonAction(_ sender: UIButton) {

        // Method to change rootViewController to TabBarController

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let chooseArtistVC = storyboard.instantiateViewController(withIdentifier: "ChooseArtistVC") as? ChooseArtistVC else { return }
        chooseArtistVC.modalPresentationStyle = .fullScreen

        firstName = welcomeScreenFirstTextField.text ?? "nil"
        secondName = welcomeScreenSecondTextField.text ?? "nil"
        thirdName = welcomeScreenThirdTextField.text ?? "nil"

        WelcomeVC.names.append(firstName)
        WelcomeVC.names.append(secondName)
        WelcomeVC.names.append(thirdName)

        // Next rootViewController open animation

        present(chooseArtistVC, animated: true, completion: nil)
    }

    // Method that disable buttons, until all textFields got some text in

    @IBAction func textFieldChanged(_ sender: UITextField) {
        if (welcomeScreenFirstTextField?.text != "" && welcomeScreenSecondTextField?.text != "" && welcomeScreenThirdTextField?.text != "") {
                button.isEnabled = true
            } else {
                button.setTitleColor(.gray, for: .disabled)
                button.isEnabled = false
            }
    }

    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        button.isEnabled = false
    }


}

