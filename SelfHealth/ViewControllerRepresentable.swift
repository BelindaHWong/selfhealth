//
//  ViewControllerRepresentable.swift
//  SelfHealth
//
//  Created by Belinda Wong on 18/7/2023.
//

import SwiftUI

@available(iOS 13.0, *)
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "Dashboard") as! ViewController
        // Customize or pass any data to the view controller
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Optional: Implement this method if needed
    }
}

@available(iOS 13.0, *)
struct ViewControllerRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
    }
}
