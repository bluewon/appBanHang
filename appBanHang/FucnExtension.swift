//
//  FucnExtension.swift
//  AppQuanAo
//
//  Created by datnguyen on 9/13/16.
//  Copyright © 2016 datnguyen.com. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    func addConstrainWithVisualFormat(_ VSFormat:String,view:UIView...){
        var dic = Dictionary<String,UIView>()
        for (index,value) in view.enumerated(){
            let key:String = "v\(index)"
            value.translatesAutoresizingMaskIntoConstraints = false
            dic[key] = value
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: VSFormat, options: NSLayoutFormatOptions(), metrics: nil, views: dic))
    }
}

 
func loadData(urlString:API,param:Dictionary<String,Any>?,method:Method,completionHandler:@escaping (Any?)->()){
    var urlStringGet:String = urlString.fullLink
    var index:Int = 0
    switch method {
    case .post:
        index = 1
    default:
        if let param = param{
            urlStringGet += "?\(param.converDicToString())"
        }
    }
    let url:URL = URL(string: urlStringGet)!
    var request:URLRequest = URLRequest(url: url)
    if index == 1{
        let boundary = generateBoundaryString()
        let body = NSMutableData()
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        for i in param!{
            if let image:UIImage = i.value as? UIImage{
                let data = UIImageJPEGRepresentation(image, 0.5)
                let fname:String = "\(getDate()).jpeg"
                let mimetype = "image/png"
                body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
                body.append("Content-Disposition:form-data; name=\"\(i.key)\"; FileName=\"\(fname)\"\r\n".data(using: String.Encoding.utf8)!)
                body.append("Content-Type: \(mimetype)\r\n\r\n".data(using: String.Encoding.utf8)!)
                body.append(data!)
                body.append("\r\n".data(using: String.Encoding.utf8)!)
            }else{
                body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
                body.append("Content-Disposition: form-data; name=\"\(i.key)\"\r\n\r\n".data(using: String.Encoding.utf8)!)
                body.append("\(i.value)\r\n".data(using: String.Encoding.utf8)!)
            }
        }
        request.httpMethod = "POST"
        request.httpBody = body as Data
    }
    let session:URLSession = URLSession.shared
    session.dataTask(with: request, completionHandler: {
        (data,res,err) in
        if err == nil {
            do{
                let result = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                completionHandler(result)
            }catch{
                completionHandler(nil)
            }
        }else{
            completionHandler(nil)
        }
    }).resume()
}
extension Dictionary{
    func converDicToString()->String{
        var paramString:String = ""
        for (index,value) in self.enumerated(){
            if index == 0{
                paramString += "\(value.key)=\(value.value)"
            }
            paramString += "&\(value.key)=\(value.value)"
        }
        return paramString
    }
}

//func generateBoundaryString() -> String
//{
//    return "Boundary-\(NSUUID().uuidString)"
//}

//func getTime() -> String{
//    let date = Date()
//    let calendar = Calendar.current
//    let hour = calendar.component(.hour, from: date)
//    let minutes = calendar.component(.minute, from: date)
//    let second = calendar.component(.second, from: date)
//    let nano = calendar.component(.nanosecond, from: date)
//    return "\(hour)-\(minutes)-\(second)-\(nano)"
//}
//func getDate()->String{
//    let date = Date()
//    let calendar = Calendar.current
//    let day = calendar.component(.day, from: date)
//    let month = calendar.component(.month, from: date)
//    let year = calendar.component(.year, from: date)
//    let hour = calendar.component(.hour, from: date)
//    let minutes = calendar.component(.minute, from: date)
//    return "\(day)/\(month)/\(year) \(hour):\(minutes)"
//}
extension UILabel{
    dynamic var defaultFont: UIFont? {
        get { return self.font }
        set { self.font = newValue }
    }
}

extension String{
    static func ramdomString(numberCharacter:Int,characters:Array<Character>?) -> String{
        let charactersDefault:Array<Character> = ["q","w","e","r","t","y","u","i","o","p","a","s","d","f","g","h","j","k","l","z","x","c","v","b","n","m","Q","W","E","R","T","Y","U","I","O","P","A","S","D","F","G","H","J","K","L","Z","X","C","V","B","N","M","1","2","3","4","5","6","7","8","9","0","!","@","#","$","%","^","&"]
        var str:String = ""
            for _ in 1...numberCharacter{
            if let characters = characters{
            let rd:Int = Int(arc4random()) % characters.count
            str += "\(characters[rd])"
            }else{
            let rd:Int = Int(arc4random()) % charactersDefault.count
            str += "\(charactersDefault[rd])"
            }
        }
        return str
    }
    func isValidEmail() -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }

}

extension UIButton{
    func ghostButton(radius:CGFloat,color:UIColor){
        self.layer.cornerRadius = radius
        self.layer.borderWidth = 1
        self.layer.borderColor = color.cgColor
        self.tintColor = color
    }
}




