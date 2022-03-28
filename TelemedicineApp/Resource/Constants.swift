//
//  Constants.swift
//
//  Created by Kaushik Darji on 2/21/18.
//  Copyright © 2018 Maulikpatel. All rights reserved.
//

import Foundation
import SystemConfiguration
import Foundation
import UIKit
import AFNetworking
import Alamofire
import CoreLocation
import KRProgressHUD
import KRActivityIndicatorView
import SwiftyJSON

enum APImethod: String {
    case POST = "POST"
    case GET = "GET"
    case PUT = "PUT"
    case DELETE = "DELETE"
}

struct Constants {
    
    //chat
    static let ID_SHOW_PREVIEWS = "SHOW_PREVIEWS"
    static let ID_CREATE_DISTINCT_CHANNEL = "CREATE_DISTINCT_CHANNEL"
    static let ID_DO_NOT_DISTURB = "DO_NOT_DISTURB"

    static let SERVER_API                       = ""
    static let kUserDefaults                    = UserDefaults.standard
    static let kSharedAppDelegate               = (UIApplication.shared.delegate as? AppDelegate)
    static let kDateToday                       = Date()
    static let APPNAME                          = "Telemadicine App"
    static let GooglePlaceClient_ProvideAPIKey  = ""
    static let DeviceType                       = "IOS"
    static let AppVersion                       = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    static let DecryptedKey                     = ""
    
    
    static func IOS(x: Float) -> Bool
    {
        return ((Float(UIDevice.current.systemVersion) ?? 0.0 < x) ? true : false)
    }
    
    static let screenSize: CGRect = UIScreen.main.bounds
    
    // Server Api's
        
    static let Login                         = "login"
}


extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
extension UIImageView {
    @IBInspectable
    var changeColor: UIColor? {
        get {
            let color = UIColor(cgColor: layer.borderColor!);
            return color
        }
        set {
            let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
            self.image = templateImage
            self.tintColor = newValue
        }
    }
}

//statusbar color
public func ChangeStatusBarColor(isWhite: Bool)
{
    if isWhite
    {
        if let statusBar = UIApplication.shared.value(forKey: "statusBar") as? UIView {
            statusBar.backgroundColor = UIColor.white
        }
    }
    else
    {
        if let statusBar = UIApplication.shared.value(forKey: "statusBar") as? UIView {
            let color2 = UIColor(rgb: 0xD0F0EA)
            statusBar.backgroundColor = color2
        }
    }
}

func transToHourMinSec(time: Float) -> String
{
    let allTime: Int = Int(time)
    var hours = 0
    var minutes = 0
    var seconds = 0
    var hoursText = ""
    var minutesText = ""
    var secondsText = ""
    
    hours = allTime / 3600
    hoursText = hours > 9 ? "\(hours)" : "0\(hours)"
    
    minutes = allTime % 3600 / 60
    minutesText = minutes > 9 ? "\(minutes)" : "0\(minutes)"
    
    seconds = allTime % 3600 % 60
    secondsText = seconds > 9 ? "\(seconds)" : "0\(seconds)"
    
    return "\(hoursText):\(minutesText):\(secondsText)"
}

func SetDate24to12(Time : String) -> String
{
    let dateAsString = Time
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm:ss"
    
    let date = dateFormatter.date(from: dateAsString)
    dateFormatter.dateFormat = "h:mm:ss"
    let str = dateFormatter.string(from: date!)
    return str
}

func SetDate12to24(Time : String) -> String
{
    print(Time)
    let dateAsString = Time
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "hh a"

    let date = dateFormatter.date(from: dateAsString)
    dateFormatter.dateFormat = "HH:mm:ss"
    let str = dateFormatter.string(from: date!)
    return str
}

func format(with mask: String, phone: String) -> String
{
    let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
    var result = ""
    var index = numbers.startIndex // numbers iterator

    // iterate over the mask characters until the iterator of numbers ends
    for ch in mask where index < numbers.endIndex {
        if ch == "X" {
            // mask requires a number in this place, so take the next one
            result.append(numbers[index])

            // move numbers iterator to the next index
            index = numbers.index(after: index)

        } else {
            result.append(ch) // just append a mask character
        }
    }
    return result
}

// MARK: - Formmated Phone number

public func dateformateChange(key: String, formatIn : String, formatOut : String) -> String {
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = formatIn
    let date = dateFormatter.date(from: key)
    dateFormatter.dateFormat = formatOut
    return  dateFormatter.string(from: date!)
}

