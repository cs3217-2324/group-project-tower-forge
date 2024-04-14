//
//  TFAchievement.swift
//  TowerForge
//
//  Created by Rubesh on 11/4/24.
//

import Foundation

/// The TFAchievement protocol specifies the requirements for all concrete
/// achievements to conform to.
///
/// Each achievement will correspond to a collection of statistics.
protocol Achievement: AnyObject {
    var achievementName: String { get }
    var achievementDescription: String { get }

    var dependentStatistics: [StatisticTypeWrapper: Statistic] { get set }
    var currentValues: [StatisticTypeWrapper: Double] { get }

    var requiredValues: [StatisticTypeWrapper: Double] { get }

    var currentProgressRates: [StatisticTypeWrapper: Double] { get }
    var isComplete: Bool { get }

    func loadStatistic(_ stat: Statistic)
    func update()

}

extension Achievement {
    
    func loadStatistic(_ stat: any Statistic) {
        dependentStatistics[stat.statisticName] = stat
    }

    var currentValues: [StatisticTypeWrapper: Double] {
        var values: [StatisticTypeWrapper: Double] = [:]
        dependentStatistics.keys.forEach { key in
            if let currentStatistic = dependentStatistics[key] {
                values[key] = currentStatistic.permanentValue
            }
        }

        return values
    }

    var currentProgressRates: [StatisticTypeWrapper: Double] {
        var rates: [StatisticTypeWrapper: Double] = [:]
        requiredValues.keys.forEach { key in
            if let requiredValue = requiredValues[key], let currentValue = currentValues[key] {
                rates[key] = currentValue / requiredValue
            }
        }

        return rates
    }

    var isComplete: Bool {
        currentProgressRates.values.allSatisfy { !$0.isLess(than: .unit) }
    }

}
