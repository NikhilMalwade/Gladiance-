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
    
//    var SelectedProductArr = [String]()
//    var SelectedRefArr = [Int]()
    
//    var SpaceLandingDic : SpaceLandingModel!
//    var SpaceDataModel: DataModelSpace!
//    var areasArr:[Areas] = []
    
    
    func areaLandingApicall(ref: String){
        self.eventHandler?(.loading)
        ApiCaller.shared.areaLandingPageApi(ref: ref) { [self] result in
            self.eventHandler?(.stopLoading)
            
            switch result{
                
            case .success(let resultdata):
                self.areaLandingDic = resultdata
                
                if self.areaLandingDic.successful == true{
                    self.areaDataModel = self.areaLandingDic.data
                    guestArr.removeAll()
                    controlArr.removeAll()
                    for i in self.areaDataModel.guestControls ?? []{
                        guestArr.append(i)
                        controlArr.append(contentsOf: i.controls!)
                        print(guestArr)
                    }
                    self.eventHandler1?(.dataUpdated)

//                    self.eventHandler?(.dataLoaded)
                }
            case .failure(_):
                print("error")
            }
        }
    }
}
