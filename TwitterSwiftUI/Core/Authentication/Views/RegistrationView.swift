//
//  RegistrationView.swift
//  TwitterSwiftUI
//
//  Created by Artekium on 15/02/2023.
//
import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @State var root = [Root]()
    var body: some View {
        NavigationStack(path: $root) {
            VStack {
                AuthenticationHeaderView(title1: "Get Started.", title2: "Create your account")
                
                VStack (spacing: 40) {
                        CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                        CustomInputField(imageName: "person", placeholderText: "Username", text: $username)
                        CustomInputField(imageName: "person", placeholderText: "Fullname", text: $fullname)
                        CustomInputField(imageName: "lock", placeholderText: "Password",isSecureField: true, text: $password)
                        
                    }.padding(32)
                    
                
                Button {
                    viewModel.registrer(withEmail: email,
                                        password: password,
                                        fullname: fullname,
                                        username: username)
                } label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                    
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                
                Spacer()
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.caption)
                            .foregroundColor(Color(.black))
                        
                        Text("Sign In")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(.systemBlue))
                    }
                    .padding(.bottom, 32)
                }
            }
            .ignoresSafeArea()
            .onChange(of: viewModel.didAuthenticateUser) { newValue in
                guard newValue else {return}
                root.append(.profile)
            }.navigationDestination(for: Root.self) { navigation in
                switch navigation {
                case .profile:
                    ProfilePhotoSelectorView()
                }
            }
        }
    }
    
    struct RegistrationView_Previews: PreviewProvider {
        static var previews: some View {
            RegistrationView().environmentObject(AuthenticationViewModel())
        }
    }
    enum Root {
        case profile
    }
}
