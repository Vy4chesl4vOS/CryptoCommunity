//
//  ImagePicker.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 11.04.2022.
//

import Foundation
import SwiftUI


struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var mod
    
    func makeCoordinator() -> Coordinator {
        return (Coordinator(parent: self))
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

extension ImagePicker {
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker
        
        init (parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.originalImage] as? UIImage else { return }
            parent.image = image
            parent.mod.wrappedValue.dismiss()
        }
    }
}
