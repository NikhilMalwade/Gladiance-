//
//  SchedulingViewController.swift
//  Gladiance
//
//  Created by D2019PRO on 14/06/24.
//

import Foundation
import UIKit

class SchedulingViewController:UIViewController{
    
    
    var viewModel = SettingsViewModel()
    @IBOutlet weak var daysOfWeekCheckBox: Checkbox!
    @IBOutlet weak var dateOfMonthCheckbox: Checkbox!
    @IBOutlet weak var repeatEveryYearCheckBox: Checkbox!
    
    @IBOutlet weak var daysOfWeekCollectionView: UICollectionView!
    @IBOutlet weak var monthOfYearCollectionView: UICollectionView!
    @IBOutlet weak var DevicesCollectionView: UICollectionView!
    @IBOutlet weak var datePickerView: UIDatePicker!
    @IBOutlet weak var DevicesCollectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var DaysCollectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var MonthCollectionViewHeight: NSLayoutConstraint!

    
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var hourLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var lblProjectName: UILabel!
    @IBOutlet weak var lblScheduleName: UILabel!

    
    let DaysArr = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
    let MonthsArr = ["Jan","Feb","March","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
    let datevaluesArr: [Int] = Array(1...31)
    var yearsArr: [Int] = []
    var yearsStringArr: [String] = []
    
    var hourpickerView: UIPickerView!
    var datepickerView: UIPickerView!
    var yearpickerView: UIPickerView!
    var HpickerContainer: UIView!
    var minutehourpickerView: UIPickerView!
    var MpickerContainer: UIView!
    var hourvalues: [Int] = Array(0...11)
    var minutevalues: [Int] = Array(0...59)
    var pickerContainer1: UIView!
    var pickerContainer2: UIView!
    var pickerContainer3: UIView!
    var pickerContainer4: UIView!
    var activeLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.scheduleListApicall()

        addTapGexture()
        PickerViewSetup()
        self.setUp()
        
    }
    
    
    
