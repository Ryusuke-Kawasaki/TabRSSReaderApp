//
//  SiteListViewController.swift
//  TabRSSReaderApp
//
//  Created by 川崎 隆介 on 2015/12/22.
//  Copyright (c) 2015年 川崎 隆介. All rights reserved.
//

import UIKit

class SiteListViewController: UIViewController {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func pushSegmentedControl(_ sender: AnyObject) {
        print(segmentedControl.numberOfSegments)
        let selectSegment = sender.selectedSegmentIndex
        let dic = ["SelectSite":selectSegment]
        Settings.savePropertyList(dic as NSDictionary)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let settings = Settings.loadPropertyList() {
            if let selectSegment = settings["SelectSite"] as? Int {
                segmentedControl.selectedSegmentIndex = selectSegment
            }
        }
    }
}
