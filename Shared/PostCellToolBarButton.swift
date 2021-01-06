//
//  PostCellToolBarButton.swift
//  WeiboDemo (iOS)
//
//  Created by 朱桃禾 on 2021/1/6.
//

import SwiftUI

struct PostCellToolBarButton: View {
    let image:String
    let text:String
    let color:Color
    let action:()->Void
    
    
    var body: some View {
        Button(action: action){
            HStack(spacing: 5.0){
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
                Text(text)
                    .font(.system(size: 15))
            }
        }.foregroundColor(color)
    }
}

struct PostCellToolBarButton_Previews: PreviewProvider {
    static var previews: some View {
        PostCellToolBarButton(image: "heart", text: "点赞", color: .red, action: {print("点赞")})
    }
}
