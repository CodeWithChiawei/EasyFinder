//
//  EasyFinder
//
//  Created by chiawei wen on 3/4/23.
//

import UIKit
import FirebaseDatabase

class UserPanelViewController: UIViewController {
    
    private let contentView = UserPanelView()
    private let viewModel = UserPanelViewModel()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        contentView.searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func addButtonTapped() {
        contentView.creatingUser { [weak self] firstName, lastName, hobby in
            self?.viewModel.createUserToFirebase(with: firstName, lastName, and: hobby)
        }
        contentView.removeTextFieldsText()
    }
    
    @objc
    private func searchButtonTapped() {
        contentView.searchUser { [weak self] searchedName in
            self?.viewModel.searchUser(with: searchedName)
        }
    }
}

