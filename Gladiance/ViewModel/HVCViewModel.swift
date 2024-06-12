//
//  HVCViewModel.swift
//  Gladiance
//
//  Created by Nikhil Malwade on 08/05/24.
//

import Foundation
import UIKit

final class HVCViewModel: UIViewController{
    
    var loginLandingDataArr : LoginLandingData!
    var data: Data!
    var projectsdata:[Projects] = []
    
    var ProductLandingDic : ProductLandingModel!
    var dataModel: ProductDataModel!
    var ProductLandingArr:[ProductSpaceGroups] = []
    
    var SpaceGroupLandingDic : SpaceGroupLandingModel!
    var SpaceGroupDataModel: DataModelSpaceGroup!
    var SpaceGroupArr:[Spaces] = []
    
    var SpaceLandingDic : SpaceLandingModel!
    var SpaceDataModel: DataModelSpace!
    var areasArr:[Areas] = []
    
    var eventHandler: ((_ event: Event) -> Void)? // Data Binding Closure
    var eventHandler1: ((_ event: updated) -> Void)? // Data Binding Closure

    
    static let shared = HVCViewModel()
    
    var viewmodel = RemoteViewModel()
    
    //MARK: Login Landing Api call
    func apicaller(){
        
        ApiCaller.shared.LoginLandingPageApi { [self] result,err in
            loginLandingDataArr = result
            if loginLandingDataArr.successful == true{

                data = loginLandingDataArr.data
                for i in data.projects ?? []{
                    projectsdata.append(i)
                }
            }
        }
    }
    
    //MARK: Product Landing Api call

    func ProductApiCall(ref:String){
        
        self.eventHandler?(.loading)
        ApiCaller.shared.ProductLandingPageApi() { result in
            self.eventHandler?(.stopLoading)

            
            switch result{
            case .success(let resultdata):
                print("success")

                self.ProductLandingDic = resultdata
                
                if self.ProductLandingDic.successful == true{
                    self.dataModel = self.ProductLandingDic.data
                    var arr = []
                    for i in self.dataModel.spaceGroups ?? []{
                        self.ProductLandingArr.append(i)
                        arr.append(i.gAAProjectSpaceGroupRef!)
                    }
//                    self.SpaceGroupArr.removeAll()
                    self.spaceGroupLandingApicall()
                    self.eventHandler?(.dataLoaded)
                }
            case .failure(_):
                print("Error")
            }
        }
    }
    
    //MARK: Space group Landing Api call

    func spaceGroupLandingApicall(){
        self.eventHandler?(.loading)
        ApiCaller.shared.SpaceGroupLandingPageApi() { [self] result in
            self.eventHandler?(.stopLoading)
            
            switch result{
                
            case .success(let resultdata):

                self.SpaceGroupLandingDic = resultdata
                
                if self.SpaceGroupLandingDic.successful == true{

                    self.SpaceGroupDataModel = self.SpaceGroupLandingDic.data
                    var arr = []
                    var spacerefArr = []
                    self.SpaceGroupArr.removeAll()
                    
                    for i in self.SpaceGroupDataModel.spaces ?? []{
                        SpaceGroupArr.append(i)
                        arr.append(i.gAAProjectSpaceName!)
                        spacerefArr.append(i.gAAProjectSpaceRef!)
                    }
                    print(SpaceGroupArr)

                    let Id = (spacerefArr[0]) as! Int
                    ProjectSpaceRef = "\(Id)"
                    SpaceName = arr[0] as! String
//                    self.eventHandler1?(.dataUpdated)

                    self.eventHandler?(.dataLoaded)
                }
            case .failure(_):
                print("error")
            }
        }
    }
    
    //MARK: Space Landing Api call

    func spaceLandingApicall(){
        self.eventHandler?(.loading)
        ApiCaller.shared.SpaceLandingPageApi() { [self] result in
            self.eventHandler?(.stopLoading)
            
            switch result{
                
            case .success(let resultdata):

                self.SpaceLandingDic = resultdata
                
                if self.SpaceLandingDic.successful == true{
                    self.SpaceDataModel = self.SpaceLandingDic.data
                    var arr = []
                    var arr1 = []
                    areasArr.removeAll()
                    for i in self.SpaceDataModel.areas ?? []{
                        areasArr.append(i)
                        arr.append(i.gAAProjectSpaceTypeAreaRef!)
                        arr1.append(i.gAAProjectSpaceTypeAreaName!)

                        print(SpaceGroupArr)
                    }
                    let Id = (arr[0]) as! Int
                    ProjectSpaceTypeAreaRef = "\(Id)"
                    print("----------------------\(arr[0])")
                    self.eventHandler?(.dataLoaded)
                }
            case .failure(_):
                print("error")
            }
        }
    }
}

