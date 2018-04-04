//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by Tomasz Bogusz on 05.03.2018.
//  Copyright © 2018 Tomasz Bogusz. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {
    
    let themes = [
        "Sports":"ABCDEFGH",
        "Animals":"IJKLMNOP",
        "Faces":"QRSTUVWX"
    ]
    
    @IBAction func changeTheme(_ sender: Any) {
        if let cvc = splitViewDetailConcentrationViewController {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                cvc.theme = theme
            }
        } else {
            performSegue(withIdentifier: "CHOOSE_THEME", sender: sender)
        }
    }
    
    private var splitViewDetailConcentrationViewController: ConcentrationViewController? {
        return splitViewController?.viewControllers.last as? ConcentrationViewController
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "CHOOSE_THEME":
                if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                    if let destination = segue.destination as? ConcentrationViewController {
                        destination.theme = theme
                    }
                }
            default:
                break
            }
        }
    }

}
