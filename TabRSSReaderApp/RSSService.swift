//
//  RSSReaderService.swift
//  RSSReaderApp
//
//  Created by 川崎 隆介 on 2015/12/19.
//  Copyright (c) 2015年 川崎 隆介. All rights reserved.
//

import UIKit

class RSSService: NSObject {
    let sites = ["http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://rss.itmedia.co.jp/rss/2.0/news_bursts.xml&num=8","http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://news.yahoo.co.jp/pickup/rss.xml&num=8"]
    var delegate:ParserDelegate?
    
    func requestRSS() {
        if let settings = Settings.loadPropertyList() {
            if let selectSegment = settings["SelectSite"] as? Int  {
                if let url = URL(string: sites[selectSegment]) {
                    let request = URLRequest(url: url)
                    let session = URLSession.shared
                    let task = session.dataTask(with:request, completionHandler:self.responseRSS)
                    task.resume()
                }
            }
        }
        
    }

    func responseRSS(data:Data?,res:URLResponse?,error:Error?){
            var entries:Array<[String:AnyObject]> = []
            if let resData = data {
                do {
                    let json = try JSONSerialization.jsonObject(with:resData) as! NSDictionary
                    let responseDataDic = json["responseData"] as! NSDictionary
                    let feed = responseDataDic["feed"] as! NSDictionary
                    entries = feed["entries"] as! Array<[String:AnyObject]>
                } catch {
                }
            }
            if let d = delegate {
                d.parserDidParse(entries)
            }
    }
}
