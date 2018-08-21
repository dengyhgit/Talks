//
//  ViewController.swift
//  SwiftDemo
//
//  Created by 邓永豪 on 2018/8/8.
//  Copyright © 2018年 邓永豪. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let a = 5
        let b = 10
        add(a: a, b: b)
        alert(text: "this is a alert text")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func add(a: Int, b: Int) -> Int {
        let c = a + b
        return c
    }
    
    func alert(text: String) {
        let alert = UIAlertView(title: "", message: text, delegate: nil, cancelButtonTitle: "Cancel", otherButtonTitles: "OK")
        alert.show()
    }
}

