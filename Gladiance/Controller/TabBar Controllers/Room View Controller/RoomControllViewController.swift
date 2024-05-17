//
//  RoomControllViewController.swift
//  Gladiance
//
//  Created by Nikhil Malwade on 02/05/24.
//

import UIKit

class RoomControllViewController: UIViewController {
    @IBOutlet weak var tabViewCollectionView: UICollectionView!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var lblTabName: UILabel!
    @IBOutlet weak var shview: UIView!
    @IBOutlet weak var btnName: UIButton!
    
    //var selecteditem = ""
    var Index = 0
    var ref = ""
    
    var SelectedProductArr = [String]()
    var SelectedRefArr = [Int]()
    var viewmodel = HVCViewModel()
    var viewmodel1 = RemoteViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRoundCornerToView(mnView: shview, radius: 15)
        self.tabBarController?.navigationItem.hidesBackButton = true
        tabBarController?.tabBar.isHidden = false
        
        self.tabViewCollectionView.register(UINib(nibName: "TabsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TabsCollectionViewCell")
        self.homeCollectionView.register(UINib(nibName: "HomeTabCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeTabCollectionViewCell")
        
        tabViewCollectionView.dataSource = self
        tabViewCollectionView.delegate = self
        
        self.viewmodel.spaceLandingApicall(ref: RefId1)
        self.homeCollectionView.reloadData()

        observeEvent()
    }
    
    func dropDownButton(){
        
        let actionClosure = { [self] (action: UIAction) in
            print(action.title)
            Index = SelectedProductArr.firstIndex(where: {$0 == action.title})!
            ref = "\(SelectedRefArr[Index])"
            demo()
        }
        
        var menuChildren: [UIMenuElement] = []
        
        for i in viewmodel.areasArr {
            menuChildren.append(UIAction(title: i.gAAProjectSpaceTypeAreaName!,state: .on, handler: actionClosure))
            SelectedProductArr.append(i.gAAProjectSpaceTypeAreaName!)
            SelectedRefArr.append(i.gAAProjectSpaceTypeAreaRef!)
        }
        btnName.menu = UIMenu(options: .displayInline, children: menuChildren)
        btnName.showsMenuAsPrimaryAction = true
        btnName.setTitleColor(.white, for: .normal)
        btnName.changesSelectionAsPrimaryAction = true
    }
    
    func demo(){
        self.viewmodel1.areaLandingApicall(ref: self.ref)
        UpdatedData()
        self.homeCollectionView.reloadData()

    }
    
    func UpdatedData(){
        viewmodel1.eventHandler1 = { [weak self] event in
            guard let self else { return }
            
            switch event {
            case .dataUpdated:
                DispatchQueue.main.async {
                    self.tabViewCollectionView.reloadData()
                    self.homeCollectionView.reloadData()
                    print("data updated")}
            }
        }
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
                    self.dropDownButton()
                    self.tabViewCollectionView.reloadData()
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
                    self.dropDownButton()
                    self.tabViewCollectionView.reloadData()
                    self.homeCollectionView.reloadData()
                }
            case .error(let error):
                print(error!)
            }
        }
    }
}

extension RoomControllViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == tabViewCollectionView{
            print("----------------------------\(viewmodel1.guestArr.count)----------------------------")
            return viewmodel1.guestArr.count
        }else{
            print("----------------------------\(viewmodel1.controlArr.count)----------------------------")
            return viewmodel1.controlArr.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == tabViewCollectionView
        {
            let cell = tabViewCollectionView.dequeueReusableCell(withReuseIdentifier: "TabsCollectionViewCell", for: indexPath) as! TabsCollectionViewCell
            let dic = viewmodel1.guestArr[indexPath.row]
            print("----------------------------\(dic.controlTypeName!)----------------------------")
            cell.lblTabName.text = dic.controlTypeName!
            return cell
        }
        else
        {
            let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeTabCollectionViewCell", for: indexPath) as! HomeTabCollectionViewCell
            let dic = viewmodel1.controlArr[indexPath.row]
            cell.lblTabName.text = dic.gAAProjectSpaceTypePlannedDeviceName!
            
            return cell
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == tabViewCollectionView
        {
            print(indexPath.row)
            var dic = viewmodel.SpaceGroupArr[indexPath.row]
            DispatchQueue.main.async {
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "FanViewController") as! FanViewController
                RefId1 = "\(dic.gAAProjectSpaceRef!)"
                self.navigationController?.pushViewController(vc, animated:  true)
                
            }
        }
        else{
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == homeCollectionView  {
            
                
                let screenWidth = homeCollectionView.bounds.width - 15
                let scaleFactor = (screenWidth / 2)
                
                return CGSize(width: scaleFactor, height: scaleFactor)
        }
        return CGSize(width: tabViewCollectionView.frame.width, height: tabViewCollectionView.frame.height)
    }
    
}
