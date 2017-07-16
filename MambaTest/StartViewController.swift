//
//  StartViewController.swift
//  MambaTest
//
//  Created by Andrey Ildyakov on 16.07.17.
//  Copyright © 2017 Andrey Ildyakov. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    let segueIdenitifer = "startIdentifier"

    @IBAction func startAction(_ sender: Any) {
        self.performSegue(withIdentifier: segueIdenitifer, sender: nil)
    }
    weak var viewModel: StartViewModel!


    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(true, animated: false)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdenitifer ,
            let nextScene = segue.destination as? CityTableViewController{
            
            nextScene.viewModel = self.viewModel.cityViewModel()

        }
    }




}
