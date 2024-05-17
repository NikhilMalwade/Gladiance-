//
//  ProjectSpaceViewController.swift
//  Gladiance
//
//  Created by Nikhil Malwade on 13/05/24.
//

import UIKit

class ProjectSpaceViewController: UIViewController {
   
    @IBOutlet weak var HomeCollectionView: UICollectionView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblHotelName: UILabel!
    
    var ref = ""
    var RefName = ""

    var viewmodel = HVCViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.navigationItem.hidesBackButton = true
        lblName.text = UserName
        lblHotelName.text = RefName

        HomeCollectionView.register(UINib(nibName: "HomeTabCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeTabCollectionViewCell")
        navigationItem.hidesBackButton = true
        self.navigationController?.isNavigationBarHidden = true
        observeEvent()
        self.viewmodel.ProductApiCall(ref: ref)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        observeEvent()

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
                    self.HomeCollectionView.reloadData()
                }
            case .error(let error):
                print(error!)
            }
        }
    }

}
extension ProjectSpaceViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewmodel.ProductLandingArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = HomeCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeTabCollectionViewCell", for: indexPath) as! HomeTabCollectionViewCell
        let dic = viewmodel.ProductLandingArr[indexPath.row]
        cell.lblTabName.text = dic.gAAProjectSpaceGroupName!
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "tabBarController") as! UITabBarController
        
        let dic = viewmodel.ProductLandingArr[indexPath.row]
        RefId = "\(String(describing: dic.gAAProjectSpaceGroupRef!))"
        
        vc.tabBar.isHidden = false
        vc.selectedIndex = 2
        
        self.navigationController?.pushViewController(vc, animated:  true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = HomeCollectionView.bounds.width - 15
        let scaleFactor = (screenWidth / 2)
        
        return CGSize(width: scaleFactor, height: scaleFactor)
    }
    
}
