//
//  StarViewModel.swift
//  Insider_Case_Framework
//
//  Created by Ozgun Dogus on 16.03.2024.
//

import Foundation

public protocol StarsViewModelDelegate: AnyObject {
    func didUpdateStarCount(to count: Int)
    func didReceiveAlert(message: String)
    func didUpdateStarsList()
}

public class StarsViewModel {
    public weak var delegate: StarsViewModelDelegate?
    private var stars = [Star]() {
        didSet {
            delegate?.didUpdateStarsList()
        }
    }
    
    public init() {}

    public func addStarInterface(size: String) {
        addStar(size: size)
    }
    
    private func addStar(size: String) {
        if stars.count >= 10 {
            delegate?.didReceiveAlert(message: "Sky is full")
            return
        }
        
        let colorOptions = size == "S" ? ["Red", "Blue", "Green"] : ["Yellow", "Purple", "Gray"]
        let brightnessOptions = ["Bright", "Not so bright"]
        
        let star = Star(size: size,
                        color: colorOptions.randomElement()!,
                        brightness: brightnessOptions.randomElement()!)
        stars.append(star)
        delegate?.didUpdateStarCount(to: stars.count)
        print("Adding star of size: \(size)")
        print("Star added. Total count: \(stars.count)")
        print("Delegate didUpdateStarCount called with count: \(stars.count)")
    }
    
    public func resetStars() {
        stars.removeAll()
        delegate?.didUpdateStarCount(to: stars.count)
    }

    
    func getStarCount() -> Int {
        return stars.count
    }
    
    func getStarDetails(at index: Int) -> Star? {
        guard index < stars.count else { return nil }
        return stars[index]
    }

    func printStars() {
        var starsDetails = stars.map { "Star - Size: \($0.size), Color: \($0.color), Brightness: \($0.brightness)" }
        starsDetails.append("Bright Stars Count: \(stars.filter { $0.brightness == "Bright" }.count)")
        delegate?.didReceiveAlert(message: starsDetails.joined(separator: "\n"))
    }

    func saveStars() {
        do {
            let data = try JSONEncoder().encode(stars)
            UserDefaults.standard.set(data, forKey: "stars")
        } catch {
            print("Error saving stars: \(error)")
        }
    }
    
    func loadStars() {
        guard let data = UserDefaults.standard.data(forKey: "stars"),
              let savedStars = try? JSONDecoder().decode([Star].self, from: data) else { return }
        stars = savedStars
        delegate?.didUpdateStarsList()
    }
}
