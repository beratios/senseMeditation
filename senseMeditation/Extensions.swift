//
//  Extensions.swift
//  senseMeditation
//
//  Created by Berat Gültekin on 2.07.2022.
//

import Foundation


extension DateComponentsFormatter {
    static let abbreviated: DateComponentsFormatter = {
        print("Initializinf DateComponnetsFormatter.abbreviated")
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        return formatter
    }()
    static let positional: DateComponentsFormatter = {
        print("Initializinf DateComponnetsFormatter.positional")
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }()
}

