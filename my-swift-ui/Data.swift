//
//  Data.swift
//  my-swift-ui
//
//  Created by Amza Andrei on 3/4/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import SwiftUI

struct Post: Codable, Identifiable {
    
    let id = UUID()
    var title: String
    var body: String
    
}

class Api {
    
    func getPost(completion: @escaping ([Post]) -> ()){
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, err) in
            if err != nil{
                print(err?.localizedDescription)
                return
            }
            let posts = try! JSONDecoder().decode([Post].self, from: data!)
            
            DispatchQueue.main.async {
                completion(posts)
            }
        }.resume()
        
    }
    
}
