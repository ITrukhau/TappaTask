//
//  WATableViewCell.swift
//  TappaTask1
//
//  Created by Ilya Trukhau on 11/16/23.
//

import UIKit

final class WATableViewCell: UITableViewCell {
    @IBOutlet private var randomImageView: UIImageView!
    
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var startDateLabel: UILabel!
    @IBOutlet private var endDateLabel: UILabel!
    @IBOutlet private var senderName: UILabel!
    @IBOutlet private var durationLabel: UILabel!
    
    func configure(with weatherAlert: WeatherAlert) {
        let properties = weatherAlert.properties
        
        nameLabel.text = properties.event
        senderName.text = properties.senderName
        
        let dateFormatter = ISO8601DateFormatter()
        let startDateString = properties.effective ?? "N/A"
        let startDate = dateFormatter.date(from: startDateString)
        let endDateString = properties.ends ?? "N/A"
        let endDate = dateFormatter.date(from: endDateString)
        
        startDateLabel.text = "Starts: \(formatDate(startDate))"
        endDateLabel.text = "Ends: \(formatDate(endDate))"
        durationLabel.text = "Duration: \(formatDuration(startDate: startDate, endDate: endDate))"
    }
    
    func setImage(_ image: UIImage?) {
        randomImageView.image = image
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        randomImageView.image = nil
        nameLabel.text = nil
        startDateLabel.text = nil
        endDateLabel.text = nil
        senderName.text = nil
        durationLabel.text = nil
    }
    
    // MARK: - Date formatting
    private func formatDuration(startDate: Date?, endDate: Date?) -> String {
        guard let startDate, let endDate else { return "N/A" }
        
        let interval = endDate.timeIntervalSince(startDate)
        
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.day, .hour, .minute]
        return formatter.string(from: interval) ?? "N/A"
    }
    
    private func formatDate(_ date: Date?) -> String {
        guard let date = date else { return "N/A" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }
}