func formattedNumber(number: String) -> String
{
    let cleanPhoneNumber = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    let mask = "(XXX) XXX-XXXX"
    

    var result = ""
    var index = cleanPhoneNumber.startIndex
    for ch in mask where index < cleanPhoneNumber.endIndex {
        if ch == "X"
        {
            result.append(cleanPhoneNumber[index])
            index = cleanPhoneNumber.index(after: index)
        } else
        {
            result.append(ch)
        }
    }
    return result
}

func convertObjectIntoJSONString(Object: [Any]) -> String? {
    do {
        let jsonData: Data = try JSONSerialization.data(withJSONObject: Object, options: [])
        if  let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue) {
            return jsonString as String
        }
        
    } catch let error as NSError {
        print("Array convertIntoJSON - \(error.description)")
    }
    return nil
}

public var storyBoard: UIStoryboard
{
    return UIStoryboard(name: "Main", bundle:nil)
}

public var ImagePlaceholder: String
{
    return "Placeholder"
}

// MARK: - Details Get From UserDefault

public var DeviceToken: String
{
    if !NullCheck.isKeyPresentInUserDefaults(key: "device_token")
    {
        return ""
    }
    return NSString(format:"%@",UserDefaults.standard.object(forKey: "device_token") as! String) as String
}

public var LoginUserID: String
{
    if !NullCheck.isKeyPresentInUserDefaults(key: "UserId")
    {
        return ""
    }
    if let user_id = UserDefaults.standard.object(forKey: "UserId") as? NSNumber
    {
        return "\(user_id)"
    }
    else if let user_id = UserDefaults.standard.object(forKey: "UserId") as? String
    {
        return "\(user_id)"
    }
    return "\(UserDefaults.standard.object(forKey: "UserId") as Any)"
}

public var LoginUserName: String
{
    if !NullCheck.isKeyPresentInUserDefaults(key: "Username")
    {
        return ""
    }
    return NSString(format:"%@",UserDefaults.standard.object(forKey: "Username") as! String) as String

}

public var S3BucketName: String
{
    if !NullCheck.isKeyPresentInUserDefaults(key: "S3BucketName")
    {
        return ""
    }
    return NSString(format:"%@",UserDefaults.standard.object(forKey: "S3BucketName") as! String) as String
}

public var S3Url: String
{
    if !NullCheck.isKeyPresentInUserDefaults(key: "S3Url")
    {
        return ""
    }
    return NSString(format:"%@",UserDefaults.standard.object(forKey: "S3Url") as! String) as String
}

// Screen width.
extension String
{
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0...length-1).map{ _ in letters.randomElement()! })
    }

}

extension UINavigationController {
    
    func PopToSpecificViewController(vc: Any)
    {
        for element in viewControllers as Array
        {
            if "\(type(of: element)).Type" == "\(type(of: vc))"
            {
                self.popToViewController(element, animated: true)
                break
            }
        }
    }
}

public var screenWidth: CGFloat {
    return UIScreen.main.bounds.width
}

// Screen height.
public var screenHeight: CGFloat {
    return UIScreen.main.bounds.height
}

extension UIImageView {
    func setImageColor(color: UIColor)
    {
        let templateImage = self.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
    
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

public class Reachability {
    
    class func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        return (isReachable && !needsConnection)
        
    }
}
extension NSAttributedString {
    
    func replacing(placeholder:String, with valueString:String) -> NSAttributedString {
        
        if let range = self.string.range(of:placeholder) {
            let nsRange = NSRange(range,in:valueString)
            let mutableText = NSMutableAttributedString(attributedString: self)
            mutableText.replaceCharacters(in: nsRange, with: valueString)
            return mutableText as NSAttributedString
        }
        return self
    }
    
}

public class NullCheck
{
    class func checkNullNil(_ string: String) -> Bool {
        let str = string as? NSString
        if str == NSNull() || string.count == 0 || string == nil || (string == "(null)") || (string == "<null>") || "\(String(describing: str))".trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).count == 0 || (string == "0.000000")
        {
            return false

        }
        else {
            return true
        }
    }
    
