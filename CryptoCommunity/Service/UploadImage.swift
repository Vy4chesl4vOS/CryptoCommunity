//
//  UploadImage.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 11.04.2022.
//

import Foundation
import Firebase
import UIKit

struct ImageUpload {
    static func uploadImage (image: UIImage, completion: @escaping(String) -> Void) {
        let filename = NSUUID().uuidString
        let path = Firebase.Storage.storage().reference(withPath: "profile_image\(filename)")
        guard let dataImage = image.jpegData(compressionQuality: 0.5) else { return }
        
        path.putData(dataImage, metadata: nil) { _, error in
            if let error = error {
                print("Error upload image \(error)")
                return
            }
            
            path.downloadURL { url, _ in
                guard let urlString = url?.absoluteString else { return }
                completion(urlString)
            }
        }

    }
}
