//
//  ProfilePhotoSelectorView.swift
//  TwitterSwiftUI
//
//  Created by Artekium on 06/03/2023.
//

import SwiftUI
struct ProfilePhotoSelectorView: View {
    
    @State private var image = UIImage()
    @State private var showSheet = false
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    var body: some View {
        VStack {
            
            AuthenticationHeaderView(title1: "Set your account", title2: "Add a profile photo")
            
            Button {
                showSheet.toggle()
            } label: {
                    Image(uiImage: self.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(50)
                        .frame(width: 100, height: 100)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .onTapGesture {
                  showSheet = true
                    }
       
            }
            
            Image(systemName: "plus")
                .foregroundColor(.white)
                .frame(width: 25, height: 25)
                .background(Color.blue)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
            
         
                Button {
                    viewModel.uploadProfileImage(image)
                }
            label: {
                Text("Continue")
            }
            Spacer()
        }
        .ignoresSafeArea()
        .sheet(isPresented: $showSheet) {
            // Pick an image from the photo library:
            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
            
            //  If you wish to take a photo from camera instead:
            // ImagePicker(sourceType: .camera, selectedImage: self.$image)
        }
    }
}
/*struct ProfilePhotoSelectorView: View {
    @State private var image = UIImage()
    @State private var showSheet = false
    @State private var profileImage: Image?
    
    var body: some View {
        
        VStack {
            
            AuthenticationHeaderView(title1: "Set your account", title2: "Add a profile photo")
            
            Button {
                showSheet.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .modifier(ProfileImageModifier())
                } else {
                    Image("upload.photo")
                        .modifier(ProfileImageModifier())
                        .onTapGesture {
                          showSheet = true
                    }
                }
            }
            .sheet(isPresented: $showSheet) {
                        // Pick an image from the photo library:
                    ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)

                        //  If you wish to take a photo from camera instead:
                        // ImagePicker(sourceType: .camera, selectedImage: self.$image)
        }
            Spacer()
        }
            .ignoresSafeArea()
            
    }
}

private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(50)
            .frame(width: 100, height: 100)
            .background(Color.black.opacity(0.2))
            .aspectRatio(contentMode: .fill)
            .clipShape(Circle())
    }
}
*/
struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}

