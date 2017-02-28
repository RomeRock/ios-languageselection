//
//  CurrentLanguageViewController.swift
//  LanguageSelection
//
//  Created by NDM on 2/28/17.
//  Copyright © 2017 Rome Rock. All rights reserved.
//

import UIKit

class CurrentLanguageViewController: UIViewController {

    var languages = [Language]()
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var languageLabel: UILabel!
    @IBOutlet var changeLanguageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setLanguage()
        
        NotificationCenter.default.addObserver(self, selector: #selector(CurrentLanguageViewController.setLanguage), name: .updateLanguage, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }

    @IBAction func okButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setLanguage() {
        titleLabel.text = "POPUP_TITLE".localized()
        languageLabel.text = "CURRENT_LANG".localized()
        changeLanguageButton.setTitle("CHANGE_LANG".localized(), for: .normal)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.destination is LanguageTableViewController {
            let destination = segue.destination as! LanguageTableViewController
            destination.languages = languages
        }
    }
    

}
