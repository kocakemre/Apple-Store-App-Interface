//
//  Urunler.swift
//  eTicaretApp
//
//  Created by Emre Koçak on 9.11.2021.
//

import Foundation

class Urunler {
    
    var urunId:Int?
    var urunAd:String?
    var urunResimAd:String?
    
    init(){
        
    }
    init(urunId:Int,urunAd:String,urunResimAd:String){
        self.urunId = urunId
        self.urunAd = urunAd
        self.urunResimAd = urunResimAd
    }
    
}
