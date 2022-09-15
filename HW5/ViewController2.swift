

import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var textField: UITextField!

override func viewDidLoad() { super.viewDidLoad() }
        
func isPrime(_ i: Int) -> Bool {
            var isFlagPrime = true
            var divider = 2
            while isFlagPrime && (Double)(divider) <= sqrt(Double(i)) {
            if i % divider == 0 {
                    isFlagPrime = false
                }
                divider += 1
            }
            return isFlagPrime
        }
        
@IBAction func calculatePrimes(_ sender: Any) {
            if let textFieldText = textField.text,
               let n = Int(textFieldText) {
                for i in 1...n {
                    DispatchQueue.global().async {
                        let start = DispatchTime.now()
                        let isPrime = self.isPrime(i)
                        let end = DispatchTime.now()
                        let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
                        let timeInterval = Double(nanoTime) / 1_000_000_000
                        if isPrime {
                            print(i, timeInterval)
                        }
                    }
                }
            }
        }
        


    }
