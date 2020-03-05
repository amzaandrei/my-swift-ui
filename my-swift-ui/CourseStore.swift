//
//  CourseStore.swift
//  my-swift-ui
//
//  Created by Amza Andrei on 3/5/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import SwiftUI
import Contentful
import Combine

let client = Client(spaceId: "d95pq52nsa8c", accessToken: "UD3_5i2GyqoMzOuUH0nKOFE8hjREd5J8IJcmVADZABc")

func getArray(id: String, completion: @escaping ([Entry]) -> ()){
    let query = Query.where(contentTypeId: id)
    
    client.fetchArray(of: Entry.self, matching: query){ result in
        switch result{
        case .success(let arr):
            DispatchQueue.main.async {
                completion(arr.items)
            }
        case .error(let err):
            print(err.localizedDescription)
        }
    }
}

class CourseStore: ObservableObject {
    
    @Published var courses: [Course] = coursesData
    
    init() {
        getArray(id: "course") { (items) in
            items.forEach { (item) in
                
                let colors = [#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1),#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1),#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1),#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1),#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)]
                let logos = [#imageLiteral(resourceName: "Logo1"),#imageLiteral(resourceName: "Logo3"),#imageLiteral(resourceName: "Logo2")]
                
                guard let imageUrl = item.fields.linkedAsset(at: "image")?.url?.absoluteString else { return }
                guard let image = downloadImage(urlStr: imageUrl) else { return }
                
                
                let course = Course(title: item.fields["title"] as! String,
                                    subtitle: item.fields["subtitle"] as! String,
                                    image: image,
                                    logo: logos.randomElement()!,
                                    color: colors.randomElement()!,
                                    show: false
                )
                self.courses.append(course)
            }
        }
    }
}

func downloadImage(urlStr: String) -> UIImage? {
    
    guard let url = URL(string: urlStr) else { return nil }
    
    var img: UIImage!
    
    let dispatch = DispatchGroup()
    dispatch.enter()
    URLSession.shared.dataTask(with: url) { (data, _, err) in
        if err != nil{
            print(err?.localizedDescription)
//            dispatch.leave()
            return
        }
        if let dataEx = data{
            img = UIImage(data: dataEx)
            dispatch.leave()
        }
    }.resume()
    dispatch.wait()
    return img
}

