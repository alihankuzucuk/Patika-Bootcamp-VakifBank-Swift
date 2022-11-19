//
//  PresentViewController.swift
//  Navigation
//
//  Created by Alihan KUZUCUK on 19.11.2022.
//

import UIKit

class PresentViewController: UIViewController {

    var presentData = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // StoryboardId: PresentViewController
        
        print(presentData)
    }

    @IBAction func btnDismissClicked(_ sender: Any) {
        dismiss(animated: true)
    }
}
