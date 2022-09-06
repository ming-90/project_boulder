//
//  APIConstans.swift
//  Clming
//
//  Created by Seulki Lee on 2022/08/07.
//

import UIKit

struct APIURL {
    static let clmingSever = "http://172.30.1.40:8110"
    static let getMainList = clmingSever + "/Main/list"
}

struct boulderList : Codable {
    let ClimbingCenterId : String
    let ClimbingCenterName : String
    let UsePrice : Int
    let UseTime : String
}

class APIConstans: NSObject {
    
    //저장해놔야함.. https://ios-development.tistory.com/59
    //static으로 하는이유가. 로딩할떄 메모리에 올려놓고 써야하니까.. 다른애들이 찾을때 static이 아니면 class를 불러와서 해야하는데..
    //지금 내가 사용하지 않는것...
    //객체 생성..해서 움직여야대.. 메모리 올려놓을껏 안해놓을것 그런거 새악해야하는구나.~
    //그치 하드웨어의 자원은 한정적이니까.. 그치그치
    //static은 메모리에 올려놓는것.
    static func connectTest() {
        
        //모듈화시키디 url 하면 끝나개 ( get/post 보내고 8가지인가있대.. )
        //          url + post data
        // URL 객체 정의
        let url = URL(string: APIURL.getMainList) //레스트풀 api? get은 데이터 post 저장시킬려고한느거 patch ->
        
        // 1) REQ - 라인 설정
        var req = URLRequest(url: url!)
        req.httpMethod = "GET"
        
        // 2) REQ - 헤더 설정
        req.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type") // POST
        
        // 서버에 전송
        URLSession.shared.dataTask(with: req) {(data, response, error) in
            
            // error 체크
            if let e = error {
                print(e.localizedDescription)
                return
            }
            
            print("response=\(response)")
            
            DispatchQueue.main.async {
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                    guard let jsonObj = json else {return}

                    let result = jsonObj["result"] as? String
                    let id = jsonObj["userId"] as? String
                    let name = jsonObj["name"] as? String

                    if result == "SUCCESS" {
                        
                        // data 확인
//                        print("결과==>\(String(data: data!, encoding: .utf8)!)")
//
//                        // responseView는 @IBOulet변수
//                        self.responseView.text = "아이디 = \(String(id!))\n"
//                        + "이름 = \(String(name!))\n"

                    }

                } catch let e as NSError {print(e.localizedDescription)}
            }
            
            
        }.resume() // resume()을 해야 전송이 됨 : URLSession.shared.dataTask(...)객체
    }
    
}
