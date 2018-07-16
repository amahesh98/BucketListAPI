//
//  AddEditVC.swift
//  BucketListAPI
//
//  Created by Ashwin Mahesh on 7/16/18.
//  Copyright © 2018 AshwinMahesh. All rights reserved.
//

import UIKit

class AddEditVC: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBAction func cancelPushed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func savePushed(_ sender: UIBarButtonItem) {
        if textField.text!.count==0{
            return
        }
        let text = ("objective=\(textField.text!)")
        addTask(name: text, completionHandler: {
            data, response, error in
            do{
                
            }
            catch{
                
            }
        })
        dismiss(animated: true, completion: nil)
    }
    
    func addTask(name: String, completionHandler: @escaping(_ data: Data?, _ response: URLResponse?, _ error: Error?)->Void){
        if let urlReq=URL(string: "http://192.168.1.228:8000/addTask/"){
            var request = URLRequest(url: urlReq)
            request.httpMethod = "POST"
            let bodyData = name
            request.httpBody = bodyData.data(using: .utf8)
            let session = URLSession.shared
            let task = session.dataTask(with: request as URLRequest, completionHandler: completionHandler)
            task.resume()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
