//
//  JokesViewModel.swift
//  JokesApp
//
//  Created by Mac on 21/10/22.
//

import Foundation



class JokesViewModel{
    
    var arrUser = [String]()
    weak var vc: ViewController?
    func getAllJokesData(){
        URLSession.shared.dataTask(with: URL(string: "https://geek-jokes.sameerkumar.website/api")!) { data, response, error in
            if error == nil{
                if let data = data{
                    do{
                        let userResponse = try JSONDecoder().decode(String.self, from: data)
                        print(userResponse)
                        if self.arrUser.count == 10{
                            self.arrUser.remove(at: 0)
                            self.arrUser.append(userResponse)
                        }else{
                          self.arrUser.append(userResponse)
                        }
                    }catch let err{
                        print(err.localizedDescription)
                    }
                }
            }else{
                error?.localizedDescription
            }
        }.resume()
    }

}



