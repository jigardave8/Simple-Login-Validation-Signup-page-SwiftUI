//
//  Auth.swift
//  SamcomTechnoBrains_Assignment
//
//  Created by Jigar on 04/12/22.
//

import SwiftUI

import Foundation

final class AuthModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var email = ""
    @Published var password = ""
    
    
    
    // MARK: -
    
    @Published var hasError = false
    
    @Published var isSigningIn = false
    
    // MARK: -
    
    var canSignIn: Bool {
        !email.isEmpty && !password.isEmpty
    }
    
    // MARK: - Public API
    
    
    
    fileprivate struct SignInResponse: Decodable {
        
        // MARK: - Properties
        
        let accessToken: String
        
    }
    
    func signIn() {
        guard !email.isEmpty && !password.isEmpty else {
            return
        }
        
        var request = URLRequest(url: URL(string: "https://api.trufflerms.com//login")!)
        
        request.httpMethod = "POST"
        
        let authData = (email + ":" + password).data(using: .utf8)!.base64EncodedString()
        request.addValue("Basic \(authData)", forHTTPHeaderField: "Authorization")
        
        isSigningIn = true
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {
                if error != nil || (response as! HTTPURLResponse).statusCode != 200 {
                    self?.hasError = true
                } else if let data = data {
                    do {
                        let signInResponse = try JSONDecoder().decode(SignInResponse.self, from: data)
                        
                        print(signInResponse)
                        
                        // TODO: Cache Access Token in Keychain
                    } catch {
                        print("Unable to Decode Response \(error)")
                    }
                }
                
                self?.isSigningIn = false
            }
        }.resume()
        
    }
}
