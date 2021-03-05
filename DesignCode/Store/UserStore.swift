//
//  UserStore.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 3/3/21.
//

import SwiftUI
import Combine
import Firebase

class UserStore : ObservableObject {
    
    @Published var currentUser : User?
    @Published var isLogged : Bool = UserDefaults.standard.bool(forKey: "isLogged") {
        didSet {
            UserDefaults.standard.set(self.isLogged, forKey: "isLogged")
        }
    }
    
    private let auth : Auth = Auth.auth()
    private let db : Firestore = Firestore.firestore()
    
    //Get Current User
    func getCurrentUser() {
        if let user = auth.currentUser {
            print("Logged")
            let userRef = self.db.collection("users").document(user.uid)
            userRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    guard let data = document.data() else {return}
                    
                    let id = document.documentID
                    let username = data["username"] as? String ?? ""
                    let email = data["email"] as? String ?? ""
                    
                    self.currentUser = User(id: id, username: username, email: email)
                    self.isLogged = true
                    
                } else {
                    print("Not Logged")
                    self.currentUser = nil
                    self.isLogged = false
                }
            }
        } else {
            print("Not Logged")
            self.currentUser = nil
            self.isLogged = false
        }
    }
    
    //Sign up and create user
    func signupUser(username: String, email: String, password: String, completion: @escaping (FireAuthResponse) -> Void) {
        auth.createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                let errorMessage = self.handleFirebaseAuthError(error: error)
                DispatchQueue.main.async {
                    completion(FireAuthResponse(result: nil, errorMessage: errorMessage))
                }
            } else {
                self.createUserDocument(username: username, result: result)
                DispatchQueue.main.async {
                    completion(FireAuthResponse(result: result, errorMessage: nil))
                }
            }
        }
    }
    
    private func createUserDocument(username: String, result: AuthDataResult?) {
        if let user = result?.user {
            let newUserRef = self.db.collection("users").document(user.uid)
            let newUser = User(id: newUserRef.documentID, username: username, email: user.email ?? "")
            newUserRef.getDocument { (document, error) in
               if let document = document, !document.exists {
                let data : [String : Any] = [
                    "username": newUser.username,
                    "email": newUser.email
                ]
                newUserRef.setData(data)
               }
           }
        }
    }
    
    //Sign in user
    func signinUser(email: String, password: String, completion: @escaping (FireAuthResponse) -> Void) {
        auth.signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                let errorMessage = self.handleFirebaseAuthError(error: error)
                DispatchQueue.main.async {
                    completion(FireAuthResponse(result: nil, errorMessage: errorMessage))
                }
            } else {
                DispatchQueue.main.async {
                    completion(FireAuthResponse(result: result, errorMessage: nil))
                }
            }
        }
    }
    
    
    // Handle Firebase Errors
    private func handleFirebaseAuthError(error: Error) -> String {
        if let errorCode = AuthErrorCode(rawValue: error._code) {
            let errorMessage = errorCode.errorMessage
            return errorMessage
        }
        return ""
    }
    
    // Logout
    func logout() {
        do {
            try auth.signOut()
            self.isLogged = false
            self.currentUser = nil
        } catch {
            print(self.handleFirebaseAuthError(error: error))
        }
        
    }

    
}

struct FireAuthResponse {
    let result : AuthDataResult?
    let errorMessage : String?
}

extension AuthErrorCode {
    var errorMessage: String {
        switch self {
        case .emailAlreadyInUse:
            return "The email is already in use with another account. Pick another email."
        case .userNotFound:
            return "Account not found for the specified user. Please check and try again."
        case .userDisabled:
            return "Your account has been disabled. Please contact support."
        case .invalidEmail, .invalidSender, .invalidRecipientEmail:
            return "Please enter a valid email."
        case .networkError:
            return "Network error. Please try again."
        case .weakPassword:
            return "Your password is too weak. The password must be 6 characters long or more."
        case .wrongPassword:
            return "Your password or email is incorrect."
        default:
            return "Sorry, something went wrong."
        }
    }
}
