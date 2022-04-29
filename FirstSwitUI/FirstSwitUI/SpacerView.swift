//
//  SpacerView.swift
//  FirstSwitUI
//
//  Created by 류창휘 on 2022/04/29.
//

import SwiftUI

struct SpacerView: View {
    var body: some View {
//        HStack {
//            Spacer().background(Color.blue).frame(width: 100)
//            Text("Spacer").font(.title).background(Color.yellow)
//        }.background(Color.blue)
//        ZStack {
//            Color.clear
//            Text("Spacer").font(.title).background(Color.yellow)
//
//        }.background(Color.blue)
        VStack {
            Text("제목").font(.largeTitle)
            Text("부제목").foregroundColor(Color.gray)
//            Spacer()
            Text("본문 내용")
//            Spacer()
//            Spacer()
            Text("각주").font(.body)
        }
        .font(.title)
        .frame(width: 200, height: 350)
        .padding()
        .border(Color.blue, width: 2)
    }
}

struct SpacerView_Previews: PreviewProvider {
    static var previews: some View {
        SpacerView()
    }
}
