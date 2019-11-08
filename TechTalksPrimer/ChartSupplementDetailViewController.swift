//
//  ChartSupplementViewController.swift
//  TechTalksPrimer
//
//  Created by Nicholas Neuberger on 11/6/19.
//  Copyright © 2019 Nicholas Neuberger. All rights reserved.
//

import UIKit
import WebKit

class ChartSupplementDetailViewController: UIViewController {
    
    @IBOutlet weak var geoname: UILabel!
    @IBOutlet weak var pageNumber: UILabel!
    @IBOutlet weak var webView: WKWebView!
    
    var edition:Edition?
    
    let session =  URLSession(configuration: URLSessionConfiguration.default)

    override func viewDidLoad() {
        super.viewDidLoad()

        // DEMO: refactor to use guard let check on edition / pass to loadPdf.  Less optionals = easier code = less code issues.
        
        geoname.text = edition?.geoname.toString()
        pageNumber.text = edition?.product.pageNumber()
                
        loadPdf()
    }
    
    /**
     * This was the final solution when I finally realized that iOS (out of box apps) will NOT connect to a NON secure http endpoint
     * without having the security policy set in the Info.plist.
     * https://stackoverflow.com/questions/32631184/the-resource-could-not-be-loaded-because-the-app-transport-security-policy-requi
     */
    private func loadPdf() {
        if let edition = edition,
           let url = URL(string: edition.product.url) {
                  webView.load(URLRequest(url: url))
        }
    }
    
    /**
     * This was an old attempt at some boiler plate code to store a PDF to disk and load it once on disk.  Some of the forums
     * suggest that it must be downloaded first, but that's not really true.  The above solution pulls it immediatly from the web.
     */
    private func loadPdfOld() {
        if let edition = edition {
            let request = URLRequest(url:  URL(string: edition.product.url)!)
            let task = session.dataTask(with: request, completionHandler: {(data, response, error) in
                if error == nil{
                    if let pdfData = data {
                        let pathURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(edition.product.pageNumber())
                        do {
                            try pdfData.write(to: pathURL, options: .atomic)
                        }catch{
                            print("Error while writting")
                        }

                        DispatchQueue.main.async {
                            self.webView.load(URLRequest(url: pathURL))
                        }
                    }
                }else{
                    print(error?.localizedDescription ?? "")
                }
            });
            task.resume()
        }
    }
}
