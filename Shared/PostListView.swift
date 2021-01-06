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
                PostCell(post: post)
                    .listRowInsets(EdgeInsets())
            }
        }
        
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
