//
//  Extention.swift
//  Gladiance
//
//  Created by Nikhil Malwade on 02/05/24.
//

import Foundation
import UIKit

let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)


var DeviceID = ""
var LoginToken = ""
var UserName = ""
var RefId = ""
var RefId1 = ""

let Dark_BACKGROUND_COLOR = hexStringToUIColor(hex: "#465A65") // Dark Gray
let Orange_Background_color = hexStringToUIColor(hex: "FE8E51")
// To set Color in hexa color code

func hexStringToUIColor(hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
extension UIViewController { //: NVActivityIndicatorViewable
    //
    //   public func setLoading() {
    //        startAnimating(CGSize(width: 70 , height: 70), message: "", type: NVActivityIndicatorType.ballSpinFadeLoader, color: Dark_BACKGROUND_COLOR, backgroundColor: UIColor.clear, textColor: .black)
    //    }
    //
    //    public func hideLoading() {
    //        stopAnimating()
    //    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // Dismiss keyboard when return is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func simpleAlert(title: String, details: String) {
        let alert = UIAlertController(title: "\(title)", message: "\(details)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    func backTwo() {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
        self.navigationController!.popToViewController(viewControllers[viewControllers.count - 3], animated: true)
    }
    
    func isValidEmail(testStr:String) -> Bool {
        print("validate emilId: \(testStr)")
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
    }
    
    func setShadowToView(shView: UIView, mnView: UIView) {
        //        shView.layer.shadowColor = UIColor.lightGray.cgColor
        shView.layer.shadowColor = UIColor(hexString: "#FE8E51").cgColor
        
        shView.layer.shadowOpacity = 0.5
        shView.layer.shadowOffset = CGSize.zero
        shView.layer.shadowRadius = 4
        shView.backgroundColor = UIColor.clear
        
        mnView.layer.cornerRadius = 5.0
        mnView.clipsToBounds = true
    }
    
    func setRoundCornerToView(mnView: UIView, radius: CGFloat) {
        mnView.layer.cornerRadius = radius
        mnView.clipsToBounds = true
    }
    
    func setBorderToView(mnView: UIView, color: UIColor) {
        mnView.layer.borderWidth = 1.0
        mnView.layer.borderColor = color.cgColor
        
        mnView.layer.cornerRadius = 5.0
        mnView.clipsToBounds = true
    }
    
    
    
}
extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
extension UIViewController{
    
    class CircularProgressView: UIView {
        
        fileprivate var progressLayer = CAShapeLayer()
        fileprivate var trackLayer = CAShapeLayer()
        fileprivate var didConfigureLabel = false
        fileprivate var rounded: Bool
        fileprivate var filled: Bool
        
        fileprivate let lineWidth: CGFloat?
        
        var timeToFill = 3.43
        
        var progressColor = UIColor.white {
            didSet{
                progressLayer.strokeColor = progressColor.cgColor
            }
        }
        
        var trackColor = UIColor.white {
            didSet{
                trackLayer.strokeColor = trackColor.cgColor
            }
        }
        
        var progress: Double {
            didSet{
                var pathMoved = progress.rounded(toPlaces: 3) - oldValue
                if pathMoved < 0{
                    pathMoved = 0 - pathMoved
                }
                
                setProgress(duration: timeToFill * Double(pathMoved), to: Float(progress))
            }
        }
        
        fileprivate func createProgressView(){
            
            self.backgroundColor = .clear
            self.layer.cornerRadius = frame.size.width / 2
            let circularPath = UIBezierPath(arcCenter: center, radius: frame.width / 2, startAngle: CGFloat(-0.5 * .pi), endAngle: CGFloat(1.5 * .pi), clockwise: true)
            trackLayer.fillColor = UIColor.blue.cgColor
            
            trackLayer.path = circularPath.cgPath
            trackLayer.fillColor = .none
            trackLayer.strokeColor = trackColor.cgColor
            if filled {
                trackLayer.lineCap = .butt
                trackLayer.lineWidth = frame.width
            }else{
                trackLayer.lineWidth = lineWidth!
            }
            trackLayer.strokeEnd = 1
            layer.addSublayer(trackLayer)
            
            progressLayer.path = circularPath.cgPath
            progressLayer.fillColor = .none
            progressLayer.strokeColor = progressColor.cgColor
            if filled {
                progressLayer.lineCap = .butt
                progressLayer.lineWidth = frame.width
            }else{
                progressLayer.lineWidth = lineWidth!
            }
            progressLayer.strokeEnd = 0
            if rounded{
                progressLayer.lineCap = .round
            }
            
            
            layer.addSublayer(progressLayer)
            
        }
        
        func trackColorToProgressColor() -> Void{
            trackColor = progressColor
            trackColor = UIColor(red: progressColor.cgColor.components![0], green: progressColor.cgColor.components![1], blue: progressColor.cgColor.components![2], alpha: 0.2)
        }
        
        func setProgress(duration: TimeInterval = 3, to newProgress: Float) -> Void{
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.duration = duration
            
            animation.fromValue = progressLayer.strokeEnd
            animation.toValue = newProgress
            
            progressLayer.strokeEnd = CGFloat(newProgress)
            
            progressLayer.add(animation, forKey: "animationProgress")
            
        }
        
        override init(frame: CGRect){
            progress = 0
            rounded = true
            filled = false
            lineWidth = 15
            super.init(frame: frame)
            filled = false
            createProgressView()
        }
        
        required init?(coder: NSCoder) {
            progress = 0
            rounded = true
            filled = false
            lineWidth = 15
            super.init(coder: coder)
            createProgressView()
            
        }
        
        init(frame: CGRect, lineWidth: CGFloat?, rounded: Bool) {
            
            
            progress = 0
            
            if lineWidth == nil{
                self.filled = true
                self.rounded = false
            }else{
                if rounded{
                    self.rounded = true
                }else{
                    self.rounded = false
                }
                self.filled = false
            }
            self.lineWidth = lineWidth
            
            super.init(frame: frame)
            createProgressView()
            
        }
        
    }
}

extension NSMutableAttributedString {
    func setColorForText(textToFind: String, withColor color: UIColor) {
        let range: NSRange = self.mutableString.range(of: textToFind, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
    
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
extension UITableViewCell {
    func setShadowToView(shView: UIView, mnView: UIView) {
        shView.layer.shadowColor = UIColor.lightGray.cgColor
        shView.layer.shadowOpacity = 0.5
        shView.layer.shadowOffset = CGSize.zero
        shView.layer.shadowRadius = 4
        shView.backgroundColor = UIColor.clear
        
        mnView.layer.cornerRadius = 5.0
        mnView.clipsToBounds = true
    }
    
    func setRoundCornerToView(mnView: UIView, radius: CGFloat) {
        mnView.layer.cornerRadius = radius
        mnView.clipsToBounds = true
    }
}

extension UICollectionViewCell {
    func setShadowToView(shView: UIView, mnView: UIView) {
        //FE8E51
        //        shView.layer.shadowColor = UIColor.lightGray.cgColor
        
        shView.layer.shadowColor = UIColor(hexString: "#FE8E51").cgColor
        
        shView.layer.shadowOpacity = 1.0
        shView.layer.shadowOffset = CGSize.zero
        shView.layer.shadowRadius = 6
        shView.backgroundColor = UIColor.clear
        shView.layer.cornerRadius = 5.0
        //        shView.clipsToBounds = true
        
        mnView.layer.cornerRadius = 5.0
        mnView.clipsToBounds = true
    }
    
    func setRoundCornerToView(mnView: UIView, radius: CGFloat) {
        mnView.layer.cornerRadius = radius
        mnView.clipsToBounds = true
    }
    
}
extension UITableView {
    
    func scrollToBottom(){
        
        DispatchQueue.main.async {
            let indexPath = IndexPath(
                row: self.numberOfRows(inSection:  self.numberOfSections - 1) - 1,
                section: self.numberOfSections - 1)
            self.scrollToRow(at: indexPath, at: .bottom, animated: false)
        }
    }
    
    func scrollToTop() {
        
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: 0, section: 0)
            self.scrollToRow(at: indexPath, at: .top, animated: false)
        }
    }
}
