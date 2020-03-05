//
//  ViewController.swift
//  JsonDecodeApp
//
//  Created by 503 on 2020/03/05.
//  Copyright © 2020 ssang. All rights reserved.
//

//파일로 존재하는 제이슨 형식을 아이폰에서 읽어들이고,
//파싱하여 객체에 담아보자 !!
import UIKit
//히어로들을 집합으로 보유할 클래스 정의
class Heroes:Decodable{
    var title:String
    var members:Array<Hero>=Array<Hero>()
    
    init(title:String){
        self.title=title
    }
}

//히어로 한명을 담을 클래스 정의
class Hero:Decodable{
    var name:String
    var gender:String
    var age:Int
    
    init(name:String, gender:String, age:Int){
        self.name=name
        self.gender=gender
        self.age=age
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //제이슨 파일을 읽어들여 파싱한 후 미리 준비한 클래스의 인스턴스에 넣기
        let url = Bundle.main.url(forResource: "sample", withExtension: "json")
        
        //print(url)
        do{
            let stringData = try String(contentsOf: url!, encoding: String.Encoding.utf8)
            print(stringData)
            
            //아직까지는 직접 제이슨 객체로서 역할을 할 수 없는 단순한 문자열에
            // 불과 따라서 파싱하자
            
            //디코딩 하기전에 순수한 /String형은 사용할 수 없으므로
            //Data형으로 변환하여 대압해야한다
            let data = stringData.data(using: String.Encoding.utf8)
           
            //최종적으로 담겨진 데이터를 받자
            //아래의 heroes   변수의 자료형은 ? Heroes이다!!
            let heroes = try JSONDecoder().decode(Heroes.self, from:data!)
            
            //제이슨데이터가 위 클래스에 채워져 있는지 확인한다
            print(heroes.title)
            
            for obj in heroes.members{
                print("name: \(obj.name), gender:\(obj.gender), age:\(obj.age)")
            }
            
        }catch{
            print("스트링 변환 실패")
        }
        
        
    }


}

