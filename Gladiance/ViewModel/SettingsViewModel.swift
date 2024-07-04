//
//  SettingsViewModel.swift
//  Gladiance
//
//  Created by Nikhil Malwade on 02/07/24.
//

import Foundation


final class SettingsViewModel{
    
    static let shared:SettingsViewModel = SettingsViewModel()
    
    var eventHandler: ((_ event: Event) -> Void)? // Data Binding Closure
    
    var SceneListDic : SceneListModel!

    var ObjectTagDic : [ObjectTag] = []
    var ConfigurationsDic : [Configurations] = []
    
    func sceneListApicall(){
        self.eventHandler?(.loading)
        ApiCaller.shared.sceneListApi() { [self] result in
            self.eventHandler?(.stopLoading)
            
            switch result{
                
            case .success(let resultdata):
                self.SceneListDic = resultdata
                
                if self.SceneListDic.successful == true{
                    self.ObjectTagDic = self.SceneListDic.objectTag!
                    ObjectTagDic.removeAll()
                    ConfigurationsDic.removeAll()
                    for i in self.SceneListDic.objectTag ?? []{
                        ObjectTagDic.append(i)
//                        ConfigurationsDic.append(contentsOf: i.configurations!)
                    }
                    
//                    for i in self.ObjectTagDic{
//                        ConfigurationsDic.append(contentsOf: i.configurations!)
//                    }
                    print(ObjectTagDic)
                    self.eventHandler?(.dataLoaded)

                }
            case .failure(_):
                print("error")
            }
        }
    }
    
    func sceneApicall(){
        self.eventHandler?(.loading)
        ApiCaller.shared.sceneListApi() { [self] result in
            self.eventHandler?(.stopLoading)
            
            switch result{
                
            case .success(let resultdata):
                self.SceneListDic = resultdata
                
                if self.SceneListDic.successful == true{
                    self.ObjectTagDic = self.SceneListDic.objectTag!
                   
                    for i in self.SceneListDic.objectTag ?? []{
                        ObjectTagDic.append(i)
                        ConfigurationsDic.append(contentsOf: i.configurations!)
                    }
                    print(ObjectTagDic)
                    self.eventHandler?(.dataLoaded)

                }
            case .failure(_):
                print("error")
            }
        }
    }
}
