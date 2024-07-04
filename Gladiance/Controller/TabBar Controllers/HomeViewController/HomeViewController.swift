//
//  HomeViewController.swift
//  Gladiance
//
//  Created by Nikhil Malwade on 02/05/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblSpaceName: UILabel!
    @IBOutlet weak var lblProjectName: UILabel!
    
    var viewmodel = HVCViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewmodel.spaceGroupLandingApicall()
        
        lblUserName.text = "Hi \(UserName), you're at"
        lblProjectName.text = ProjectName
        setup()
        getSpaceLandingData()
        self.navigationController?.interactivePopGestureRecognizer!.delegate = self;

    }
    func getSpaceLandingData(){
        self.viewmodel.spaceLandingApicall()
      
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
                    self.lblSpaceName.text = "\(SpaceName),"
                }
            case .error(let error):
                print(error!)
            }
        }
    }
}

extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
   
    func setup(){
        observeEvent()
        
//        self.tabBarController?.navigationItem.hidesBackButton = true
        tabBarController?.tabBar.isHidden = false
        
        self.homeCollectionView.register(UINib(nibName: "HomeTabCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeTabCollectionViewCell")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeTabCollectionViewCell", for: indexPath) as! HomeTabCollectionViewCell
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    //func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //    //        if collectionView == homeCollectionView  {
    //    //
    //    //
    //    //                let screenWidth = homeCollectionView.bounds.width - 15
    //    //                let scaleFactor = (screenWidth / 2)
    //    //
    //    //                return CGSize(width: scaleFactor, height: scaleFactor)
    //    //        }
    //    //        /*return CGSize(width: tabViewCollectionView.frame.width, height: */tabViewCollectionView.frame.height)
    //
    //}
    
    
}
