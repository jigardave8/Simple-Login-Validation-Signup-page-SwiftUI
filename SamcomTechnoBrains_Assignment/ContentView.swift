//
//  ContentView.swift
//  SamcomTechnoBrains_Assignment
//
//  Created by Jigar on 04/12/22.

import SwiftUI
import UIKit
import PhotosUI


struct ContentView: View {
    
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    @State var checkState: Bool = false
    
    
    
    
    
    @State var name = ""
    @State var email = ""
    @State var mob = ""
    @State var address = ""
    @State var password = ""
    @State var confirmPass = ""
    
    @State var mail = ""
    @State var pass = ""
    @State var hide = true
    var body: some View{
        NavigationView{
            ScrollView{
                
                VStack{
                    
                    PhotosPicker(
                        selection: $selectedItem,
                        matching: .images,
                        photoLibrary: .shared()) {
                            //                        Image("\($selectedItem)")
                            Text(" Profile Picture ")
                            
                        }
                        .onChange(of: selectedItem) { newItem in
                            Task {
                                // Retrieve selected asset in the form of Data
                                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                    selectedImageData = data
                                    
                                    
                                    
                                }
                            }
                            
                        }.padding()
                    if let selectedImageData,
                       let uiImage = UIImage(data: selectedImageData) {
                        
                        ZStack(alignment: .bottomTrailing){
                            Image(uiImage: uiImage)
                            
                                .fixedSize()
                                .dynamicTypeSize(.medium)
                                .scaledToFit()
                            
                                .frame(width: 100, height: 100)
                                .cornerRadius(40)
                            
                            Image("Frame")
                            //                                          .foregroundColor(.white)
                                .frame(width: 25, height: 25)
                                .fixedSize()
                            
                            //                                          .background(Color.blue)
                                .clipShape(Circle())
                            //
                                .overlay(Circle().stroke(Color.white, lineWidth: 1))
                        }
                        
                        
                    }
                    
                    
                    
                    
                    
                    
                    
                    VStack {
                        VStack{
                            HStack(spacing: 15){
                                Image(systemName: "person")
                                    .foregroundColor(.black)
                                    .frame(width: 25, height: 25)
                                Divider()
                                
                                TextField("Name", text: self.$mail)
                                    .cornerRadius(40)
                                // shadow effect...
                                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                                    .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                            }.padding(.vertical, 20)
                                .padding(.top, 10)
                                .padding(.leading, 15)
                                .padding(.trailing, 10)
                            
                            Divider()
                            
                            HStack(spacing: 15){
                                Image(systemName: "envelope.badge")
                                    .foregroundColor(.black)
                                    .frame(width: 25, height: 25)
                                Divider()
                                
                                TextField("Email", text: self.$mail)
                            }.padding(.vertical, 20)
                                .padding(.top, 10)
                                .padding(.leading, 15)
                                .padding(.trailing, 10)
                            
                            Divider()
                            
                            HStack(spacing: 15){
                                Image(systemName: "phone.connection")
                                    .foregroundColor(.black)
                                    .frame(width: 25, height: 25)
                                Divider()
                                TextField("Phone Number", text: self.$mail)
                            }.padding(.vertical, 20)
                                .padding(.top, 10)
                                .padding(.leading, 15)
                                .padding(.trailing, 10)
                            
                            
                            
                            Divider()
                            HStack(spacing: 15){
                                if !self.hide {
                                    Image(systemName: "lock")
                                        .resizable()
                                        .frame(width: 15, height: 18)
                                        .foregroundColor(.black)
                                    TextField("Confirm your Password", text: self.$pass)
                                }else {
                                    Image(systemName: "lock")
                                        .resizable()
                                        .frame(width: 15, height: 18)
                                        .foregroundColor(.black)
                                    SecureField("Enter your Password", text: self.$pass)
                                }
                                Button(action: {
                                    self.hide.toggle()
                                }) {
                                    Image(systemName: "eye")
                                        .foregroundColor(self.hide ? .black : .green)
                                }
                            }.padding(.vertical, 20)
                                .padding(.bottom, 10)
                                .padding(.leading, 20)
                                .padding(.trailing, 10)
                            
                            Button(action:
                                    {
                                //1. Save state
                                self.checkState = !self.checkState
                                print("State : \(self.checkState)")
                                
                                
                            }) {
                                HStack(alignment: .top, spacing: 10) {
                                    
                                    //2. Will update according to state
                                    Rectangle()
                                        .fill(self.checkState ? Color.blue : Color.red)
                                        .frame(width:20, height:20, alignment: .center)
                                        .cornerRadius(5)
                                    
                                    Text("I agree User agreement &  privacy Policy ")
                                    
                                }
                            }
                            .foregroundColor(Color.gray)
                            //
                        }
                        .padding(.bottom, 40)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                        
                        
                        Button(action: {
                            
                        }) {
                            Text("Sign Up")
                                .frame(width: 350 , height: 50, alignment: .center)
                                .padding(.vertical)
                                .foregroundColor(.white)
                                .padding(.vertical, 20)
                                .padding(.top, 10)
                                .padding(.leading, 15)
                                .padding(.trailing, 10)
                        }.background(Color.red)
                            .frame(width: 350 , height: 50, alignment: .center)
                        
                            .cornerRadius(50)
                            .padding()
                        
                        Button(action: {
                            
                        }) {
                            Text("Continue as guest")
                                .frame(width: 350 , height: 50, alignment: .center)
                                .padding(.vertical)
                                .foregroundColor(.red)
                                .padding(.vertical, 20)
                                .padding(.top, 10)
                                .padding(.leading, 15)
                                .padding(.trailing, 10)
                        }.background(Color.white)
                        
                            .frame(width: 350 , height: 50, alignment: .center)
                            .cornerRadius(50)
                            .overlay(RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.red, lineWidth: 2)
                            )
                        
                        
                        
                        
                        
                        HStack{
                            Button(action: {
                                
                            }) {
                                Image("facebookLogo")
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                            }.padding(.trailing, 50)
                            
                            Button(action: {
                                
                            }) {
                                Image("googleLogo")
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                            }
                            
                            
                            
                        }.padding(.top, 50)
                            .frame(width: (UIScreen.main.bounds.width - 300), height: 30)
                            .padding()
                        
                        
                        Text(" Already have an Account ? ").padding()
                        NavigationLink(destination: SignInView(viewModel: AuthModel())) {
                            Text("SignIn")
                        }
                    }
                }.padding()
            }
        }
        
        .onAppear{
            UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound, .alert]){
                _, _ in
            }
        }
    }
}




//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
