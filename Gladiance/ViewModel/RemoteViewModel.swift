//
//  RemoteViewModel.swift
//  Gladiance
//
//  Created by Nikhil Malwade on 11/05/24.
//

import Foundation



class RemoteViewModel{
    
    static let shared:RemoteViewModel = RemoteViewModel()
   
    var eventHandler: ((_ event: Event) -> Void)? // Data Binding Closure
    var eventHandler1: ((_ event: updated) -> Void)? // Data Binding Closure

    var areaLandingDic : areaLandingModel!
    var areaDataModel: areaLandingDataModel!
    var guestArr:[GuestControls] = []
    var controlArr:[Controls] = []
    
    var nodeConfigDic : nodeConfigModel!
    var InfoDic : Info!
    var DevicesDic : [Devices] = []
    var ServiceicesDic : [Serviceices] = []
    var AttributesDic : [Attributes] = []
    var ParamsDic : [Params] = []
    
    

    
    func areaLandingApicall(){
        self.eventHandler?(.loading)
        ApiCaller.shared.areaLandingPageApi() { [self] result in
            self.eventHandler?(.stopLoading)
            
            switch result{
                
            case .success(let resultdata):
                self.areaLandingDic = resultdata
                
                if self.areaLandingDic.successful == true{
                    self.areaDataModel = self.areaLandingDic.data
                    guestArr.removeAll()
                    controlArr.removeAll()
                    var arr = []

                    for i in self.areaDataModel.guestControls ?? []{
                        guestArr.append(i)
                        controlArr.append(contentsOf: i.controls!)
                        print(guestArr)
                        
                    }
                    for i in self.controlArr{
                        arr.append(i.nodeId!)
                    }
                    NodeId = (arr[0]) as! String
                    print("----------------------\(arr[0])")
                    nodeConfigApiCall(node: NodeId) { success in
                        if success{
                            print("true")
                        }
                    }
                    self.eventHandler?(.dataLoaded)
                    self.eventHandler1?(.dataUpdated)

                }
            case .failure(_):
                print("error")
            }
        }
    }
    
    func nodeConfigApiCall(node: String, completion:@escaping (Bool) -> Void){
        self.eventHandler?(.loading)
        
        ApiCaller.shared.nodeConfigApi(node: node) { [self] result  in
    
        
       
            self.eventHandler?(.stopLoading)
            
            switch result{
                
            case .success(let resultdata):
                
                DevicesDic.removeAll()
                AttributesDic.removeAll()
                ParamsDic.removeAll()
                ServiceicesDic.removeAll()
                self.nodeConfigDic = resultdata
                print(nodeConfigDic.node_id!)
                self.InfoDic = nodeConfigDic.info
                
                for i in self.nodeConfigDic.devices ?? []{
                    self.DevicesDic.append(i)
                    print(DevicesDic)
                }
                for i in DevicesDic{
                    AttributesDic.append(contentsOf: i.attributes!)
                }
                
                for i in DevicesDic{
                    ParamsDic.append(contentsOf: i.params!)
                }
                
                for i in self.nodeConfigDic.serviceices ?? []{
                    self.ServiceicesDic.append(i)
                    print(ServiceicesDic)
                }
                    self.eventHandler?(.dataLoaded)
                    self.eventHandler1?(.dataUpdated)
                completion(true)

            case .failure(_):
                print("error")
            }
        }
    }
}
