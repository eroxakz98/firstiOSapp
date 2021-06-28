//
//  AboutViewController.swift
//  BullsEye
//
//  Created by ernurashirbay on 21.06.2021.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView! //отвечает за отображение html-файла в окне
    @IBAction func close(){ //for closing the "About" section
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = Bundle.main.url(forResource: "index", withExtension: "html") {
            if let htmlData = try? Data(contentsOf: url) {
                let baseUrl = URL(fileURLWithPath: Bundle.main.bundlePath)
                webView.load(htmlData, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: baseUrl)
            }
        }

        // Do any additional setup after loading the view.
    }

}
