//
//  RoomControllViewController.swift
//  Gladiance
//
//  Created by Nikhil Malwade on 02/05/24.
//

import UIKit

class RoomControllViewController: UIViewController {
    
    @IBOutlet weak var tabCollectionView: UICollectionView!
    @IBOutlet weak var SpaceCollectionView: UICollectionView!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    @IBOutlet weak var lblTabName: UILabel!
    @IBOutlet weak var shview: UIView!
    @IBOutlet weak var lblSpaceName: UILabel!
    
    var viewmodel = HVCViewModel()
    var viewmodel1 = RemoteViewModel()
    var nodeID = ""
    var SwitchName = ""
    var Switch = Bool()
    var SwitchCount = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewmodel.spaceGroupLandingApicall()
        self.lblSpaceName.text = "\(SpaceName)"
        Switch = false
        getSpaceLandingData()
        self.navigationController?.interactivePopGestureRecognizer!.delegate = self;
        self.navigationController?.isNavigationBarHidden = true
        setRoundCornerToView(mnView: shview, radius: 15)
        
        RegisterCell()
        observeEvent()
    }
    
    func getSpaceLandingData(){
        self.viewmodel.spaceLandingApicall()
        do {
            sleep(1)
            getAreaLandingData()
        }
    }
    func getAreaLandingData(){

        self.viewmodel1.areaLandingApicall()
        homeCollectionView.reloadData()

    }
    
    func observeEvent() {
        viewmodel.eventHandler = { [weak self] event in
            guard let self else { return }
            switch event {
            case .loading:
                print("Product loading....")
            case .stopLoading:
                print("Stop loading...")
            case .dataLoaded:
                print("Data loaded...")
                DispatchQueue.main.async {
                    self.SpaceCollectionView.reloadData()
                    self.tabCollectionView.reloadData()
                    self.homeCollectionView.reloadData()
                }
            case .error(let error):
                print(error!)
            }
        }
        viewmodel1.eventHandler = { [weak self] event in
            guard let self else { return }
            switch event {
            case .loading:
                print("Product loading....")
            case .stopLoading:
                print("Stop loading...")
            case .dataLoaded:
                print("Data loaded...")
                DispatchQueue.main.async {
                    self.SpaceCollectionView.reloadData()
                    self.tabCollectionView.reloadData()
                    self.homeCollectionView.reloadData()
                }
            case .error(let error):
                print(error!)
            }
        }
    }
    
    func nodeid(nodeid : String){
        viewmodel1.nodeConfigApiCall(node: nodeid) { success in
            if success{
                for dic in self.viewmodel1.DevicesDic{
                    print(dic.type)
                    if dic.type == "esp.device.light"{
                        DispatchQueue.main.async {
                            let vc = self.storyboard!.instantiateViewController(withIdentifier: "CoveViewController") as! CoveViewController
//                            vc.modalPresentationStyle = .currentContext
//                            self.present(vc, animated: true)
                            
                            self.navigationController?.pushViewController(vc, animated:  true)
                        }
                    } else if dic.type == "esp.device.switch"{
                        DispatchQueue.main.async {

                            let vc = self.storyboard!.instantiateViewController(withIdentifier: "SwitchViewController") as! SwitchViewController
                            vc.gAAProjectSpaceTypePlannedDeviceName = self.SwitchName
                            self.navigationController?.pushViewController(vc, animated:  true)
                        }
                    }
                    else if dic.type == "esp.device.fan"{
                        DispatchQueue.main.async {
                            let vc = self.storyboard!.instantiateViewController(withIdentifier: "FanViewController") as! FanViewController
                            self.navigationController?.pushViewController(vc, animated:  true)
                            
                        }
                    }
                    else{
                        
                    }
                }  
            }
        }
        print("completed")
    }
 
}

extension RoomControllViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func RegisterCell(){
        self.tabCollectionView.register(UINib(nibName: "TabsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TabsCollectionViewCell")
        self.SpaceCollectionView.register(UINib(nibName: "TabsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TabsCollectionViewCell")
        self.homeCollectionView.register(UINib(nibName: "HomeTabCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeTabCollectionViewCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == SpaceCollectionView {
            self.tabCollectionView.reloadData()
            return viewmodel.areasArr.count
            
        }
        else if collectionView == tabCollectionView {
            self.homeCollectionView.reloadData()
            return viewmodel1.guestArr.count
        }
        else{
            if Switch{
                return SwitchCount

            }else{
                return viewmodel1.controlArr.count

            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == SpaceCollectionView{
            
            let cell = SpaceCollectionView.dequeueReusableCell(withReuseIdentifier: "TabsCollectionViewCell", for: indexPath) as! TabsCollectionViewCell
            let dic = viewmodel.areasArr[indexPath.row]
            cell.lblTabName.text = dic.gAAProjectSpaceTypeAreaName!
            
            return cell
            
        } else if collectionView == tabCollectionView{

            let cell = tabCollectionView.dequeueReusableCell(withReuseIdentifier: "TabsCollectionViewCell", for: indexPath) as! TabsCollectionViewCell

                
                let dic = viewmodel1.guestArr[indexPath.row]
                print(viewmodel1.guestArr)
                    cell.lblTabName.text = dic.controlTypeName!
          
            return cell
        }
        else
        {
            let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeTabCollectionViewCell", for: indexPath) as! HomeTabCollectionViewCell
            
            
            if Switch{
                cell.lblTabName.text = "Switch"
                

            }else{
                let dic = viewmodel1.controlArr[indexPath.row]
                
                cell.lblTabName.text = dic.gAAProjectSpaceTypePlannedDeviceName!

            }
            return cell
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == SpaceCollectionView{
            
            let dic = viewmodel.SpaceGroupArr[indexPath.row]
            ProjectSpaceRef = "\(dic.gAAProjectSpaceRef!)"
            getSpaceLandingData()
            
        } else if collectionView == tabCollectionView{
            let dic = viewmodel1.guestArr[indexPath.row]
            print(indexPath.row)
            viewmodel1.controlArr[indexPath.row]
            tabCollectionView.reloadData()
        }
        else if collectionView == homeCollectionView{
            
            let dic = viewmodel1.controlArr[indexPath.row]
            print(dic.nodeId!)
            print(dic.gAAProjectSpaceTypePlannedDeviceName!)
            SwitchName = dic.gAAProjectSpaceTypePlannedDeviceName!
            if Switch{
//                Switch = false

                let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeTabCollectionViewCell", for: indexPath) as! HomeTabCollectionViewCell
                cell.shView.backgroundColor = .orange
                cell.mnView.backgroundColor = .orange

            }else{
                nodeid(nodeid: dic.nodeId!)

            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == homeCollectionView  {
            
            let screenWidth = homeCollectionView.bounds.width - 15
            let scaleFactor = (screenWidth / 2)
            
            return CGSize(width: scaleFactor, height: scaleFactor)
        }
        return CGSize(width: tabCollectionView.frame.width, height: tabCollectionView.frame.height)
    }
    

}
