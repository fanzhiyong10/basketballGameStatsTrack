//
//  GameClockView.swift
//  basketballGameStatsTrack (iOS)
//
//  Created by 范志勇 on 2022/11/13.
//

import SwiftUI

/// 比赛计时器
///
/// 工作逻辑
/// - 点击按钮START，开始计时，同时：隐藏按钮START，显示按钮STOP
///
/// 设计思路
/// - 使用Timer，重复，每秒1次
/// - 计时器显示文本 onReceive(timer)
/// - 状态控制：started，显示的按钮（START、STOP）及 是否对计时器进行累加
struct GameClockView: View {
    //MARK: - 全局环境变量 PlusMinus
    @EnvironmentObject var plusMinus: PlusMinus

    //MARK: - 控制按钮的显示：START、STOP
    @State var started = false
    
    //MARK: - 比赛进行了多长时间，计数器
    @State private var game_cum_duration: Float = 23 * 60 + 45
    
    //MARK: - 比赛计时器，每个1秒钟更新一次（重复），1）点击start开始计时，2）点击stop停止计时
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {

            VStack(alignment: .center, spacing: 10) {
                Text("\(calGameClock())")
                    .frame(width: 350)
                    .font(.system(size: 32))
                    .foregroundColor(.green)
                    .onReceive(timer) { time in
                        if started == true {
                            // 开始后，计时器：累加
                            self.game_cum_duration += 1
                            
                            // 上场队员的计时累加
                        }
                    }
                
                HStack(alignment: .center) {
                    
                    // 对齐：左侧
                    if started == false {
                        Button(action: {
                            print("Start")
                            started = true
                        }) {
                            Text("START")
                                .frame(width: 50, height: 50, alignment: .center)
                                .font(.system(size: 12))
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(25)
                        }
                    } else {
                        Button(action: {
                            print("Stop")
                            // 停止
                            started = false
                        }) {
                            Text("STOP")
                                .frame(width: 50, height: 50, alignment: .center)
                                .font(.system(size: 12))
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(25)
                        }
                    }
                    
                    // 对齐
                    Spacer()
                    
                    // 对齐：右侧
                    Image(systemName: "plus.magnifyingglass")
                        .font(.system(size: 50))
                        .onTapGesture {
                            print("plus.magnifyingglass")
                            plusMinus.isOnZoomin.toggle()
                        }
                    
                    Spacer()
                    
                    Text("PLAYERS")
                        .frame(width: 120, height: 40, alignment: .center)
                        .font(.title2)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    

                }
                .frame(width: 350.0)
                
            }
        
        
    }
    
    /// 计时器 换算为显示的 时：分：秒
    func calGameClock() -> String {
        let hours = Int(self.game_cum_duration / 3600)
        let minutes = Int((self.game_cum_duration - Float(hours) * 3600) / 60)
        let seconds = Int(self.game_cum_duration - Float(hours) * 3600 - Float(minutes * 60))
        var str = "Game Clock  "
        str += String(format: "%02d", hours) + " : "
        str += String(format: "%02d", minutes) + " : "
        str += String(format: "%02d", seconds)
        
        return str
    }
}

struct GameClockView_Previews: PreviewProvider {
    static var previews: some View {
        GameClockView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
