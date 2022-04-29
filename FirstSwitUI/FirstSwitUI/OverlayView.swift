//
//  OverlayView.swift
//  FirstSwitUI
//
//  Created by 류창휘 on 2022/04/29.
//

import SwiftUI

struct OverlayView: View {
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//        ZStack {
//            Rectangle().fill(Color.green).frame(width: 150, height: 150)
//            Rectangle().fill(Color.yellow).frame(width: 150, height: 150)
//
//        }
        ZStack {
            Rectangle().fill(Color.green).frame(width: 150, height: 150)
                .overlay( //초록색 사각형 위로 뷰 추가
                    Rectangle().fill(Color.yellow)
                )
        }
    }
}

struct OverlayView_Previews: PreviewProvider {
    static var previews: some View {
        OverlayView()
    }
}
