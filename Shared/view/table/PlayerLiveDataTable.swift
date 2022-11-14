//
//  PlayerLiveDataTable.swift
//  basketballGameStatsTrack (iOS)
// 
//  Created by 范志勇 on 2022/11/11.
// (header: PlayerLiveDataHeader())

import SwiftUI

///队员数据表
///
///表格形式
///- header
///- row
///- footer
struct PlayerLiveDataTable: View {
    // State，设定为private。用于父子之间的视图，父亲为State，儿子为Binding
    @State private var liveDatas = LiveData.createData()
    
    
    var body: some View {
        // 列表：竖向
        VStack(alignment: .leading, spacing: 0) {
            List {
                Section {
                    ForEach(0...liveDatas.count-1, id:\.self) { index in
                        PlayerLiveDataRow(liveData: $liveDatas[index])
                            .frame(height: 60) // 行高
                            .listRowSeparator(.hidden) // 行分割线：隐藏
                            .background { // 行背景色
                                if index % 2 == 0 {
                                    Color.gray.opacity(0.3)
                                } else {
                                    Color.gray.opacity(0.1)
                                }
                            }
//                            .listRowInsets(EdgeInsets()) // 左侧不留空间
                    }
                } header: { // 表头
                    PlayerLiveDataHeader(height: 40) // 40
                        
                } footer: { // 表尾
                    PlayerLiveDataFooter(liveData: LiveData.createTestData())
                }
                // 行定位1/2：位置，需要设定2处，左侧预留空间8
                .listRowInsets(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0)) // leading 8

            }
            .overlay(alignment: .bottomLeading) {
                // 底部统计
                PlayerLiveDataFooter(liveData: LiveData.createTestData())
                    .padding(.leading, 8.0)
                    
            }
            // 配合行定位2/2：位置，需要设定2处
            .listStyle(PlainListStyle())
        }
    }
}

struct PlayerLiveDataTable_Previews: PreviewProvider {
    static var previews: some View {
        PlayerLiveDataTable()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
