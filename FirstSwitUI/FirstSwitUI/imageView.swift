//
//  ImageView.swift
//  FirstSwitUI
//
//  Created by 류창휘 on 2022/04/28.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        
        HStack(spacing: 30) {
            Image("coda").resizable().frame(width: 100, height: 150)
            Image("coda").resizable()
                .scaledToFit()
                .frame(width: 100, height: 150)
            Image("coda").resizable()
                .scaledToFill()
                .frame(width: 100, height: 150)

//            Image("coda").resizable()
//                .frame(width: 50, height: 50)
//            Image("coda").resizable()
//                .frame(width: 200, height: 200)
//            Image("coda")
//                .resizable(capInsets: .init(top: 0, leading: 50, bottom: 0, trailing: 0))
//                .frame(width: 150, height: 150)
//            Image("coda")
//                .resizable(resizingMode: .tile)
//                .frame(width: 150, height: 150)
        }
        HStack(spacing: 30) {
//            //sclaedToFit 콘텐츠 모드를 적용한 뒤, 너비가 높이보다 1.6배의 비율로 가지도록 조정
//            Image("coda").resizable()
//                .aspectRatio(CGSize(width: 1.6, height: 1), contentMode: .fit)
//                .frame(width: 150, height: 150)
//            // scaledToFill 콘텐츠 모드를 적용한 뒤, 너비가 높이보다 0.7배의 비율을 가지도록 조정
//            Image("coda").resizable()
//                .aspectRatio(0.7, contentMode: .fit)
//                .frame(width: 150, height: 150)
//                .clipped()
            
            Image(systemName: "arrow.up").font(Font.title.weight(.black))
            Image(systemName: "arrow.left").font(Font.title.weight(.semibold))
            Image(systemName: "arrow.down").font(Font.title.weight(.semibold))
            Image(systemName: "arrow.right").font(Font.title.weight(.ultraLight))
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
