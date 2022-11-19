//
//  ViewController.swift
//  Navigation
//
//  Created by Alihan KUZUCUK on 19.11.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnPushWithIdClicked(_ sender: Any) {
        guard let pushWithIdVC = storyboard?.instantiateViewController(withIdentifier: "PushWithIdViewController") as? PushWithIdViewController else { return }
        // The same instance is used when coming back, but we create a new instance when going forward
        pushWithIdVC.pushedData = "Pushed"
        self.navigationController?.pushViewController(pushWithIdVC, animated: true)
    }
    
    @IBAction func btnPushWithSegueClicked(_ sender: Any) {
        performSegue(withIdentifier: "pushWithSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pushWithSegue" {
            guard let vc = segue.destination as? PushWithSegueViewController else { return }
            vc.pushedData = "Segue"
        }
    }
    
    @IBAction func btnPresentClicked(_ sender: Any) {
        guard let presentVC = storyboard?.instantiateViewController(withIdentifier: "PresentViewController") as? PresentViewController else { return }
        presentVC.presentData = "Presented"
        present(presentVC, animated: true)
        // Something that is presented is dismissed, something that is pushed is popped
    }
    
}

