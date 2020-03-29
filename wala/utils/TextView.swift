//
//  TextView.swift
//  wala
//
//  Created by Roland Michelberger on 29.03.20.
//  Copyright © 2020 makeitappen GmbH. All rights reserved.
//

import SwiftUI

struct TextView: UIViewRepresentable {
    @Binding var text: String
    
    let textDidChange: (String) -> Void
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        
        let textView = UITextView(frame: .zero)
        textView.delegate = context.coordinator
        textView.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        textView.layer.borderColor = UIColor.systemGray.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 16
        textView.clipsToBounds = true
        
        //        myTextView.font = UIFont(name: "HelveticaNeue", size: 15)
        //        myTextView.isScrollEnabled = true
        //        myTextView.isEditable = true
        //        myTextView.isUserInteractionEnabled = true
        //        myTextView.backgroundColor = UIColor(white: 0.0, alpha: 0.05)
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
    
    class Coordinator : NSObject, UITextViewDelegate {
        
        var parent: TextView
        
        init(_ uiTextView: TextView) {
            self.parent = uiTextView
        }
        
        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            return true
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text
            self.parent.textDidChange(textView.text)
        }
    }
}
