//
//  ImageManager.swift
//  Assignment3_Riddhi
//
//  Created by Riddhi Kaila on 14/11/21.
//

import Foundation

class ImageManager {
    
    private var imagelist = [ImageInfo]()
    
    func addNewImage(ni: ImageInfo) {
        imagelist.append(ni)
    }
    
    func getAllImages() -> [ImageInfo]{
        return imagelist
    }
    
}
