//
//  EasyFinder
//
//  Created by chiawei wen on 3/4/23.
//

import UIKit
import FirebaseDatabase

class MainViewController: UIViewController {
    
    private let contentView = MainView()
    private let viewModel = MainViewModel()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func addButtonTapped() {
        
        contentView.creatingUser { [weak self] firstName, lastName, hobby in
            self?.viewModel.createUserToFirebase(with: firstName, lastName, and: hobby)
        }
    }
}

