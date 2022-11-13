//
//  PlayerLiveDataFooter.swift
//  basketballGameStatsTrack (iOS)
//
//  Created by 范志勇 on 2022/11/11.
//

import SwiftUI

struct PlayerLiveDataFooter: View {

    var liveData: LiveData
    let height: CGFloat = 60
    var body: some View {
        let columnWidths = calColumnWidths()
        
        HStack(alignment: .center, spacing: 0) {
            Text(liveData.player != nil ? liveData.player! : "")
                .frame(width: columnWidths[0], alignment: .center)
                .overlay(alignment: .trailing) {
                    Color.white.frame(width: 1, height: height, alignment: .trailing)
                }

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

            HStack(alignment: .center, spacing: 0) {
                Text(liveData.points)
                    .frame(width: columnWidths[4], alignment: .center)
                    .overlay(alignment: .trailing) {
                        Color.white.frame(width: 1, height: height, alignment: .trailing)
                    }

                Text(liveData.ft)
                    .frame(width: columnWidths[5], alignment: .center)
                    .overlay(alignment: .trailing) {
                        Color.white.frame(width: 1, height: height, alignment: .trailing)
                    }

                Text(liveData.fg2)
                    .frame(width: columnWidths[6], alignment: .center)
                    .overlay(alignment: .trailing) {
                        Color.white.frame(width: 1, height: height, alignment: .trailing)
                    }

     
                Text(liveData.fg3)
                    .frame(width: columnWidths[7], alignment: .center)
                    .overlay(alignment: .trailing) {
                        Color.white.frame(width: 1, height: height, alignment: .trailing)
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
        .frame(height: 60)
        .foregroundColor(.white)
        .background {
            Color.gray
        }
    }
}

struct PlayerLiveDataFooter_Previews: PreviewProvider {
    static var previews: some View {
        PlayerLiveDataFooter(liveData: LiveData.createTestData())
            .previewInterfaceOrientation(.landscapeRight)
    }
}
