//
//  ViewController.swift
//  hkSmileLoader
//
//  Created by Anderson Santos Gusmão on 17/12/2017.
//  Copyright © 2017 Anderson Santos Gusmão. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loaderView: SmileLoaderView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loaderView.addLoaderAnimation()
    }
}

