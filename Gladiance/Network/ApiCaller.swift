//
//  ApiCaller.swift
//  Gladiance
//
//  Created by Nikhil Malwade on 08/05/24.
//

import Foundation
import UIKit

class ApiCaller: UIViewController {
    static let shared = ApiCaller()
    
    //Login Api
    
    func loginApi(username:String,password:String, completion: @escaping ([String: Any]?, Error?) -> Void) {
        //print(DeviceID)
        //            setLoading()
        guard let url = URL(string: baseURL.rawValue + ApiNodes.loginuser.rawValue) else {
            return
        }
        let json: [String: Any] = ["UserId": username,"Password":password,"LoginDeviceId":DeviceID]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        //print(request)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                completion(nil,error)
                return
            }
            do{
                let responseJSON = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                LoginToken = responseJSON!["LoginToken"] as! String
                UserName = responseJSON!["UserDisplayName"] as! String
                
                completion(responseJSON,nil)
            }catch{
                completion(nil,error)
            }
        }
        
        task.resume()
        
    }
    //loging Landing Page Data
    
    
    func LoginLandingPageApi(completion: @escaping (LoginLandingData, Error?) -> () ){
       

        guard let url = URL(string: baseURL.rawValue + ApiNodes.loginlandingpagedata.rawValue + LoginToken + "/" + DeviceID ) else {
            return
        }
        //print(url)
        guard let url =  URL(string:  "https://api.gladiance.one/gladiancecloud-web-api/mobileapp/loginlandingpagedata/1DF32C0B61E4400691ECEA80D699A4D4/EE8EF6EC-BF9F-4416-B75C-AC624E7D9433") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {return}
            
            do {
                let response = try JSONDecoder().decode(LoginLandingData.self, from: data)
                // print(response)

                completion(response,nil)
            }catch{
                
            }
        }.resume()
    }
    
    //MARK: Product Landing Page Data
    
    func ProductLandingPageApi(completion: @escaping (Result<ProductLandingModel, Error>) -> () ){
        

        guard let url = URL(string: baseURL.rawValue + Endpoints.projectlandingpagedata.rawValue + ProjectRef + "/" + LoginToken + "/" + DeviceID ) else {
            return
        }
         print(url)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {return}
            
            do {
                let response = try JSONDecoder().decode(ProductLandingModel.self, from: data)
                //print(response)
                var dic = response.data?.spaceGroups
                var arr = []
                for i in dic ?? []{
                    arr.append(i.gAAProjectSpaceGroupRef!)
                }

                completion(.success(response))
            }catch{
                completion(.failure(error))
            }
        }.resume()
    }
    
    func SpaceGroupLandingPageApi(completion: @escaping (Result<SpaceGroupLandingModel, Error>) -> () ){
      

        guard let url = URL(string: baseURL.rawValue + Endpoints.spacegrouplandingpagedata.rawValue + ProjectSpaceGroupRef + "/" + LoginToken + "/" + DeviceID ) else {
            return
        }
        print(url)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {return}
            
            do {
                let response = try JSONDecoder().decode(SpaceGroupLandingModel.self, from: data)

                completion(.success(response))
            }catch{
                completion(.failure(error))
            }
        }.resume()
    }
    
    func SpaceLandingPageApi(completion: @escaping (Result<SpaceLandingModel, Error>) -> () ){
      

        guard let url = URL(string: baseURL.rawValue + Endpoints.spacelandingpagedata.rawValue + "/" + ProjectSpaceRef + "/" + LoginToken + "/" + DeviceID ) else {
            return
        }
        print(url)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {return}
            
            do {
                let response = try JSONDecoder().decode(SpaceLandingModel.self, from: data)

                completion(.success(response))
            }catch{
                completion(.failure(error))
            }
        }.resume()
    }
    
    func areaLandingPageApi(completion: @escaping (Result<areaLandingModel, Error>) -> () ){


        guard let url = URL(string: baseURL.rawValue + Endpoints.arealandingpageguestcontrols.rawValue + "/" + ProjectSpaceRef + "/" + ProjectSpaceTypeAreaRef + "/" + LoginToken + "/" + DeviceID ) else {
            return
        }
        print(url)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {return}
            
            do {
                let response = try JSONDecoder().decode(areaLandingModel.self, from: data)

                completion(.success(response))
            }catch{
                completion(.failure(error))
            }
        }.resume()
    }
    
    //MARK: Node Config Api
    
    func nodeConfigApi(node:String, completion: @escaping (Result<nodeConfigModel, Error>) -> () ){


        guard let url = URL(string: ApiNodes.NodeBaseUrl.rawValue + Endpoints.nodeconfig.rawValue + "/"   + node ) else {
            return
        }
        print(url)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {return}
            
            do {
                let response = try JSONDecoder().decode(nodeConfigModel.self, from: data)

                completion(.success(response))
            }catch{
                completion(.failure(error))
            }
        }.resume()
    }
    
    //MARK: Scene list Api
    
    func sceneListApi(completion: @escaping (Result<SceneListModel, Error>) -> () ){

        print(gAAProjectSpaceTypeAreaRef)
        guard let url = URL(string: baseURL.rawValue + Endpoints.scenelist.rawValue + "/" + gAAProjectSpaceTypeAreaRef + "/" + LoginToken + "/" + DeviceID ) else {
            return
        }
        print(url)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {return}
            
            do {
                let response = try JSONDecoder().decode(SceneListModel.self, from: data)

                completion(.success(response))
            }catch{
                completion(.failure(error))
            }
        }.resume()
    }
    
    func sceneApi(completion: @escaping (Result<SceneListModel, Error>) -> () ){

        print(gAAProjectSpaceTypeAreaRef)
        guard let url = URL(string: baseURL.rawValue + Endpoints.scene.rawValue + "/" + GAAProjectSceneRef + "/" + LoginToken + "/" + DeviceID ) else {
            return
        }
        print(url)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {return}
            
            do {
                let response = try JSONDecoder().decode(SceneListModel.self, from: data)

                completion(.success(response))
            }catch{
                completion(.failure(error))
            }
        }.resume()
    }
}

