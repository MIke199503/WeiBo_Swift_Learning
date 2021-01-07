//
//  PostDetailView.swift
//  WeiboDemo (iOS)
//
//  Created by 朱桃禾 on 2021/1/7.
//

import SwiftUI

struct PostDetailView: View {
    let post : Post
    var body: some View {
        List{
            PostCell(post: post)
                .listRowInsets(EdgeInsets())
            
            ForEach(1...10,id:\.self){ i in
            Text("评论：\(i)")
            }
        }
        .navigationBarTitle("详情",displayMode: .inline)
        //设置title的显示模式，inline为滑动的最上方的那个，large是在下方的左边，默认是自动切换。
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(post: postList.list[0])
    }
}
