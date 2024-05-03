//
//  CalendarCollectionViewCell.swift
//  noms
//
//  Created by Angelina Chen on 5/2/24.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    
    private let week = UILabel()
    private let dateButton = UIButton()
    private let date = UILabel()
    
    static let reuse = "CalendarCollectionViewCellReuse"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
        
//        setupDate()
        setupWeek()
        setuoDate2()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(calendar: Calendar) {
        week.text = calendar.weekday
        dateButton.setTitle(calendar.date, for: .normal)
        date.text = calendar.date
    }

    private func setuoDate2() {
        date.text = "No week"
        date.textColor = UIColor.black
        date.font = .systemFont(ofSize:15, weight: .medium)
        
        contentView.addSubview(date)
        date.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            date.topAnchor.constraint(equalTo: week.bottomAnchor, constant: 7),
            date.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
//            date.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    
    private func setupDate() {
        dateButton.setTitle("None", for: .normal)
        dateButton.titleLabel?.font = .systemFont(ofSize: 11, weight: .medium)
        
        contentView.addSubview(dateButton)
        dateButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dateButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            dateButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
    }
    
    private func setupWeek() {
        week.text = "No week"
        week.textColor = UIColor.a3.coral
        week.font = .systemFont(ofSize:14, weight: .medium)
        
        contentView.addSubview(week)
        week.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            week.topAnchor.constraint(equalTo: contentView.topAnchor),
            week.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
    }
    
    
}
