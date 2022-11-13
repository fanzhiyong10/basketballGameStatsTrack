//
//  TeamInfo.swift
//  basketballStatsTracker
//
//  Created by 范志勇 on 2022/10/17.
//

import UIKit

// Header Words
let headerWords = ["PLAYER", "NUMBER", "MINUTES", "PER", "POINTS", "FT", "2FG", "3FG", "eFG%", "ASSTS", "OREBS", "DREBS", "STEALS", "BLOCKS", "TIES", "DEFS", "CHARGES", "TOS"]

let headerWordsPart1 = ["PLAYER", "NUMBER", "MINUTES", "PER", "POINTS", "FT Make", "FT Total", "FT Make %", "2FG Make", "2FG Total", "2FG Make %", "3FG Make", "3FG Total", "3FG Make %", "eFG%", "ASSTS", "OREBS", "DREBS", "STEALS", "BLOCKS", "TIES", "DEFS", "CHARGES", "TOS"]
let headerWordsPart2 = ["1pt make", "1pt miss", "1pt %", "2pt make", "2pt miss", "2pt %", "3pt make", "3pt miss", "3pt %"]

let headerCellColors: [UIColor] = [UIColor.clear, UIColor.clear, UIColor.clear, UIColor.clear, UIColor.clear, UIColor.clear, UIColor.clear, UIColor.clear, UIColor.clear, UIColor.systemYellow, UIColor.systemOrange, UIColor(displayP3Red: 1.0, green: 1.0, blue: 224.0/255, alpha: 1.0), UIColor(displayP3Red: 192.0/255, green: 192.0/255, blue: 192.0/255, alpha: 1.0), UIColor.black, UIColor.purple, UIColor.gray, UIColor.systemGreen, UIColor.systemRed]

