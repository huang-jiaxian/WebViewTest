//
//  WebViewController.swift
//  WebViewTest
//
//  Created by jia on 2019/11/19.
//  Copyright © 2019 jia. All rights reserved.
//

import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet var webView: WKWebView!
    var targetURL = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.largeTitleDisplayMode = .never
        
        // open web content use WKWebView
        if let url = URL(string: targetURL) {
            let request = URLRequest(url: url)
            webView.load(request)
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
