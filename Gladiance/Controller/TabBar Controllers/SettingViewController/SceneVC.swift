//
//  SceneVC.swift
//  Gladiance
//
//  Created by Nikhil Malwade on 04/07/24.
//

import UIKit

class SceneVC: UIViewController {

    let viewModel = SettingsViewModel()

    @IBOutlet weak var lblProjectType : UILabel!
    @IBOutlet weak var lblProjectName : UILabel!
    @IBOutlet weak var lblMoodName : UILabel!
    @IBOutlet weak var MoodCollectionView: UICollectionView!

    var projectName = ""
    var type = ""
    var Arrdata = [Configurations]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.sceneListApicall()
        collectionViewSetup ()
        MoodCollectionView.reloadData()
//        lblProjectType.text = dic.first

        // Do any additional setup after loading the view.
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
extension SceneVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionViewSetup (){
        MoodCollectionView.register(UINib(nibName: "EditableCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "EditableCollectionViewCell")
        observeEvent()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(viewModel.ConfigurationsDic.count)
//        return viewModel.ConfigurationsDic.count
        print(Arrdata.count)
        return Arrdata.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = MoodCollectionView.dequeueReusableCell(withReuseIdentifier: "EditableCollectionViewCell", for: indexPath) as! EditableCollectionViewCell
        
        let dic = viewModel.ConfigurationsDic[indexPath.row]
        
        cell.lblTabName.text = dic.gAAProjectSpaceTypePlannedDeviceName!
//        GAAProjectSpaceTypePlannedDeviceName!
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
        let screenWidth = MoodCollectionView.bounds.width - 15
        let scaleFactor = (screenWidth / 2)
        
        return CGSize(width: scaleFactor, height: scaleFactor)
    }
}
