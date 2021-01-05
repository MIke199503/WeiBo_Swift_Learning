//
//  PostVIPBadge.swift
//  WeiboDemo (iOS)
//
//  Created by 朱桃禾 on 2021/1/4.
//

import SwiftUI

struct PostVIPBadge: View {
    let vip:Bool
    var body: some View {
        if vip{
            Text("V")
                .bold()
                .font(.system(size:11))
                .frame(width: 15, height: 15)
                .foregroundColor(.yellow)
                .background(Color.red)
                .clipShape(Circle())
                .overlay(
                    RoundedRectangle(cornerRadius: 7.5, style: .continuous)
                        .stroke(Color.white,lineWidth: 1)
                )
                
        }
        
    }
}

struct PostVIPBadge_Previews: PreviewProvider {
    static var previews: some View {
        PostVIPBadge(vip: true)
    }
}