    class func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
    class func isValidEmail(email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
}

public class API_Almofire
{
    class func RequestAPI(_ apiName: String, type method: String, withparams parameters: [String:Any], isloader : Bool, withController view: UIViewController, sucess success: @escaping (_ response: JSON) -> Void, failure: @escaping (_ error: Error?) -> Void)
    {
        KRProgressHUD.set(style: KRProgressHUDStyle.white)
        KRProgressHUD.set(activityIndicatorViewColors: [#colorLiteral(red: 0, green: 0.4784313725, blue: 0.4431372549, alpha: 1)])

        if Reachability.isConnectedToNetwork() == true
        {
            if isloader == true
            {
                KRProgressHUD.show()
            }
            
            var param: [String: Any]
            param = parameters
            param["device_type"] = Constants.DeviceType
            param["device_token"] = DeviceToken
            param["appVersion"] = Constants.AppVersion
            
            let Urlstring = "\(Constants.SERVER_API)\(apiName)"
            var header:HTTPHeaders = [:]
            
            header = ["accept": "application/x-www-form-urlencoded",
                      "Content-Type": "application/x-www-form-urlencoded"]

            Alamofire.request(Urlstring, method: HTTPMethod(rawValue: method)!, parameters: param, encoding: URLEncoding.default, headers: header).responseJSON{ (response) in
                
                switch response.result {
                case .success:
                    let result  = JSON(response.value as Any)
                    print("Response :: \(result)")
                    success(result)
                    KRProgressHUD.dismiss()
                    break
                case .failure(let error):
                    print(error)
                    failure(error)
                    let requestReply1 = String(data: response.data!, encoding: .ascii)
                    print ("Urlstring:: \(Constants.SERVER_API)\(apiName)\nParms:: \(param)\nresponse:: \(String(describing: requestReply1!))")
                    view.view .makeToast(NSLocalizedString("server error.", comment: ""), duration: 1.5, position: CSToastPositionCenter)
                    KRProgressHUD.dismiss()
                }
            }
        }
        else
        {
            KRProgressHUD.dismiss()
            let alert = UIAlertController(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
            DispatchQueue.main.async {
                UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
            }

        }
    }
}

public class API{
    
    class func Request(_ apiName: String, type method: String, withparams params: [String: Any], withloder indicator: Bool,withController view: UIViewController, sucess success: @escaping (_ response: JSON) -> Void, failure: @escaping (_ error: Error?) -> Void)
    {
        KRProgressHUD.set(style: KRProgressHUDStyle.white)
        KRProgressHUD.set(activityIndicatorViewColors: [#colorLiteral(red: 0, green: 0.4784313725, blue: 0.4431372549, alpha: 1)])

        if Reachability.isConnectedToNetwork() == true
        {
            if indicator
            {
                KRProgressHUD.show()
            }
            var param: [String: Any]
            param = params
            print(param)
            param["device_type"] = Constants.DeviceType
            param["device_token"] = DeviceToken
            param["appVersion"] = Constants.AppVersion

            print(param)

            let request: NSMutableURLRequest = NSMutableURLRequest()
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "accept")
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
                        
            print("\(Constants.SERVER_API)\(apiName)")
            request.url = URL(string: "\(Constants.SERVER_API)\(apiName)")
            request.timeoutInterval = 180
            
            if method == "POST" {
                let postString = param.map { "\($0.0)=\($0.1)" }.joined(separator: "&")
                request.httpMethod = "POST"
                request.httpBody = postString.data(using: String.Encoding.utf8)
            }
            else if method == "GET" {
                request.httpMethod = "GET"
            }
            else if method == "PUT" {
                let putString = param.map { "\($0.0)=\($0.1)" }.joined(separator: "&")
                request.httpMethod = "PUT"
                request.httpBody = putString.data(using: String.Encoding.utf8)
            }
            else if method == "DELETE"
            {
                request.httpMethod = "DELETE"
            }
            
            print(apiName)
            print(param)
            print(request)
            let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
                
                OperationQueue.main.addOperation {
                    if response != nil {
                        KRProgressHUD.dismiss()
                                            do {
                                                
                                                if let responseJSON = try JSONSerialization.jsonObject(with: data!) as? [String:AnyObject]
                                                {
                                                    let result  = JSON(data!)
                                                    print(result)
                                                    success(result)
                                                }else{
                                                    let requestReply1 = String(data: data!, encoding: .ascii)
                                                    print ("Urlstring:: \(Constants.SERVER_API)\(apiName)\nParms:: \(param)\nresponse:: \(String(describing: requestReply1!))")
                                                    view.view .makeToast(NSLocalizedString("server error.", comment: ""), duration: 1.5, position: CSToastPositionCenter)
                                                    failure(error)
                                                }
                                            } catch let error as NSError {
                                                let requestReply1 = String(data: data!, encoding: .ascii)
                                                print ("Urlstring:: \(Constants.SERVER_API)\(apiName)\nParms:: \(param)\nresponse:: \(String(describing: requestReply1!))")
                                                print(error.localizedDescription)
                                            }
                    } else {
                        failure(error)
                        KRProgressHUD .dismiss()
                    }
                }
            }
            task.resume()
        }
        else
        {
            OperationQueue.main.addOperation {
                failure(nil)
            }
            
            KRProgressHUD .dismiss()
            let alert = UIAlertController(title: NSLocalizedString("No Internet Connection", comment: ""), message: NSLocalizedString("Please check your internet connection.", comment: ""), preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: UIAlertAction.Style.default, handler: nil))
            view.present(alert, animated: true, completion: nil)
        }
    }
}

public class VerticalAlignLabel: UILabel {
    enum VerticalAlignment {
        case top
        case middle
        case bottom
    }
    
