//
//  ViewController.swift
//  eTicaretApp
//
//  Created by Emre Koçak on 8.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var urunCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var urunListesi = [Urunler]()
    var urunDetayListesi = [UrunDetay]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UINavigationBarAppearance()
        
        appearance.backgroundColor = UIColor(white: 0.94, alpha: 1)
        
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        let a = UITabBarAppearance()
        a.backgroundColor = UIColor(white: 0.94, alpha: 1)
        
        tabBarController?.tabBar.standardAppearance = a
        tabBarController?.tabBar.scrollEdgeAppearance = a
        
        self.navigationItem.title = "Alışveriş yapın"
        
        urunCollectionView.delegate = self
        urunCollectionView.dataSource = self
        searchBar.delegate = self
        
        let u1 = Urunler(urunId: 1, urunAd: "Mac", urunResimAd: "mac")
        let u2 = Urunler(urunId: 2, urunAd: "iPhone", urunResimAd: "iphone")
        let u3 = Urunler(urunId: 3, urunAd: "iPad", urunResimAd: "ipad")
        let u4 = Urunler(urunId: 4, urunAd: "Apple Watch", urunResimAd: "watch")
        let u5 = Urunler(urunId: 5, urunAd: "Apple TV", urunResimAd: "tv")
        let u6 = Urunler(urunId: 6, urunAd: "AirPods", urunResimAd: "airpodsKopyası")
        urunListesi.append(u1)
        urunListesi.append(u2)
        urunListesi.append(u3)
        urunListesi.append(u4)
        urunListesi.append(u5)
        urunListesi.append(u6)
        
        let f1 = UrunDetay(urun_id: 1, urun_ad: "Macbook Pro 14", urun_resim_ad: "bilgisayar", urun_fiyat: 23499.9)
        let f2 = UrunDetay(urun_id: 2, urun_ad: "iPhone 13", urun_resim_ad: "telefon", urun_fiyat: 13999.99)
        let f3 = UrunDetay(urun_id: 3, urun_ad: "iPad Mini", urun_resim_ad: "ipad2", urun_fiyat: 5999.9)
        let f4 = UrunDetay(urun_id: 4, urun_ad: "Apple Watch 7", urun_resim_ad: "watch2", urun_fiyat: 4599.9)
        let f5 = UrunDetay(urun_id: 5, urun_ad: "Apple TV", urun_resim_ad: "tv2", urun_fiyat: 1999.9)
        let f6 = UrunDetay(urun_id: 6, urun_ad: "AirPods 3", urun_resim_ad: "airpods2", urun_fiyat: 1999.9)
        urunDetayListesi.append(f1)
        urunDetayListesi.append(f2)
        urunDetayListesi.append(f3)
        urunDetayListesi.append(f4)
        urunDetayListesi.append(f5)
        urunDetayListesi.append(f6)
        
        let genislik = urunCollectionView.frame.size.width
        let tasarim = UICollectionViewFlowLayout()
        
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 20
        
        let hucreGenislik = (genislik-30)/2
        tasarim.itemSize = CGSize(width: hucreGenislik, height: hucreGenislik*1.25)
        urunCollectionView.collectionViewLayout = tasarim
        urunCollectionView.backgroundColor = UIColor(white: 0.94, alpha: 1)
        
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Arama sonucu: \(searchText)")
    }
}

extension ViewController:UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return urunListesi.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let urun = urunListesi[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "urunHucre", for: indexPath) as! HucreCollectionViewCell
        cell.urunLabel.text = urun.urunAd!
        cell.urunImageView.image = UIImage(named: urun.urunResimAd!)
        cell.layer.cornerRadius = 25.0
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let urun = urunListesi[indexPath.row]
        print("\(urun.urunAd!) ürünü seçildi.")
        let urunDetay = urunDetayListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: urunDetay)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            let urunDetay = sender as? UrunDetay
            let gidilecekVC = segue.destination as! DetayVC
            gidilecekVC.urun = urunDetay
        }
    }
}
