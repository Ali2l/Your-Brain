//
//  CatagoryViewController.swift
//  Your Brain
//
//  Created by Ali Al-khowaiter on 3/9/19.
//  Copyright © 2019 Ali Al-khowaiter. All rights reserved.
//

import UIKit
import CoreData


class CatagoryViewController: UITableViewController {
    
    var catagoryArray = [Catagory]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        loadCatagory()
        
    }
    
    
    //MARK:- TableView Datasource Method
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catagoryArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "catagoryItemCell", for: indexPath)
        
        let catagory = catagoryArray[indexPath.row]
        
        cell.textLabel?.text = catagory.name
        
        return cell
    }
    
    
    //MARK:- TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToCategory", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! YourBrainListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = catagoryArray[indexPath.row]
        }
    }
    
    
    
    
    
    
    //MARK:- Add New Catagories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Catagory", style: .default) { (actoin) in
            
            let newCatagory = Catagory(context: self.context)
            newCatagory.name = textField.text!
            
            self.catagoryArray.append(newCatagory)
            
            self.saveCatagory()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Categoty"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
    }
    
    
    //MARK:- Data Manipulation Method
    func saveCatagory() {
        
        do {
            try context.save()
        } catch {
            print(error)
        }
        
        self.tableView.reloadData()
    }
    
    func loadCatagory(with request : NSFetchRequest<Catagory> = Catagory.fetchRequest()) {
        
        do {
            catagoryArray = try context.fetch(request)
        } catch {
            print(error)
        }
        
        tableView.reloadData()
    }
    
}
