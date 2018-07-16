//
//  ViewController.swift
//  BucketListAPI
//
//  Created by Ashwin Mahesh on 7/16/18.
//  Copyright © 2018 AshwinMahesh. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var tableData:[String]=[]

    @IBAction func addPushed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "AddSegue", sender: "add")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        getAllTasks()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        tableData = []
        getAllTasks()
    }

    func getAllTasks(){
        let url=URL(string: "http://192.168.1.228:8000/getTasks/")
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler:{
            data, response, error in
//            print(data)
            do{
                if let jsonResult = try JSONSerialization.jsonObject(with:data!, options: .mutableContainers) as? NSDictionary{
//                    print(jsonResult)
                    let tasks = jsonResult["tasks"] as! NSMutableArray
                    for task in tasks{
                        let taskFixed = task as! NSDictionary
                        self.tableData.append(taskFixed["name"] as! String)
                    }
                    DispatchQueue.main.async{
                        self.tableView.reloadData()
                    }
                }
            }
            catch{
                print(error)
            }
        })
        task.resume()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath)
        cell.textLabel?.text = tableData[indexPath.row]
        return cell
    }

}

