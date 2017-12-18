//
//  Control.swift
//  clima4
//
//  Created by Alejandro on 21/10/17.
//  Copyright © 2017 Alejandro. All rights reserved.
//

import UIKit

class Control: UIViewController {

    
    @IBOutlet weak var temp: UILabel!
    var codigo = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urls1 = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22"
        let urls2 = "%2Ccn%22)%20and%20u%3D%22c%22&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"
        let url = NSURL(string : urls1 + codigo + urls2)
        let datos = NSData(contentsOf: url! as URL)
        do{
            let json = try JSONSerialization.jsonObject(with: datos! as Data, options: JSONSerialization.ReadingOptions.mutableLeaves)
            let diccionario1 = json as! NSDictionary
            let diccionario2 = diccionario1["query"] as! NSDictionary
            let diccionario3 = diccionario2["results"] as! NSDictionary
            let diccionario4 = diccionario3["channel"] as! NSDictionary
            let diccionario6 = diccionario4["item"] as! NSDictionary
            let diccionario7 = diccionario6["condition"] as! NSDictionary
            let temperatura = diccionario7["temp"] as! NSString as String
              self.temp.text = temperatura
        }
        catch _ {
            
        }
        
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
