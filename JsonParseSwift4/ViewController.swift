//
//  ViewController.swift
//  JsonParseSwift4
//
//  Created by Anthony Ruiz on 3/23/18.
//  Copyright © 2018 Jakaboy. All rights reserved.
//

import UIKit

struct WebsiteDescription: Decodable {
   let name: String
   let description: String
   let courses: [Course]
}

struct Course: Decodable {
   let id: Int
   let name: String
   let link: String
   let imageUrl: String
}

class ViewController: UIViewController {

   override func viewDidLoad() {
      super.viewDidLoad()
      
      let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
      guard let url = URL(string: jsonUrlString) else{
         return
      }
      
      URLSession.shared.dataTask(with: url) { (data, error, err) in
      
         guard let data =  data else {return}
         
         do{
            
            let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
            print(websiteDescription.name)
            for json in websiteDescription.courses  {
               print(json.name)
            }
            
//            let courses = try JSONDecoder().decode([Course].self, from: data)
//            print(courses)
            
         }catch let jsonErr{
            print("error", jsonErr)
         }
         
      }.resume()
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }
}