    var verticalAlignment : VerticalAlignment = .top {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override public func textRect(forBounds bounds: CGRect, limitedToNumberOfLines: Int) -> CGRect {
        let rect = super.textRect(forBounds: bounds, limitedToNumberOfLines: limitedToNumberOfLines)
        
        if UIView.userInterfaceLayoutDirection(for: .unspecified) == .rightToLeft {
            switch verticalAlignment {
            case .top:
                return CGRect(x: self.bounds.size.width - rect.size.width, y: bounds.origin.y, width: rect.size.width, height: rect.size.height)
            case .middle:
                return CGRect(x: self.bounds.size.width - rect.size.width, y: bounds.origin.y + (bounds.size.height - rect.size.height) / 2, width: rect.size.width, height: rect.size.height)
            case .bottom:
                return CGRect(x: self.bounds.size.width - rect.size.width, y: bounds.origin.y + (bounds.size.height - rect.size.height), width: rect.size.width, height: rect.size.height)
            }
        } else {
            switch verticalAlignment {
            case .top:
                return CGRect(x: bounds.origin.x, y: bounds.origin.y, width: rect.size.width, height: rect.size.height)
            case .middle:
                return CGRect(x: bounds.origin.x, y: bounds.origin.y + (bounds.size.height - rect.size.height) / 2, width: rect.size.width, height: rect.size.height)
            case .bottom:
                return CGRect(x: bounds.origin.x, y: bounds.origin.y + (bounds.size.height - rect.size.height), width: rect.size.width, height: rect.size.height)
            }
        }
    }
    
    override public func drawText(in rect: CGRect) {
        let r = self.textRect(forBounds: rect, limitedToNumberOfLines: self.numberOfLines)
        super.drawText(in: r)
    }
}
public class GetLocation: NSObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    var locationCallback: ((CLLocation?) -> Void)!
    var locationServicesEnabled = false
    var didFailWithError: Error?
    
    public func run(callback: @escaping (CLLocation?) -> Void) {
        locationCallback = callback
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        manager.requestWhenInUseAuthorization()
        locationServicesEnabled = CLLocationManager.locationServicesEnabled()
        if locationServicesEnabled { manager.startUpdatingLocation() }
        else { locationCallback(nil) }
    }
    
    public func locationManager(_ manager: CLLocationManager,
                                didUpdateLocations locations: [CLLocation]) {
        locationCallback(locations.last!)
        manager.stopUpdatingLocation()
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        didFailWithError = error
        locationCallback(nil)
        manager.stopUpdatingLocation()
    }
    
    deinit {
        manager.stopUpdatingLocation()
    }
}

public class DATE
{
    func convertToString (dateString: String, formatIn : String, formatOut : String) -> String {
        
        let dateFormater = DateFormatter()
       // dateFormater.timeZone = NSTimeZone(abbreviation: "UTC") as TimeZone!
        dateFormater.dateFormat = formatIn
        let date = dateFormater.date(from: dateString)
        
        dateFormater.timeZone = NSTimeZone.system
        
        dateFormater.dateFormat = formatOut
        let timeStr = dateFormater.string(from: date!)
        return timeStr
    }
}
