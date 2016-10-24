//
//  IntroViewController.swift
//  carousel
//
//  Created by Monith Ilavarasan on 10/21/16.
//  Copyright © 2016 Monith Ilavarasan. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    
    @IBOutlet weak var introScrollView: UIScrollView!
    
    
    @IBOutlet weak var introImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        introScrollView.contentSize = introImage.frame.size

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
