//
//  AuthViewModel.swift
//  E-Commerce
//
//  Created by Enes Sancar on 9.01.2024.
//

import FirebaseAuth

final class AuthViewModel {
    
    lazy var manager = FirebaseAuthManager()
    
    func login(email: String, password: String, completion: @escaping() -> ()) {
        manager.signIn(email: email, password: password) {
            completion()
        } onError: { error in
            print(error.localizedDescription)
        }
    }
    
    func register(userName: String, email: String, password: String, completion: @escaping () -> Void) {
        manager.register(userName: userName,
                                     email: email,
                                     password: password) {
            completion()
        } onError: { error in
            print(error)
        }
    }
    
    func resetPassword(email: String, completion: @escaping (Bool, String) -> Void) {
        guard !email.isEmpty else {
            completion(false, "E-mail cannot be blank.")
            return
        }
        
        manager.resetPassword(email: email) {
            completion(true, "Please check your e-mail to reset your password.")
        } onError: { error in
            completion(false, error)
        }
    }
    
    // MARK: - Change Password
    func changePassword(password: String, completion: @escaping (Bool, String) -> Void) {
        guard !password.isEmpty else {
            completion(false, "Parola alanı boş bırakılamaz.")
            return
        }
        Auth.auth().currentUser?.updatePassword(to: password) { (error) in
            if let error = error {
                // Şifreyenileme işlemi başarısız
                completion(false, "Şifre Güncellendi: \(error.localizedDescription)")
            } else {
                // Şifre yenileme başarılı
                completion(true, "Şifreniz Güncellendi")
            }
        }
    }
    
    func signInGoogle(credential: AuthCredential, username: String, completion: @escaping () -> Void) {
        manager.signInWithCredential(credential: credential, username: username) {
            completion()
        } onError: { error in
            print(error)
        }
    }
}
