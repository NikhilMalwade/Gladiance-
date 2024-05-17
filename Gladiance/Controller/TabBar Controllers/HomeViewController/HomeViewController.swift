//
//  HomeViewController.swift
//  Gladiance
//
//  Created by Nikhil Malwade on 02/05/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var tabViewCollectionView: UICollectionView!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var btnDropDown: UIButton!
    @IBOutlet weak var lblUserName: UILabel!
    
    var ref = ""
    
     var viewmodel = HVCViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        self.viewmodel.spaceGroupLandingApicall(ref: ref)
        observeEvent()
        self.homeCollectionView.reloadData()

    }
    
    func setup(){
        lblUserName.text = "Hello, \(UserName)"
        
        self.tabBarController?.navigationItem.hidesBackButton = true
        tabBarController?.tabBar.isHidden = false
        
        self.tabViewCollectionView.register(UINib(nibName: "TabsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TabsCollectionViewCell")
        self.homeCollectionView.register(UINib(nibName: "HomeTabCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeTabCollectionViewCell")
        
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
                    self.tabViewCollectionView.reloadData()
                    self.homeCollectionView.reloadData()
                }
            case .error(let error):
                print(error!)
            }
        }
    }
}

extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == tabViewCollectionView{
            print(viewmodel.SpaceGroupArr.count)
            return viewmodel.SpaceGroupArr.count
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == tabViewCollectionView
        {
            let cell = tabViewCollectionView.dequeueReusableCell(withReuseIdentifier: "TabsCollectionViewCell", for: indexPath) as! TabsCollectionViewCell
            let dic = viewmodel.SpaceGroupArr[indexPath.row]
            cell.lblTabName.text = dic.gAAProjectSpaceName!
            return cell
        }
        else
        {
            let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeTabCollectionViewCell", for: indexPath) as! HomeTabCollectionViewCell

            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == tabViewCollectionView
        {
            var dic = viewmodel.SpaceGroupArr[indexPath.row]
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "RoomControllViewController") as! RoomControllViewController
            RefId1 = "\(dic.gAAProjectSpaceRef!)"
            tabBarController?.selectedIndex = 1
            self.navigationController?.pushViewController(vc, animated:  true)
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
