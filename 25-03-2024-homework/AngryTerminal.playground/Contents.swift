import Foundation

struct Topatar {
    var yerlesimAcisi: Double
    var firlatmaHizi: Double

    func menzilHesapla() -> Double {
        let g = 10.0
        let pi = 3.14
        let tetaRad = yerlesimAcisi * pi / 180
        return (firlatmaHizi * firlatmaHizi * sin(2 * tetaRad)) / g
    }
}

struct Sise {
    var konum: Double
    var kaplamaUzakligi: Double
    var durum: Int

    mutating func vurulmaDurumu(menzil: Double) {
        if konum - kaplamaUzakligi <= menzil && menzil <= konum + kaplamaUzakligi {
            durum = 0
        } else {
            durum = 1
        }
    }
}

struct Oyuncu {
    var takmaAd: String
    var puan: Int

    mutating func puanArttir() {
        puan += 1
    }
}

class Oyun {
    var oyuncu: Oyuncu
    var topatar: Topatar
    var sise: Sise

    init(oyuncu: Oyuncu, topatar: Topatar, sise: Sise) {
        self.oyuncu = oyuncu
        self.topatar = topatar
        self.sise = sise
    }

    func firlatmaYap() {
        let menzil = topatar.menzilHesapla()
        sise.vurulmaDurumu(menzil: menzil)
        if sise.durum == 0 {
            oyuncu.puanArttir()
            print("Şişe vuruldu \noyuncu puanı: \(oyuncu.puan)")
        } else {
            print("Şişe vurulamadı \noyuncu puanı: \(oyuncu.puan)")
        }
    }
}

let oyun1 = Oyun(oyuncu: Oyuncu(takmaAd: "mert", puan: 0), topatar: Topatar(yerlesimAcisi: 45, firlatmaHizi: 30), sise: Sise(konum: 90, kaplamaUzakligi: 0.5, durum: 1))
oyun1.firlatmaYap()
oyun1.firlatmaYap()
