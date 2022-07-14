//
//  TahminEkraniVC.swift
//  Sayı Tahmin Et
//
//  Created by YUSUF ÖZATA on 14.07.2022.
//

import UIKit

class TahminEkraniVC: UIViewController {

    @IBOutlet var labelkalanHak: UILabel!
    
    @IBOutlet var labelYardim: UILabel!
    
    @IBOutlet var textFieldGirdi: UITextField!
    
    var rastgeleSayi : Int?
    var kalanHak = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        rastgeleSayi = Int.random(in: 0...10) // 0 - 10 arasında sayı
        print("Rastgele Sayi\(rastgeleSayi!)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gelenVeri = sender as? Bool {
            let gididlecekVC = segue.destination as! SonucEkraniVC
            gididlecekVC.sonuc = gelenVeri
        }
    }

    @IBAction func tahminEt(_ sender: Any) {
        labelYardim.isHidden = false
        kalanHak -= 1
        
        if let veri = textFieldGirdi.text {
            if let tahmin = Int(veri) {
                if kalanHak != 0 {
                    if tahmin == rastgeleSayi{
                        let sonuc = true
                        performSegue(withIdentifier: "tahminToSonuc", sender: sonuc)
                        return
                    }
                    
                    if tahmin > rastgeleSayi!{
                        labelYardim.text = "Azalt"
                        labelkalanHak.text = "Kalan hak: \(kalanHak)"
                    }
                    
                    if tahmin < rastgeleSayi!{
                        labelYardim.text = "Arttır"
                        labelkalanHak.text = "Kalan hak: \(kalanHak)"
                    }
                    
                }
                
                else{
                    let sonuc = false
                    performSegue(withIdentifier: "tahminToSonuc", sender: sonuc)
            }
                textFieldGirdi.text = ""
        }
            
    }
        
}
}

