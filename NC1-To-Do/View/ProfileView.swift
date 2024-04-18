//
//  ProfileView.swift
//  NC1-To-Do
//
//  Created by 조세연 on 4/10/24.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @State var selectedItems: [PhotosPickerItem] = []
    @State private var imageData: Data?
    @State private var showPicker: Bool = false
    
    @Binding var name: String
    @Binding var plan: String
    
    let Background = Color.customBackGray
    
    var body: some View {
        ZStack {
            Background
            VStack{
                ZStack{
                    Image("img_profile_back")
                        .padding(.bottom, 20)
                    
                    PhotosPicker(selection: $selectedItems,
                                 maxSelectionCount: 1,
                                 matching: .images) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.customGreen)
                            .font(.system(size: 60))
        
                    }
                    if let imageData, let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .frame(width: 140, height: 140, alignment: .center)
                            .scaledToFill()
                            .clipped()
                            .clipShape(Circle())
                    }
                }
                
                TextField("이름을 적어주세요!", text: $name)
                    .fontWeight(.bold)
                    .font(.system(size: 40))
                    .foregroundColor(.customFontBlack)
                    .frame(width: 100, height: 50, alignment: .center)
                    .padding(.bottom, 10)
                    .multilineTextAlignment(.center)
                
                TextField("한줄소개를 적어주세요!", text: $plan)
                    .fontWeight(.regular)
                    .font(.system(size: 20))
                    .foregroundColor(.customFontBlack)
                    .frame(width: 200, alignment: .center)
                    .padding(.bottom, 80)
                    .multilineTextAlignment(.center)
                
                Button(action: {
                    
                    
                },label: {
                    Text("저장하기")
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color.customGreen)
                        .cornerRadius(20)
                }
                )
            }
        }.ignoresSafeArea(.all)
            .onChange(of: selectedItems) { selectedItems in
                
                if let selectedItem = selectedItems.first {
                    
                    selectedItem.loadTransferable(type: Data.self) { result in
                        switch result {
                        case .success(let imageData):
                            if let imageData {
                                self.imageData = imageData
                                print(imageData)
                            } else {
                                print("No supported content type found.")
                            }
                        case .failure(let error):
                            fatalError(error.localizedDescription)
                        }
                    }
                }
                
            }
        
        
        
    }
}
    
//    private var PhotoPickerContent: some View {
//        PhotosPicker(selection: $selectedItems,
//                     maxSelectionCount: 1,
//                     matching: .images) {
//            Image(systemName: "photo")
//                .foregroundColor(.black)
//        }
//                     .frame(width: 28, height: 21)
//    }
//}
    
//    #Preview {
//        ProfileView(name: $name, plan: $plan)
//    }
