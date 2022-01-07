//
//  ViewController.swift
//  pomodoroPractice
//
//  Created by 류창휘 on 2022/01/04.
//

import UIKit
import AudioToolbox

enum TimerStatus {
    case start
    case pause
    case end
}

class ViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var toggleButton: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    
    //타이머에 설정된 시간을 초로 저장
    var duration = 60
    var timerStatus: TimerStatus = .end //타이머의 상태를 가지고 있는 프로퍼티
    var timer: DispatchSourceTimer?
    var currentSeconds = 0 //현재 카운트다운되고있는 시간을 초로 저장하는 프로퍼티
    
    func startTimer() {
        if self.timer == nil {
            self.timer = DispatchSource.makeTimerSource(flags: [], queue: .main)
            self.timer?.schedule(deadline: .now(), repeating: 1) //repeating 1초마다
            self.timer?.setEventHandler(handler: { [weak self] in
                guard let self = self else { return }
                self.currentSeconds -= 1
//                debugPrint(self.currentSeconds)
                let hour = self.currentSeconds / 3600
                let minutes = (self.currentSeconds % 3600) / 60
                let seconds = (self.currentSeconds % 3600) % 60
                self.timerLabel.text = String(format: "%02d:%02d:%02d", hour, minutes, seconds)
                self.progressView.progress = Float(self.currentSeconds) / Float(self.duration)
//                debugPrint(self.progressView.progress)
                UIView.animate(withDuration: 0.5, delay: 0, animations: {
                    self.imgView.transform = CGAffineTransform(rotationAngle: .pi)
                })
                UIView.animate(withDuration: 0.5, delay: 0.5, animations: {
                    self.imgView.transform = CGAffineTransform(rotationAngle: .pi * 2)
                })
                
                if self.currentSeconds <= 0 {
                    //타이머 종료
                    self.stopTimer()
                    AudioServicesPlaySystemSound(1005)
                }
            })
            self.timer?.resume()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureToggleButton()
        // Do any additional setup after loading the view.
    }
    
    func setTimerInfoViewVisible(isHidden: Bool) {
        self.timerLabel.isHidden = isHidden
        self.progressView.isHidden = isHidden
    }
    
    //토글상태에 따라 label값을 변경
    func configureToggleButton() {
        self.toggleButton.setTitle("시작", for: .normal)
        self.toggleButton.setTitle("일시정지", for: .selected)
    }
    
    func stopTimer() {
        if self.timerStatus == .pause {
            self.timer?.resume()
        }
        self.timer?.cancel()
        self.timer = nil //nil이 아니면 화면을 벗어나도 타이머가 작동될 수 있기 때문
        self.timerStatus = .end
        self.cancelButton.isEnabled = false
//        self.setTimerInfoViewVisible(isHidden: true)
//        self.datePicker.isHidden = false
        UIView.animate(withDuration: 0.5, animations: {
            self.timerLabel.alpha = 0
            self.progressView.alpha = 0
            self.datePicker.alpha = 1
            self.imgView.transform = .identity //원상태로 복귀
        })
        self.toggleButton.isSelected = false
    }

    @IBAction func tapCancelButton(_ sender: UIButton) {
        switch self.timerStatus {
        case .start, .pause:
//            self.timerStatus = .end
//            self.cancelButton.isEnabled = false
//            self.setTimerInfoViewVisible(isHidden: true)
//            self.datePicker.isHidden = false
//            self.toggleButton.isSelected = false
            self.stopTimer()
        default:
            break
        }
    }
    @IBAction func tapToggleButton(_ sender: UIButton) {
        self.duration = Int(self.datePicker.countDownDuration)
//        debugPrint(self.duration)
        switch self.timerStatus {
        case .end:
            self.currentSeconds = self.duration
            self.timerStatus = .start
//            self.setTimerInfoViewVisible(isHidden: false)
//            self.datePicker.isHidden = true
            UIView.animate(withDuration: 0.5, animations: {
                self.timerLabel.alpha = 1
                self.progressView.alpha = 1
                self.datePicker.alpha = 0
            })
            self.toggleButton.isSelected = true
            self.cancelButton.isEnabled = true
            self.startTimer()
        case .start :
            self.timerStatus = .pause
            self.toggleButton.isSelected = false
            self.timer?.suspend() // 일시 정지
        case .pause:
            self.timerStatus = .start
            self.toggleButton.isSelected = true
            self.timer?.resume() // 다시 시작
        }
    }
    
}

