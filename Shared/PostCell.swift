//
//  PostCell.swift
//  WeiboDemo (iOS)
//
//  Created by 朱桃禾 on 2021/1/4.
//

import SwiftUI

struct PostCell: View {
    let post:Post
    
    var body: some View {
        HStack(spacing: 5.0) {
            Image(uiImage: UIImage(named: post.avatar)!)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(
                    PostVIPBadge(vip: post.vip)
                        .offset(x: 16, y: 16)
                )
            
            
            VStack {
                Text(post.name)
                    .font(Font.system(size: 16))
                    .foregroundColor(Color(#colorLiteral(red: 0.9490196078, green: 0.3882352941, blue: 0.01568627451, alpha: 1)))
                    .lineLimit(1)
                Text(post.date)
                    .font(.system(size:11))
                    .foregroundColor(.gray)
                
            }
            .padding(.leading,10)
            
            Spacer()
            
            if !post.isfollowed{
                Button(action:{print("Click")}) {
                    Text("关注")
                        .font(.system(size: 16))
                        .foregroundColor(.orange)
                        .frame(width: 50, height: 26)
                        .overlay(
                            RoundedRectangle(cornerRadius: 13, style: .continuous)
                                .stroke(Color.orange,lineWidth: 1)
                        )
                }
            }
        }
        .padding(.horizontal)
        
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post:postList.list[0])
    }
}
