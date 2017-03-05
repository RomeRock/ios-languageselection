//
//  HomeViewController.swift
//  LanguageSelection
//
//  Created by NDM on 2/27/17.
//  Copyright © 2017 Rome Rock. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet var menuItem: UIBarButtonItem!
    @IBOutlet var contentView: UIView!
    @IBOutlet var selectLanguageButton: UIButton!
    @IBOutlet var languageLabel: UILabel!
    @IBOutlet var useDefaultButton: UIButton!
    @IBOutlet var languageTitleLabel: UILabel!
    
    var languages:[Language] = [Language(languageCode: "en", languageName: "ENGLISH"), Language(languageCode: "es", languageName: "ESPAÑOL"), Language(languageCode: "fr", languageName: "FRANÇAIS")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuItem.target = self.revealViewController()
            menuItem.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController().panGestureRecognizer().delegate = self
        }
        
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 1)
        contentView.layer.shadowOpacity = 0.4
        contentView.layer.shadowRadius = 0
        contentView.layer.cornerRadius = 2
        
        setLanguage()
        
        NotificationCenter.default.addObserver(self, selector: #selector(HomeViewController.setLanguage), name: .updateLanguage, object: nil)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "firstLoad") {
            UserDefaults.standard.set(false, forKey: "firstLoad")
            performSegue(withIdentifier: "languageSelection", sender: self)
        }
        
    }
    
    func setLanguage() {
        languageLabel.text = "CURRENT_LANG".localized()
        languageTitleLabel.text = "LANGUAGE".localized()
        useDefaultButton.setTitle("USE_DEFAULT".localized(), for: .normal)
        selectLanguageButton.setTitle("SELECT_LANG".localized(), for: .normal)
    }

    @IBAction func useDefaultButtonPressed(_ sender: Any) {
        var currentLanguage:String = "en"
        let currentIdentifier:String = Locale.current.identifier
        if currentIdentifier.hasPrefix("es") {
            currentLanguage = "es"
        } else if currentIdentifier.hasPrefix("fr") {
            currentLanguage = "fr"
        }
        UserDefaults.standard.set(currentLanguage, forKey: "currentLanguage")
        setLanguage()
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
        
        if segue.destination is UINavigationController {
            if (segue.destination as! UINavigationController).viewControllers[0] is CurrentLanguageViewController {
                let destination:CurrentLanguageViewController = (segue.destination as! UINavigationController).viewControllers[0] as! CurrentLanguageViewController
                destination.languages = languages
            }
        }
    }
    

}
