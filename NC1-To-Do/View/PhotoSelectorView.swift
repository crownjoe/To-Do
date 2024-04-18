//
//  PhotoSelectorView.swift
//  NC1-To-Do
//
//  Created by 조세연 on 4/19/24.
//


import SwiftUI
import PhotosUI
struct MyImage:Codable{
    var name:String
    var imageDate:Data
}
let data:Data = try! JSONEncoder().encode(MyImage(name: "hello", imageDate: UIImage(systemName: "chevron.left")!.jpegData(compressionQuality: 1)!))

class PhotoSelectorViewModel: ObservableObject {
    @Published var images = [UIImage]()
    @Published var selectedPhotos = [PhotosPickerItem]()
    
    @MainActor
    func convertDataToImage() {
        images.removeAll()
        
        if !selectedPhotos.isEmpty {
            for eachItem in selectedPhotos {
                Task {
                    print(eachItem.itemIdentifier)
                    if let imageData = try? await eachItem.loadTransferable(type: Data.self) {
                        if let image = UIImage(data: imageData) {
                            images.append(image)
                        }
                    }
                }
            }
        }
        selectedPhotos.removeAll()
    }
}

struct PhotoSelectorView: View {
    @StateObject var vm = PhotoSelectorViewModel()
    let maxPhotosToSelect = 1
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem(.fixed(300))]) {
                    ForEach(0..<vm.images.count, id: \.self) { index in
                        Image(uiImage: vm.images[index])
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
            PhotosPicker(
                selection: $vm.selectedPhotos,
                maxSelectionCount: maxPhotosToSelect,
                selectionBehavior: .ordered,
                matching: .images
            ) {
                Label("", systemImage: "plus")
                    .foregroundColor(.black)
            }
        }
        .padding()
        .onChange(of: vm.selectedPhotos) { _, _ in
            vm.convertDataToImage()
        }
    }
}

#Preview {
    PhotoSelectorView()
}

