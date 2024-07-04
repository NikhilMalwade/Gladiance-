//
//  MainMoodViewController.swift
//  Gladiance
//
//  Created by D2019PRO on 27/06/24.
//

import UIKit

class MainMoodViewController:UIViewController{
   
    let viewModel = SettingsViewModel()

    @IBOutlet weak var MoodCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.sceneListApicall()
        collectionViewSetup ()
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
                    self.MoodCollectionView.reloadData()
                }
            case .error(let error):
                print(error!)
            }
        }
    }
}

extension MainMoodViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionViewSetup (){
        MoodCollectionView.register(UINib(nibName: "EditableCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "EditableCollectionViewCell")
        observeEvent()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(viewModel.ObjectTagDic.count)
        return viewModel.ObjectTagDic.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = MoodCollectionView.dequeueReusableCell(withReuseIdentifier: "EditableCollectionViewCell", for: indexPath) as! EditableCollectionViewCell
        
        let dic = viewModel.ObjectTagDic[indexPath.row]
        cell.lblTabName.text = dic.name
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dic = viewModel.ObjectTagDic[indexPath.row]
        print(dic.name!)
        print(dic.gAAProjectName!)
        
        let vc = storyboard?.instantiateViewController(identifier: "SceneVC") as! SceneVC
        viewModel.ConfigurationsDic = viewModel.ObjectTagDic[indexPath.row].configurations!
        vc.projectName = viewModel.ObjectTagDic[indexPath.row].name!
        vc.type = viewModel.ObjectTagDic[indexPath.row].gAAProjectName!
        print(viewModel.ObjectTagDic[indexPath.row].configurations!)
        vc.Arrdata = viewModel.ObjectTagDic[indexPath.row].configurations!

        navigationController?.pushViewController(vc, animated: true)
//        print(viewModel.ObjectTagDic[indexPath.row].configurations!)

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
        let screenWidth = MoodCollectionView.bounds.width - 15
        let scaleFactor = (screenWidth / 2)
        
        return CGSize(width: scaleFactor, height: scaleFactor)
    }
}
