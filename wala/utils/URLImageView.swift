//
//  URLImageView.swift
//  wala
//
//  Created by Roland Michelberger on 28.03.20.
//  Copyright © 2020 makeitappen GmbH. All rights reserved.
//


import SwiftUI
import Combine

struct URLImageView<PlaceHolder, ClipShape: Shape>: View where PlaceHolder: View {
    
    let placeHolder: () -> PlaceHolder
    let clipShape: ClipShape
    
    @ObservedObject private var imageLoader: ImageLoader
    @State private var imageLoaderSub: AnyCancellable?

    @State private var image: UIImage?
    
    
    init(url: URL?, clipShape: ClipShape, placeHolder: @escaping () -> PlaceHolder) {
        imageLoader = ImageLoader(url: url)
        self.placeHolder = placeHolder
        self.clipShape = clipShape
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                if self.image == nil {
                    self.placeHolder().clipShape(self.clipShape)
                }
//                else {
                Image(uiImage: self.image ?? UIImage())
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
                    .clipShape(self.clipShape)
//                }
            }
            .onDisappear(){
                print("onDisappear")
                self.imageLoaderSub?.cancel()
            }
            .onAppear() {
                if self.image == nil {
                    print("onAppear")
                    self.imageLoaderSub?.cancel()
                    self.imageLoaderSub = self.imageLoader.didLoad
                        .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
                        .subscribe(on: RunLoop.main)
                        .sink { (image) in
                            self.image = image
                            print(image.size)
                    }
                }
            }
        }
    }
}

extension URLImageView where ClipShape == Circle {
    
    init(url: URL?, placeHolder: @escaping () -> PlaceHolder) {
        self.init(url: url, clipShape: Circle(), placeHolder: placeHolder)
    }
}

class ImageLoader: ObservableObject {
    
    var didLoad = PassthroughSubject<UIImage, Never>()
    
    private static var cache = MemCache<URL, UIImage>()
    
    init(url: URL?) {
        guard let url = url else { return }
        
        // get from cache
        if let image = ImageLoader.cache[url] {
            DispatchQueue.main.async {
//                print("cache \(url)")
                self.didLoad.send(image)
            }
        } else {
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else { return }
                
                DispatchQueue.main.async { [weak self] in
                    if let image = UIImage(data: data) {
                        ImageLoader.cache[url] = image
                        self?.didLoad.send(image)
                        print(url)
                    }
                }
            }
            task.resume()
        }
    }
}
