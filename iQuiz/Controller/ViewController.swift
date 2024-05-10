//
//  ViewController.swift
//  iQuiz
//
//  Created by ebonatto-macOS on 08/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var botaoIniciarQuiz: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurarLayout()
    }

    func configurarLayout() {
        navigationItem.hidesBackButton = true
        botaoIniciarQuiz.layer.cornerRadius = 12.0
    }

}

