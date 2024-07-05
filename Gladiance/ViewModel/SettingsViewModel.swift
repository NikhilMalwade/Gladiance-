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
    var ScheduleListDic : schedulelistModel!

    var ObjectTagDic : [ObjectTag] = []
    var ConfigurationsDic : [Configurations] = []
    var ScheduleListObjectTagDic : [schedulelistObjectTag] = []
    var ScheduleListConfigurationsDic : [schedulelistConfigurations] = []
    var TriggersDic : [Triggers] = []

    
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
//                    print(ObjectTagDic)
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
//                    print(ObjectTagDic)
                    self.eventHandler?(.dataLoaded)

                }
            case .failure(_):
                print("error")
            }
        }
    }
    
    func scheduleListApicall(){
        self.eventHandler?(.loading)
        ApiCaller.shared.scheduleListApi() { [self] result in
            self.eventHandler?(.stopLoading)
            
            switch result{
                
            case .success(let resultdata):
                self.ScheduleListDic = resultdata
                
                if self.ScheduleListDic.successful == true{
                    self.ScheduleListObjectTagDic = self.ScheduleListDic.objectTag!
                   
                    for i in self.ScheduleListDic.objectTag ?? []{
                        ScheduleListObjectTagDic.append(i)
                        ScheduleListConfigurationsDic.append(contentsOf: i.configurations!)
                        TriggersDic.append(contentsOf: i.triggers!)

                    }
                    print(ScheduleListConfigurationsDic.count)
                    print(TriggersDic.count)
//                    print(ScheduleListObjectTagDic)
                    self.eventHandler?(.dataLoaded)

                }
            case .failure(_):
                print("error")
            }
        }
    }
}
