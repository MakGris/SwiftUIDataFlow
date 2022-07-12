//
//  TimeCounter.swift
//  StateAndDataFlow
//
//  Created by Maksim Grischenko on 09.07.2022.
//

import Foundation
import Combine

class TimeCounter: ObservableObject {
    let objectWillChange = PassthroughSubject<TimeCounter, Never>()
    var counter = 3
    var timer: Timer?
    var buttonTitle = "Start"
    
    func startTimer() {
        if counter > 0 {
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true
        )
        }
        buttonDidTap()
    }
    
    @objc private func  updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            buttonTitle = "Reset"
        }
        objectWillChange.send(self)
        
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func buttonDidTap() {
        if buttonTitle == "Reset" {
            counter = 3
            buttonTitle = "Start"
        } else {
            buttonTitle = "Wait..."
        }
        objectWillChange.send(self)
    }
}
