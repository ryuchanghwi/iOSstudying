//
//  StackPractice.swift
//  FirstSwitUI
//
//  Created by 류창휘 on 2022/04/29.
//

import SwiftUI

struct StackPractice: View {
    var body: some View {
        VStack {
            Text("도형 만들기").font(.largeTitle).fontWeight(.heavy)
            HStack {
                Text("둥근모양").font(.title)
                Spacer()
            }
            ZStack {
                //사각형의 높이를 10으로 주어 선으로 사용
                Rectangle().frame(height: 10)
                
                HStack {
                    Circle().fill(Color.yellow) //원
                    Ellipse().fill(Color.green) //타원
                    Capsule().fill(Color.orange)
                    RoundedRectangle(cornerRadius: 30).fill(Color.gray) //둥근 모서리 사각형
                    
                }
            }
            
            HStack {
                Text("각진모양").font(.title)
                Spacer()
            } // 각진 모양
            ZStack {
                Rectangle().frame(height:10) //배경선
                
                HStack {
                    Color.red //SwiftUI에서는 컬러 그 자체도 하나의 뷰에 해당합니다.
                    Rectangle().fill(Color.blue) //사각형
                    RoundedRectangle(cornerRadius: 0).fill(Color.purple)
                    //cornerRadius 0으로 준 사각형
                }
            }
            

//            Text("둥근 모양").font(.title)
//            Text("각진 모양").font(.title)
        }.padding()
    }
}

struct StackPractice_Previews: PreviewProvider {
    static var previews: some View {
        StackPractice()
    }
}
