//
//  ViewController.swift
//  UIKitPreviews
//
//  Created by Juan Catalan on 3/24/26.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    if let title { print(title) }
  }
}
