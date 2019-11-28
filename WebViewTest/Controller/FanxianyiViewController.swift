//
//  FanxianyiViewController.swift
//  WebViewTest
//
//  Created by jia on 2019/11/20.
//  Copyright © 2019 jia. All rights reserved.
//

import UIKit
import SafariServices

class FanxianyiViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let url = URL(string: "http://wb1.planpoint.cn/fanxianyi/links.html") {
            let safariController = SFSafariViewController(url: url)
            present(safariController,animated: true,completion: nil)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