let headerFontColors: [UIColor] = [UIColor.white, UIColor.white, UIColor.white, UIColor.white, UIColor.white, UIColor.white, UIColor.white, UIColor.white, UIColor.white, UIColor.systemBlue, UIColor.systemBlue, UIColor.systemBlue, UIColor.systemBlue, UIColor.white, UIColor.white, UIColor.white, UIColor.white, UIColor.white]
/*
/// 主队信息
class MyTeamInfo {
    // 队名
    var name: String? = "Team"
    
    // 7个小节的比赛数据
    var periodInfos: [PeriodInfo]?
    
    // 比赛得分
    var score: Int {
        var total = 0
        if periodInfos != nil {
            for item in periodInfos! {
                total += item.score // 得分
            }
        }
        return total
    }
    
    var hasSorted = false
    
    var periodOnPlaying: PeriodInfo? {
        guard self.periodInfos != nil else {
            return nil
        }
        
        if self.periodInfos?.first?.status == .NotStart {
            // 第一个
            return self.periodInfos?.first
        }
        
        for pinf in self.periodInfos! {
            switch pinf.status {
            case .IsPlayingOnDisplay, .IsPlayingOffDisplay:
                
                if hasSorted == false {
                    // 排序
                    var arr_onCourt = [LiveData]()
                    var arr_notOnCourt = [LiveData]()
                    for livedata in pinf.liveDatas! {
                        if livedata.isOnCourt {
                            arr_onCourt.append(livedata)
                        } else {
                            arr_notOnCourt.append(livedata)
                        }
                    }
                    
                    pinf.liveDatas = arr_onCourt + arr_notOnCourt
                    
                    hasSorted = true
                }
                
                return pinf
            default:
                break
            }
        }
        
        return nil
    }
    
    
    // 正在比赛中的小节索引
    var indexOfPeriodOnPlaying: Int? {
        guard self.periodInfos != nil else {
            return nil
        }
        
        for (index, pinf) in self.periodInfos!.enumerated() {
            switch pinf.status {
            case .IsPlayingOnDisplay, .IsPlayingOffDisplay:
                return index
            default:
                break
            }
        }
        
        return nil
    }
    
    // 高亮的小节数量
    var countOfPeriodOnHighlight: Int? {
        guard self.periodInfos != nil else {
            return nil
        }
        
        var count = 0
        for pinf in self.periodInfos! {
            if pinf.isHighlight {
                count += 1
            }
        }
        
        return count
    }
    
    // 多个高亮时的合并数据，不能做修改，不包括正在比赛中的。比赛的另外计算
    var liveDatasOnHighlight: [LiveData]? {
        print("liveDatasOnHighlight")
        if countOfPeriodOnHighlight == 1 {
            print("if countOfPeriodOnHighlight == 1")
            // 将高亮的返回
            for pinf in self.periodInfos! {
                if pinf.isHighlight {
                    return pinf.liveDatas
                }
            }
        } else {
            print("statisticsLiveData")
            // 创建一个统计数组，并返回，排序按照字母顺序
            let statisticsLiveData = liveDatasWithoutPlaying
            
            for pinf in self.periodInfos! {
                if pinf.isHighlight {
                    for (index, ld) in pinf.liveDatas!.enumerated() {
                        statisticsLiveData[index].time_cumulative += ld.time_cumulative
                        
                        statisticsLiveData[index].ft_make_count += ld.ft_make_count
                        statisticsLiveData[index].ft_miss_count += ld.ft_miss_count
                        
                        statisticsLiveData[index].fg2_make_count += ld.fg2_make_count
                        statisticsLiveData[index].fg2_miss_count += ld.fg2_miss_count
                        
                        statisticsLiveData[index].fg3_make_count += ld.fg3_make_count
                        statisticsLiveData[index].fg3_miss_count += ld.fg3_miss_count
                        
                        statisticsLiveData[index].assts_count += ld.assts_count
                        statisticsLiveData[index].orebs_count += ld.orebs_count
                        statisticsLiveData[index].drebs_count += ld.drebs_count
                        statisticsLiveData[index].steals_count += ld.steals_count
                        statisticsLiveData[index].blocks_count += ld.blocks_count
                        statisticsLiveData[index].defs_count += ld.defs_count
                        statisticsLiveData[index].charges_count += ld.charges_count
                        statisticsLiveData[index].tos_count += ld.tos_count
                        
                        if ld.isOnCourt {
                            statisticsLiveData[index].isOnCourt = ld.isOnCourt
                        }
                    }
                }
            }
            return statisticsLiveData
        }
        return nil
    }
    
    var liveDatasWithoutPlaying: [LiveData] {
        var result = [LiveData]()
        
        for tmp in self.periodInfos![0].liveDatas! {
            let ld = LiveData()
            
            ld.id = tmp.id
            ld.player = tmp.player
            ld.number = tmp.number
//            ld.isOnCourt = tmp.isOnCourt
            
            result.append(ld)
        }
        
        return result
    }
    
    // 当前比赛的小节是否在选中的多个高亮中
    var isPlayingInMultiHighlight: Bool {
        guard self.countOfPeriodOnHighlight != nil else {
            return false
        }
        
        // 必须是多选
        if self.countOfPeriodOnHighlight! <= 1 {
            return false
        }
        
        return periodOnPlaying!.isHighlight
    }
    
    // 应当使用id（不变）来排序，用于统计分析
    func sortAllPeriods() {
        guard self.periodInfos != nil else {
            return
        }
        /*
        for pInfo in self.periodInfos! {
            pInfo.liveDatas?.sort { (s1, s2) -> Bool in
                   if isPlayerSpace(s1.player!) {
                       return false
                   }
                   
                   let tmp = s1.player! < s2.player!
                   
                   return tmp
            }
        }
        */
        for pInfo in self.periodInfos! {
            pInfo.liveDatas?.sort { (s1, s2) -> Bool in
                   let tmp = s1.id < s2.id
                   
                   return tmp
            }
        }
    }
    
    func isPlayerSpace(_ player: String) -> Bool {
        if player.hasPrefix(" ") {
            let str = player
            
            for a in str {
                if a != " " {
                    return false
                }
            }
            
            return true
        }
        
        return false
    }
    
    func setOnCourt(current: Int, next: Int) {
        var result = [LiveData]()
        
        for tmp in self.periodInfos![current].liveDatas! {
            let ld = LiveData()
            
            ld.id = tmp.id
            ld.player = tmp.player
            ld.number = tmp.number
            ld.isOnCourt = tmp.isOnCourt
            
            result.append(ld)
        }
        
        self.periodInfos![next].liveDatas = result
    }
    
    func toStringOfCsv() -> String? {
        guard self.periodInfos != nil else {
            return nil
        }
        
        var str = ""
        // 第一行：头
        str += "Period"
        for word in headerWordsPart1 {
            str += "," + word
        }
        
        for word in headerWordsPart2 {
            str += "," + word
        }
        
        str += "\n"
        // 实际数据
        for (index, pInfo) in periodInfos!.enumerated() {
            if pInfo.status == .NotStart {
                break
            }
            if let csv = pInfo.toStringOfCsv() {
                str += csv
                
                // 最后一个没有换行符"\n"
                if index < periodInfos!.count - 1 {
                    if periodInfos![index + 1].status == .NotStart {
                        //
                    } else {
                        str += "\n"
                    }
                }
            }
        }
        
        return str
    }
}

/// 小节信息
class PeriodInfo {
    var name = "P1"
    // 比赛数据
    var liveDatas: [LiveData]?
    
    // 小节得分
    var score: Int {
        var total = 0
        if liveDatas != nil {
            for ld in liveDatas! {
                total += ld.points_cal // 得分u
            }
        }
        return total
    }
    
    // 比赛状态
    var status = PeriodStatus.NotStart // 初始状态：未开始
    
    // 是否选中
    var isSelected = false
    
    // 是否红框
    var isHighlight = false
    
    func toStringOfCsv() -> String? {
        guard self.liveDatas != nil else {
            return nil
        }
        
        var str = ""
        for (index, ld) in self.liveDatas!.enumerated() {
            str += name + ","
            if let csv = ld.toStringOfCSV() {
                str += csv
                
                if index < self.liveDatas!.count - 1 {
                    str += "\n"
                }
            }
        }
        
        return str
    }
}

///客队（对手）信息
class OpponentTeamInfo {
    // 队名
    var name: String? = "Opponent"
    
    // 小节得分
    var periodScores: [Int]?
    
    // 比赛得分
    var score: Int {
        var total = 0
        if periodScores != nil {
            for item in periodScores! {
                total += item // 得分
            }
        }
        return total
    }
}
*/
