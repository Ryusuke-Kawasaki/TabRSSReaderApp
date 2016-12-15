//
//  Sites.swift
//  TabRSSReaderApp
//
//  Created by 川崎 隆介 on 2015/11/30.
//  Copyright (c) 2015年 川崎 隆介. All rights reserved.
//

import Foundation

struct Settings {
    
    
    static func loadPropertyList()->NSDictionary? {
        if let path = Bundle.main.path(forResource: "Setting", ofType: "plist"){
            if let dic = NSDictionary(contentsOfFile: path) {
                return dic
            }
        }
        return nil
    }
    
    static func savePropertyList(_ dic:NSDictionary) {
        if let path = Bundle.main.path(forResource: "Setting", ofType: "plist"){
            dic.write(toFile: path, atomically: true)
        }
    }
}
