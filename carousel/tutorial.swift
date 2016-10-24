//
//  tutorial.swift
//  carousel
//
//  Created by Monith Ilavarasan on 10/23/16.
//  Copyright © 2016 Monith Ilavarasan. All rights reserved.
//

import UIKit

class tutorial: UIViewController {

    
    @IBOutlet weak var tutorialScroll: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tutorialScroll.contentSize = CGSize(width: 1280, height: 568)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
