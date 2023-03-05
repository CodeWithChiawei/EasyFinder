//
//  EasyFinder
//
//  Created by chiawei wen on 3/4/23.
//

import UIKit
import FirebaseDatabase

class MainViewController: UIViewController {
    
    private let dataBase = Database.database().reference()
    private let contentView = MainView()
    
    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }

    @objc
    private func addButtonTapped() {
        
        guard let firstName = contentView.firstNameTextField.text,
              let lastName = contentView.lastNameTextField.text,
              let hobby = contentView.hobbyNameTextField.text
        else { return }
        
        let object: [String: String] = [
            "First Name": firstName,
            "Last Name": lastName,
            "Hobby": hobby
        ]
        dataBase.child("\(firstName) \(lastName)").setValue(object)
    }
}

