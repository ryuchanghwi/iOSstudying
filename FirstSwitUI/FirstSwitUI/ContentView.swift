//
//  ContentView.swift
//  FirstSwitUI
//
//  Created by 류창휘 on 2022/04/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        Text("Hello \nSwiftUI")
//            .font(.largeTitle)
//            .foregroundColor(.blue)
//            .fontWeight(.bold)
//            .padding()
        VStack(spacing: 30) {
            Text("폰트와 굵기 설정")
                .font(.title)
                .fontWeight(.black)
            
            Text("글자식은 foreground, 배경은  background")
                .foregroundColor(.white)
                .padding()
                .background(Color.black)
            
            Text("커스텀 폰트, 볼드체, 이탤릭체, 밑줄, 취소선")
                .font(.custom("Menlo", size: 16)) //커스텀 폰트 설정
                .bold()
                .italic()
                .underline()
                .strikethrough()
            Text("라인 수 제한과 \n 텍스트 정렬 기능입니다. \n 이건 안보입니다.??")
                .lineLimit(2)
                .multilineTextAlignment(.trailing) //다중행 문자열의 정렬 방식 지정
                .fixedSize() //주어진 공간의 크기가 작아도 텍스트를 생략하지 않고 표현되도록 설정
            //2개 이상의 텍스트를 하나로 묶어서 동시에 적용할 수 도 있습니다.
            (Text("자간과 기준선")).kerning(8) //자간
            + Text(" 조정도 쉽게 가능합니다.").baselineOffset(8) //기준선
                .font(.system(size: 16))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

