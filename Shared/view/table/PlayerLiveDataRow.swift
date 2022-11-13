//
//  PlayerLiveDataRow.swift
//  basketballGameStatsTrack (iOS)
//
//  Created by 范志勇 on 2022/11/11.
//liveData.isOnCourt == true ?? font(.system(size: 20)) : font(.system(size: 12))

import SwiftUI

struct PlayerLiveDataRow: View {
    
    let height: CGFloat = 60
    @Binding var liveData: LiveData
    
    //MARK: - 状态，仅读
    var plus_minus: Int
    
    var body: some View {
        let columnWidths = calColumnWidths()
        // 需要设定spacing: 0，缺省不为0
        HStack(alignment: .center, spacing: 0) {
            // nil检测
            Text(liveData.player != nil ? liveData.player! : "")
                .frame(width: columnWidths[0], alignment: .center) // 列宽
                .overlay(alignment: .trailing) {
                    // 分隔符：列
                    Color.white.frame(width: 1, height: height, alignment: .trailing)
                }
                .font(liveData.isOnCourt == true ? Font.system(size: 24) : nil)
                .foregroundColor(liveData.isOnCourt == true ? Color.green : nil)

            Text(liveData.number != nil ? liveData.number! : "")
                .frame(width: columnWidths[1], alignment: .center)
                .overlay(alignment: .trailing) {
                    Color.white.frame(width: 1, height: height, alignment: .trailing)
                }

            Text(liveData.minutes)
                .frame(width: columnWidths[2], alignment: .center)
                .overlay(alignment: .trailing) {
                    Color.white.frame(width: 1, height: height, alignment: .trailing)
                }

            Text(liveData.per)
                .frame(width: columnWidths[3], alignment: .center)
                .overlay(alignment: .trailing) {
                    Color.white.frame(width: 1, height: height, alignment: .trailing)
                }

            // HStack最多有10个，因此需要再分组，使用HStack
            HStack(alignment: .center, spacing: 0) { // 4 - 7
                Text(liveData.points)
                    .frame(width: columnWidths[4], alignment: .center)
                    .overlay(alignment: .trailing) {
                        Color.white.frame(width: 1, height: height, alignment: .trailing)
                    }

                Text(liveData.ft)
                    .multilineTextAlignment(.center)
                    .frame(width: columnWidths[5], height: height, alignment: .center)
                    .overlay(alignment: .trailing) {
                        Color.white.frame(width: 1, height: height, alignment: .trailing)
                    }
                    .overlay(alignment: .topTrailing) {
                        // 不能使用Button，如果是Button，则所有单元格都响应点击事件
//                        Text("+").foregroundColor(.green)
//                            .font(.system(size: 32))
//                            .frame(width: 40, alignment: .center)
//                            .onTapGesture {
//                                print("+")
//                                self.liveData.ft_make_count += self.plus_minus
//                            }
                        
                        Image(systemName: "circle.fill")
                            .frame(width: 40, alignment: .center)
                            .foregroundColor(.green)
                            .onTapGesture {
                                print("+")
                                self.liveData.ft_make_count += self.plus_minus
                            }
                    }
                    .overlay(alignment: .topLeading) {
//                        Text("-").foregroundColor(.red)
//                            .font(.system(size: 32))
//                            .frame(width: 40, alignment: .center)
//                            .onTapGesture {
//                                print("-")
//                                self.liveData.ft_miss_count += self.plus_minus
//                            }
                        
                        Image(systemName: "circle")
                            .frame(width: 40, alignment: .center)
                            .foregroundColor(.red)
                            .onTapGesture {
                                print("-")
                                self.liveData.ft_miss_count += self.plus_minus
                            }
                    }


                Text(liveData.fg2)
                    .multilineTextAlignment(.center)
                    .frame(width: columnWidths[6], height: height, alignment: .center)
                    .overlay(alignment: .trailing) {
                        Color.white.frame(width: 1, height: height, alignment: .trailing)
                    }
                    .overlay(alignment: .topTrailing) {
                        // 不能使用Button，如果是Button，则所有单元格都响应点击事件
//                        Text("+").foregroundColor(.green)
//                            .font(.system(size: 32))
//                            .frame(width: 40, alignment: .center)
//                            .onTapGesture {
//                                print("+")
//                            }
                        
                        Image(systemName: "circle.fill")
                            .frame(width: 40, alignment: .center)
                            .foregroundColor(.green)
                            .onTapGesture {
                                print("+")
                                self.liveData.fg2_make_count += self.plus_minus
                            }

                    }
                    .overlay(alignment: .topLeading) {
//                        Text("-").foregroundColor(.red)
//                            .font(.system(size: 32))
//                            .frame(width: 40, alignment: .center)
//                            .onTapGesture {
//                                print("-")
//                            }
                        Image(systemName: "circle")
                            .frame(width: 40, alignment: .center)
                            .foregroundColor(.red)
                            .onTapGesture {
                                print("-")
                                self.liveData.fg2_miss_count += self.plus_minus
                            }
                    }

     
                Text(liveData.fg3)
                    .multilineTextAlignment(.center)
                    .frame(width: columnWidths[7], height: height, alignment: .center)
                    .overlay(alignment: .trailing) {
                        Color.white.frame(width: 1, height: height, alignment: .trailing)
                    }
                    .overlay(alignment: .topTrailing) {
                        // 不能使用Button，如果是Button，则所有单元格都响应点击事件
//                        Text("+").foregroundColor(.green)
//                            .font(.system(size: 32))
//                            .frame(width: 40, alignment: .center)
//                            .onTapGesture {
//                                print("+")
//                            }
                        
                        Image(systemName: "circle.fill")
                            .frame(width: 40, alignment: .center)
                            .foregroundColor(.green)
                            .onTapGesture {
                                print("+")
                                self.liveData.fg3_make_count += self.plus_minus
                            }
                    }
                    .overlay(alignment: .topLeading) {
//                        Text("-").foregroundColor(.red)
//                            .font(.system(size: 32))
//                            .frame(width: 40, alignment: .center)
//                            .onTapGesture {
//                                print("-")
//                            }
                        
                        Image(systemName: "circle")
                            .frame(width: 40, alignment: .center)
                            .foregroundColor(.red)
                            .onTapGesture {
                                print("-")
                                self.liveData.fg3_miss_count += self.plus_minus
                            }
                    }
            }
            

            Text(liveData.eFG)
                .frame(width: columnWidths[8], alignment: .center)
                .overlay(alignment: .trailing) {
                    Color.white.frame(width: 1, height: height, alignment: .trailing)
                }
                

            HStack(alignment: .center, spacing: 0) {
                Text(liveData.assts)
                    .frame(width: columnWidths[9], alignment: .center)
                    .overlay(alignment: .trailing) {
                        Color.white.frame(width: 1, height: height, alignment: .trailing)
                    }

                Text(liveData.orebs)
                    .frame(width: columnWidths[10], alignment: .center)
                    .overlay(alignment: .trailing) {
                        Color.white.frame(width: 1, height: height, alignment: .trailing)
                    }

                Text(liveData.drebs)
                    .frame(width: columnWidths[11], alignment: .center)
                    .overlay(alignment: .trailing) {
                        Color.white.frame(width: 1, height: height, alignment: .trailing)
                    }

                Text(liveData.steals)
                    .frame(width: columnWidths[12], alignment: .center)
                    .overlay(alignment: .trailing) {
                        Color.white.frame(width: 1, height: height, alignment: .trailing)
                    }

                Text(liveData.blocks)
                    .frame(width: columnWidths[13], alignment: .center)
                    .overlay(alignment: .trailing) {
                        Color.white.frame(width: 1, height: height, alignment: .trailing)
                    }

                Text(liveData.ties)
                    .frame(width: columnWidths[14], alignment: .center)
                    .overlay(alignment: .trailing) {
                        Color.white.frame(width: 1, height: height, alignment: .trailing)
                    }

                Text(liveData.defs)
                    .frame(width: columnWidths[15], alignment: .center)
                    .overlay(alignment: .trailing) {
                        Color.white.frame(width: 1, height: height, alignment: .trailing)
                    }

                Text(liveData.charges)
                    .frame(width: columnWidths[16], alignment: .center)
                    .overlay(alignment: .trailing) {
                        Color.white.frame(width: 1, height: height, alignment: .trailing)
                    }

                Text(liveData.tos)
                    .frame(width: columnWidths[17], alignment: .center)
            }
            
        }
        
        
    }
}

struct PlayerLiveDataRow_Previews: PreviewProvider {
    static var previews: some View {
        // 绑定Binding，使用.constant(LiveData.createTestData())
        PlayerLiveDataRow(liveData: .constant(LiveData.createTestData()), plus_minus: 1)
            .previewInterfaceOrientation(.landscapeRight)
    }
}

