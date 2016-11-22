//
//  ViewController.swift
//  TestCart
//
//  Created by jiang on 16/11/22.
//  Copyright © 2016年 李小龙. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func testaction(sender: UIButton) {
        let vm = MNShoppingCartViewModel()
        let vc = MNShoppingCartViewController.init(model: vm)
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

