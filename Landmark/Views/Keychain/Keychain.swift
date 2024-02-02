//
//  Keychain.swift
//  Landmark
//
//  Created by Мельник Дмитрий on 10.11.2023.
//

import Foundation
import SwiftUI

struct Keychain: View {

    @State var login = ""
    @State var password = ""
    @State var status = ""
    @State var statusPassword = ""
    @State var statusPasswords = [String]()


    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TextField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                TextField("Email", text: $login)
                    .textFieldStyle(.roundedBorder)
                Button("Log in \(status)") {
                    do {
                        status = try KeychainManager.saveCredentials(password: password.data(using: .utf8) ?? Data(), email: login)
                    } catch {
                        //print ошибок только в менеджерах
                        print(error)
                    }
                }
                .font(.title)
                Button("Show password \(statusPassword)") {

                    do {
                        let password = try KeychainManager.getPassword(for: login)
                        statusPassword = String(
                            decoding: password ?? Data(),
                            as: UTF8.self
                        )

                        let passwords = try KeychainManager.getPasswordsForAllEmails()
                        for item in passwords {
                            let pass = String(
                                decoding: item,
                                as: UTF8.self
                            )
                            statusPasswords.append(pass)
                        }
                        print("55 Show passwords \(statusPasswords)")
                        
                    } catch {
                        print("58 catch error \(error)")
                    }
                }
                .font(.title)
                Spacer()
            }
            .padding()
        }
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Keychain_Previews: PreviewProvider {
    static var previews: some View {
        Keychain()
    }
}


enum KeychainError: Error {
    case duplicateItem
    case unknown(status: OSStatus)
}
