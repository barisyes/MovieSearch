//
//  CustomImage.swift
//  MovieSearchSwiftUI
//
//  Created by Barış Yeşilkaya on 12.10.2022.
//

import SwiftUI

struct CustomImage: View {
    
    let url: String
    
    @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
    
    init(url: String) {
        self.url = url
        self.imageDownloaderClient.downloadImage(url: self.url)
    }
    
    var body: some View {
        if let data = imageDownloaderClient.downloadedImage {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        return Image("placeholder")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct CustomImage_Previews: PreviewProvider {
    static var previews: some View {
        CustomImage(url: "")
    }
}
