//
//  MainViewModel.swift
//  EasyFinder
//
//  Created by chiawei wen on 3/4/23.
//

import Foundation
import FirebaseDatabase

class UserPanelViewModel {
    
    private let dataBase = Database.database().reference()
    
    func createUserToFirebase(with firstName: String, _ lastName: String, and hobby: String) {
        
        let object: [String: String] = [
            "First Name": firstName,
            "Last Name": lastName,
            "Hobby": hobby
        ]
        
        if !firstName.isEmpty, !lastName.isEmpty, !hobby.isEmpty {
            dataBase.child("\(firstName) \(lastName)").setValue(object)
            print("\(firstName) \(lastName) created.")
        } else {
            print("Missing info for the User")
        }
    }
    
    func searchUser(with fullName: String) {
        dataBase.child(fullName).observeSingleEvent(of: .value) { dataSnapshot in
            guard let value = dataSnapshot.value else { return }
            if dataSnapshot.exists() {
                print(value)
            } else {
                print("Not Exist")
            }
        }
    }
}
