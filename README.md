# Insider Case Framework

Insider Case Framework, iOS uygulamalarında yıldız yönetimi için hızlı ve kolay bir çözüm sunar. Bu framework, yıldızların eklenmesi, listelenmesi ve sıfırlanması gibi temel işlevleri sağlar.

## Kurulum

Framework'ünüzü bir projeye dahil etmek için aşağıdaki adımları takip edin:

1. Projenize `Insider_Case_Framework.framework` dosyasını ekleyin.
2. `General > Frameworks, Libraries, and Embedded Content` bölümünde, framework'ünüzün `Embed & Sign` olarak ayarlandığından emin olun.

## Başlarken

Framework'ünüzü projenizde kullanmaya başlamadan önce, gerekli import işlemini yapın:

```swift
import Insider_Case_Framework

```
## Yıldızları Yönetme

Yıldızları yönetmek için StarsViewModel sınıfından bir örnek oluşturun ve gerekli delegate metodlarını uygulayın:

```swift
class ViewController: UIViewController, StarsViewModelDelegate {
    var viewModel = StarsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
    }

    // StarsViewModelDelegate metodları
    func didUpdateStarCount(to count: Int) {
        // Yıldız sayısı güncellendiğinde yapılacak işlemler
    }

    func didReceiveAlert(message: String) {
        // Kullanıcıya bir mesaj göster
    }

    func didUpdateStarsList() {
        // Yıldız listesi güncellendiğinde yapılacak işlemler
    }
}
```
 
