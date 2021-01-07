//
//  PostListView.swift
//  WeiboDemo (iOS)
//
//  Created by 朱桃禾 on 2021/1/6.
//

import SwiftUI

struct PostListView: View {
    init() {
        //设置UIKIT默认的分割线
        UITableView.appearance().separatorStyle = .none
        //设置默认的按下特效。
        UITableViewCell.appearance().selectionStyle = .none
    }
    var body: some View {
        List{
            ForEach(postList.list){ post in
                ZStack{
                    PostCell(post:post)
                    NavigationLink(destination: PostDetailView(post: post)){
                        EmptyView()
                    }
                    .hidden()
                    
                    //这里通过Zstach的机制，将navigationlink的小箭头进行隐藏。下面一层是文件，上面一层是空的，相当于手机的膜。
                }
                .listRowInsets(EdgeInsets())
                
            }
        }
        
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            PostListView()
                .navigationBarTitle("Title")
                .navigationBarHidden(true) // 隐藏之前，必须先设置title
        }.navigationTitle("")
        
    }
}
