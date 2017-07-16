//
//  CityDetailViewController.swift
//  MambaTest
//
//  Created by Andrey Ildyakov on 16.07.17.
//  Copyright © 2017 Andrey Ildyakov. All rights reserved.
//

import UIKit

class CityDetailViewController: UIViewController {
    
    weak var viewModel: CityTableViewModel!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loaderDescription: UILabel!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var countTextField: UITextField!
    @IBAction func addAction(_ sender: Any) {
        self.rightAction()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupLoader(value: false)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func setupLoader(value:Bool) {
        if !value {
            activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
            loaderDescription.isHidden = true
            addButton.isHidden = false
            self.navigationItem.rightBarButtonItem?.isEnabled = true
        } else {
            activityIndicator.startAnimating()
            activityIndicator.isHidden = false
            loaderDescription.isHidden = false
            addButton.isHidden = true
            self.navigationItem.rightBarButtonItem?.isEnabled = false
        }
    }
    
    private func setupNavigationBar() {
        
        self.navigationItem.title = "Новый город"
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Отмена", style: .plain, target: self, action: #selector(CityTableViewController.leftAction))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Добавить", style: .plain, target: self, action: #selector(CityTableViewController.rightAction))
        
        
        self.navigationController!.setNavigationBarHidden(false, animated: false)
        
        
    }
    func leftAction() {
        _ = navigationController?.popViewController(animated: true)
    }
    func rightAction() {
        self.setupLoader(value: true)

        self.viewModel.addCityDetailsViewModel(name: nameTextField.text!, count: countTextField.text!, completion: {
            alert in

            if alert {
                let alert = UIAlertController(title: "Ошибка", message: "Некорректные данные", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ок", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                self.setupLoader(value: false)

            } else {
                self.performSegue(withIdentifier: "unwindToTable", sender: nil)
            }
        })
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