    @IBAction func checkboxTapped(_ sender: Checkbox) {
        let status1 = daysOfWeekCheckBox.isChecked ? "checked" : "unchecked"
        let status2 = dateOfMonthCheckbox.isChecked ? "checked" : "unchecked"
        let status3 = repeatEveryYearCheckBox.isChecked ? "checked" : "unchecked"
        print("Checkbox 1 is \(status1)")
        print("Checkbox 2 is \(status2)")
        print("Checkbox 3 is \(status3)")
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
                    self.fetchData()
                    self.DevicesCollectionView.reloadData()
                  
                }
            case .error(let error):
                print(error!)
            }
        }
    }
    func fetchData(){
        print(viewModel.ScheduleListConfigurationsDic.count)
        print(viewModel.ScheduleListObjectTagDic.count)
        
        lblProjectName.text = viewModel.ScheduleListObjectTagDic[0].name
        lblScheduleName.text = viewModel.ScheduleListConfigurationsDic[0].gAAProjectSpaceTypeName
        hourLbl.text = "\(viewModel.TriggersDic[0].hour!)"
        dateLbl.text = "\(viewModel.TriggersDic[0].hour!)"
        
        
        
    }
    
}
extension SchedulingViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        DevicesCollectionViewHeight.constant = DevicesCollectionView.contentSize.height
        DaysCollectionViewHeight.constant = daysOfWeekCollectionView.contentSize.height
        MonthCollectionViewHeight.constant = monthOfYearCollectionView.contentSize.height
        self.view.layoutIfNeeded()
    }
    
    // MARK: - UICollectionViewDataSource Methods
    func setUp(){
        
        observeEvent()

        self.viewModel.scheduleListApicall()
        // Register custom cells
        daysOfWeekCollectionView.register(UINib(nibName: "daysOfWeekCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "daysOfWeekCollectionViewCell")
        monthOfYearCollectionView.register(UINib(nibName: "daysOfWeekCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "daysOfWeekCollectionViewCell")
        DevicesCollectionView.register(UINib(nibName: "EditableCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "EditableCollectionViewCell")
        let layout = UICollectionViewFlowLayout()
        layout.sectionHeadersPinToVisibleBounds = true
        
        //        DevicesCollectionView.minimumLineSpacing = 5
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == daysOfWeekCollectionView {
            return DaysArr.count
        }else  if collectionView == monthOfYearCollectionView {
            return MonthsArr.count
        }else{
            return viewModel.ScheduleListConfigurationsDic.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
 
        
        if collectionView == daysOfWeekCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "daysOfWeekCollectionViewCell", for: indexPath) as! daysOfWeekCollectionViewCell
            

            cell.dayslbl .text = DaysArr[indexPath.row]
            return cell
        }
        else if collectionView == monthOfYearCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "daysOfWeekCollectionViewCell", for: indexPath) as! daysOfWeekCollectionViewCell
            let dic = MonthsArr[indexPath.row]
            cell.dayslbl.text = dic
            return cell
        }
        
        else {
            
            let cell = DevicesCollectionView.dequeueReusableCell(withReuseIdentifier: "EditableCollectionViewCell", for: indexPath) as! EditableCollectionViewCell
            
            let dic = viewModel.ScheduleListConfigurationsDic[indexPath.row]
            cell.lblTabName.text = dic.label
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == daysOfWeekCollectionView  {
            
            let noOfCellsInRow = 4   //number of column you want
                let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
                let totalSpace = flowLayout.sectionInset.left
                    + flowLayout.sectionInset.right
                    + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

                let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
                return CGSize(width: size, height: size)
            
            
//            let screenWidth = daysOfWeekCollectionView.bounds.width - 15
//            let scaleFactor = (screenWidth / 2)
//            
//            return CGSize(width: scaleFactor, height: scaleFactor)
        }else if collectionView == DevicesCollectionView{
            let screenWidth = DevicesCollectionView.bounds.width - 15
            let scaleFactor = (screenWidth / 2)
            
            return CGSize(width: scaleFactor, height: scaleFactor)
        }
        
        return CGSize(width: daysOfWeekCollectionView.frame.width, height: daysOfWeekCollectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    
    
    // MARK: - UICollectionViewDelegate Methods
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == daysOfWeekCollectionView {
            let cell = collectionView.cellForItem(at: indexPath) as! daysOfWeekCollectionViewCell
            cell.isSelected = true
        } else if collectionView == monthOfYearCollectionView {
            let cell = collectionView.cellForItem(at: indexPath) as! daysOfWeekCollectionViewCell
            cell.isSelected = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == daysOfWeekCollectionView {
            let cell = collectionView.cellForItem(at: indexPath) as! daysOfWeekCollectionViewCell
            cell.isSelected = false
        } else if collectionView == monthOfYearCollectionView {
            let cell = collectionView.cellForItem(at: indexPath) as! daysOfWeekCollectionViewCell
            cell.isSelected = false
        }
    }
    
}

extension SchedulingViewController:UIPickerViewDelegate,UIPickerViewDataSource{
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == hourpickerView{
            return hourvalues.count
        }else if pickerView == minutehourpickerView{
            return minutevalues.count
        }else if pickerView == datepickerView{
            return datevaluesArr.count
        }
        else
        {
            return 10
        }
        
    }
    
    // MARK: - UIPickerViewDelegate
    
    //      func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    //          if pickerView == hourpickerView{
    //              return "\(hourvalues[row])"
    //          }else if pickerView == minutehourpickerView{
    //              return "\(minutevalues[row])"
    //          }else if pickerView == datepickerView{
    //             // return "\(datevaluesArr[row])"
    //             return "\(datevaluesArr[row])"
    //          }
    //          else{
    //
    //              //return "\(yearsArr[row])"
    //              return yearsStringArr[row]
    //
    //          }
    //      }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Update the active label with selected value
        if let activeLabel = activeLabel {
            if activeLabel == hourLbl {
                let selectedRow = hourpickerView.selectedRow(inComponent: 0)
                activeLabel.text = "\(hourvalues[selectedRow])"
                hidePicker(pickerContainer: pickerContainer1)
            } else if activeLabel == minuteLabel {
                let selectedRow = minutehourpickerView.selectedRow(inComponent: 0)
                activeLabel.text = "\(minutevalues[selectedRow])"
                hidePicker(pickerContainer: pickerContainer2)
            }
            else if activeLabel == dateLbl {
                let selectedRow = datepickerView.selectedRow(inComponent: 0)
                activeLabel.text = "\(datevaluesArr[selectedRow])"
                hidePicker(pickerContainer: pickerContainer3)
            }
            else if activeLabel == yearLbl {
                let selectedRow = yearpickerView.selectedRow(inComponent: 0)
                activeLabel.text = "\(yearsArr[selectedRow])"
                hidePicker(pickerContainer: pickerContainer4)
            }
        }
        
        
    }
    // Customize the appearance of the picker view rows
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        
        label.textColor = .gray
        label.textAlignment = .center
        label.backgroundColor = .clear
        
        if pickerView == hourpickerView {
            label.text = "\(hourvalues[row])"
        } else {
            label.text = "\(minutevalues[row])"
        }
        
        return label
    }
}


extension SchedulingViewController{
    func PickerViewSetup(){
        datePickerView.datePickerMode = UIDatePicker.Mode.date
        
        daysOfWeekCheckBox.isChecked = false
        dateOfMonthCheckbox.isChecked = false
        repeatEveryYearCheckBox.isChecked = false
        
        // Enable multiple selection if needed
        daysOfWeekCollectionView.allowsMultipleSelection = true
        monthOfYearCollectionView.allowsMultipleSelection = true
        
        let currentYear = Calendar.current.component(.year, from: Date())
        yearsArr = (currentYear...currentYear + 10).map { $0 }
        yearsStringArr = yearsArr.map { String($0) }
    }
    func addTapGexture(){
        hourLbl.isUserInteractionEnabled = true
        minuteLabel.isUserInteractionEnabled = true
        dateLbl.isUserInteractionEnabled = true
        yearLbl.isUserInteractionEnabled = true
        
        // Add tap gesture recognizers to labels
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(showPicker1))
        hourLbl.addGestureRecognizer(tapGesture1)
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(showPicker2))
        minuteLabel.addGestureRecognizer(tapGesture2)
        
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(showPicker3))
        dateLbl.addGestureRecognizer(tapGesture3)
        
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(showPicker4))
        yearLbl.addGestureRecognizer(tapGesture4)
        
        // Initialize UIPickerViews
        hourpickerView = UIPickerView()
        hourpickerView.delegate = self
        hourpickerView.dataSource = self
        
        minutehourpickerView = UIPickerView()
        minutehourpickerView.delegate = self
        minutehourpickerView.dataSource = self
        
        datepickerView = UIPickerView()
        datepickerView.delegate = self
        datepickerView.dataSource = self
        datepickerView.backgroundColor = .clear
        
        yearpickerView = UIPickerView()
        yearpickerView.delegate = self
        yearpickerView.dataSource = self
        
        // Initialize Picker Containers
        pickerContainer1 = UIView()
        pickerContainer1.backgroundColor = .white
        pickerContainer1.layer.borderColor = UIColor.gray.cgColor
        pickerContainer1.layer.borderWidth = 1
        pickerContainer1.translatesAutoresizingMaskIntoConstraints = false
        
        pickerContainer2 = UIView()
        pickerContainer2.backgroundColor = .white
        pickerContainer2.layer.borderColor = UIColor.gray.cgColor
        pickerContainer2.layer.borderWidth = 1
        pickerContainer2.translatesAutoresizingMaskIntoConstraints = false
        
        pickerContainer3 = UIView()
        pickerContainer3.backgroundColor = .white
        pickerContainer3.layer.borderColor = UIColor.gray.cgColor
        pickerContainer3.layer.borderWidth = 1
        pickerContainer3.translatesAutoresizingMaskIntoConstraints = false
        
        pickerContainer4 = UIView()
        pickerContainer4.backgroundColor = .white
        pickerContainer4.layer.borderColor = UIColor.gray.cgColor
        pickerContainer4.layer.borderWidth = 1
        pickerContainer4.translatesAutoresizingMaskIntoConstraints = false
        //                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showPicker))
        //                hourLbl.addGestureRecognizer(tapGesture)
        //        minuteLabel.addGestureRecognizer(tapGesture)
    }
    // Show picker1 when label1 is tapped
    @objc func showPicker1() {
        activeLabel = hourLbl
        showPicker(pickerView: hourpickerView, pickerContainer: pickerContainer1)
    }
    
    // Show picker2 when label2 is tapped
    @objc func showPicker2() {
        activeLabel = minuteLabel
        showPicker(pickerView: minutehourpickerView, pickerContainer: pickerContainer2)
    }
    @objc func showPicker3() {
        activeLabel = dateLbl
        
        //        showPicker(pickerView: datepickerView, pickerContainer: pickerContainer3)
    }
    
    @objc func showPicker4() {
        activeLabel = yearLbl
        showPicker(pickerView: yearpickerView, pickerContainer: pickerContainer4)
    }
    
    // Show picker view in container
    func showPicker(pickerView: UIPickerView, pickerContainer: UIView) {
        pickerContainer.addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pickerView.topAnchor.constraint(equalTo: pickerContainer.topAnchor),
            pickerView.leadingAnchor.constraint(equalTo: pickerContainer.leadingAnchor),
            pickerView.trailingAnchor.constraint(equalTo: pickerContainer.trailingAnchor),
            pickerView.bottomAnchor.constraint(equalTo: pickerContainer.bottomAnchor)
        ])
        
        view.addSubview(pickerContainer)
        NSLayoutConstraint.activate([
            pickerContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pickerContainer.topAnchor.constraint(equalTo: activeLabel!.bottomAnchor, constant: 10),
            pickerContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            pickerContainer.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    // Hide picker container
    func hidePicker(pickerContainer: UIView) {
        pickerContainer.removeFromSuperview()
    }
}
