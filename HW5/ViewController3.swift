

import UIKit

class ViewController3: UIViewController {

    @IBOutlet weak var DispatchQueueTime: UILabel!
    @IBOutlet weak var DispatchQueueTime2: UILabel!
    @IBOutlet weak var GlobalTime: UILabel!
    
    let delay = 0.1
        
        var timer: Timer?
        var counter: Float = 0.00 {
        didSet { DispatchQueueTime.text = String(format: "%.1f", counter) }
        }
    
        var timer2: Timer?
        var counter2: Float = 0.00 {
        didSet { GlobalTime.text = String(format: "%.1f", counter) }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
        self.timer = Timer.scheduledTimer(timeInterval: self.delay, target:self, selector: #selector(self.UpdateTimer), userInfo: nil, repeats: true)
                    
        DispatchQueue.global(qos: .utility).async {
        self.timer2 = Timer.scheduledTimer(timeInterval: self.delay, target:self, selector: #selector(self.UpdateTimer2), userInfo: nil, repeats: true)
                    }
                }
            }
        @objc func UpdateTimer() { counter = counter + Float(delay) }
        @objc func UpdateTimer2() { counter2 = counter2 + Float(delay) }
        }
    



