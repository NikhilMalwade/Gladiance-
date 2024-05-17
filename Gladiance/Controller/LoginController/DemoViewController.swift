//
//  DemoViewController.swift
//  Gladiance
//
//  Created by Nikhil Malwade on 04/05/24.
//

import UIKit

class DemoViewController: UIViewController {
    
    @IBOutlet weak var HomeCollectionView: UICollectionView!
    @IBOutlet weak var lblName: UILabel!
    
    var viewmodel = HVCViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.navigationItem.hidesBackButton = true
        
        viewmodel.apicaller()
        lblName.text = UserName
        HomeCollectionView.register(UINib(nibName: "HomeTabCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeTabCollectionViewCell")
        navigationItem.hidesBackButton = true
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        
        HomeCollectionView.reloadData()
    }
    
}
extension DemoViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewmodel.projectsdata.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = HomeCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeTabCollectionViewCell", for: indexPath) as! HomeTabCollectionViewCell
        let dic = viewmodel.projectsdata[indexPath.row]
        cell.lblTabName.text = dic.gAAProjectName
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dic = viewmodel.projectsdata[indexPath.row]
        
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "ProjectSpaceViewController") as! ProjectSpaceViewController
        vc.RefName = dic.gAAProjectName!
        vc.ref = "\(String(describing: dic.gAAProjectRef!))"
        
        self.navigationController?.pushViewController(vc, animated:  true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = HomeCollectionView.bounds.width - 15
        let scaleFactor = (screenWidth / 2)
        
        return CGSize(width: scaleFactor, height: scaleFactor)
    }
    
}
