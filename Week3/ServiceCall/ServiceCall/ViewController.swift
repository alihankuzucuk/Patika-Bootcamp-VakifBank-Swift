//
//  ViewController.swift
//  ServiceCall
//
//  Created by Alihan KUZUCUK on 20.11.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Client.getSpells { spells, error in
            guard let firstSpell = spells?[0] else { return }
            print(firstSpell)
        }
    }


}

