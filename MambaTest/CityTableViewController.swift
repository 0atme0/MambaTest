//
//  CityTableViewController.swift
//  MambaTest
//
//  Created by Andrey Ildyakov on 16.07.17.
//  Copyright © 2017 Andrey Ildyakov. All rights reserved.
//

import UIKit

class CityTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    let cellIdentifier = String(describing: CityTableViewCell.self)
    let segueIdenitifer = "detailIdentifier"
    
    weak var viewModel: CityTableViewModel! {
        didSet {
            self.updateTable()
        }
    }
    
    private func updateTable() {
        viewModel.updateCity {
            if (self.activityIndicator != nil) {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
            }
            if (self.tableView != nil){self.tableView.reloadData()}
            if (self.navigationController != nil) {self.setupNavigationBar()}
            
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        setupActivity()
        setupTableView()

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - table view
    
    private func setupActivity() {
        self.activityIndicator.isHidden = !viewModel.isFirstTime()
        self.activityIndicator.startAnimating()
    }
    
    private func setupTableView() {
        self.tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 200
        self.tableView.contentInset.top = 20
    }
    
    private func setupNavigationBar() {
        
        self.navigationItem.title = "Города"
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Изменить", style: .plain, target: self, action: #selector(CityTableViewController.leftAction))

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Добавить", style: .plain, target: self, action: #selector(CityTableViewController.rightAction))

        
        self.navigationController!.setNavigationBarHidden(false, animated: false)

        
    }
     func leftAction() {
      self.tableView.setEditing(true, animated: true)

    }
     func rightAction() {
        self.performSegue(withIdentifier: segueIdenitifer, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if self.viewModel.numberOfCities() > 0 {
            tableView.separatorColor = UIColor.lightGray
        } else {
            tableView.separatorColor = UIColor.clear
        }
        return self.viewModel.numberOfCities()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? CityTableViewCell
        if cell == nil {
            cell = UINib(nibName: cellIdentifier, bundle: nil).instantiate(withOwner: nil, options: nil).first as? CityTableViewCell
        }
        cell!.viewModel = self.viewModel.cellViewModel(index: indexPath.row)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            print(indexPath)
            self.viewModel.deleteCell(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if (self.tableView.isEditing) {
            return UITableViewCellEditingStyle.delete
        }
        return UITableViewCellEditingStyle.none
    }

    
    @IBAction func unwindSeguefromDetail(_ sender: UIStoryboardSegue)
    {
        self.updateTable()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdenitifer ,
            let nextScene = segue.destination as? CityDetailViewController{
            
            nextScene.viewModel = self.viewModel
            
        }
    }
    
}


