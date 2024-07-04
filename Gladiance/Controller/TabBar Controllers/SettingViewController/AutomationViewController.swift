//
//  AutomationViewController.swift
//  Gladiance
//
//  Created by D2019PRO on 27/06/24.
//

import UIKit

class AutomationViewController:UIViewController{
    
    let viewModel = SettingsViewModel()
    @IBOutlet weak var automationCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewSetup ()
        self.viewModel.sceneListApicall()

    }
    
   
    func observeEvent() {
        viewModel.eventHandler = { [weak self] event in
            guard let self else { return }
            switch event {
            case .loading:
                print("Product loading....")
            case .stopLoading:
                print("Stop loading...")
            case .dataLoaded:
                print("Data loaded...")
                DispatchQueue.main.async {
                    self.automationCollectionView.reloadData()
                }
            case .error(let error):
                print(error!)
            }
        }
    }
}

extension AutomationViewController:UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionViewSetup (){
        automationCollectionView.register(UINib(nibName: "HomeTabCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeTabCollectionViewCell")
        let layout = UICollectionViewFlowLayout()
               layout.scrollDirection = .vertical
        observeEvent()

    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(viewModel.ObjectTagDic.count)
        let dic = viewModel.ObjectTagDic
        return viewModel.ObjectTagDic.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = automationCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeTabCollectionViewCell", for: indexPath) as! HomeTabCollectionViewCell
        
        let dic = viewModel.ObjectTagDic[indexPath.row]
        let dic1 = dic.configurations![indexPath.row]
        cell.lblTabName.text = dic1.gAAProjectName
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dic = viewModel.ObjectTagDic[indexPath.row]
        GAAProjectSceneRef = "\(dic.ref!)"
        
        let vc = storyboard?.instantiateViewController(identifier: "MainMoodViewController") as! MainMoodViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let width = collectionView.bounds.width - 100 // Full width of the collection view
           let height: CGFloat = 150.0 // Example height for each cell
           return CGSize(width: width, height: height)
       }
    
    
}
