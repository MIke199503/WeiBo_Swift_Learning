//
//  Post.swift
//  WeiboDemo (iOS)
//
//  Created by 朱桃禾 on 2021/1/5.
//

import SwiftUI
import UIKit
import Foundation

struct PostList:Codable {
    var list:[Post]
}
//再次创建一个结构体是为了跟json文件对齐




struct Post:Codable,Identifiable{
    let id:Int
    let avatar:String
    let vip : Bool
    let name :String
    let date : String
    var isfollowed:Bool

    let text:String
    let image:[String]

    var commentCount : Int
    var likecount : Int
    var isliked : Bool
}

//扩展
extension Post{
    //头像
    var avatarImage:Image{
        return loadImage(name: avatar)
    }

    //评论数计算
    var commentCountText : String {
        if commentCount <= 0 {return "评论"}
        if commentCount <= 1000 {return "\(commentCount)"}
        return String(format: "%.1fk", Double(commentCount) / 1000)
    }

    //点赞数计算
    var likeCountText:String{
        if likecount <= 0 {return "点赞"}
        if likecount <= 1000 {return "\(likecount)"}
        return String(format: "%.1fk", Double(likecount) / 1000)
    }
}

//
let postList = loadPostListData("PostListData_recommend_1.json")
//
func loadPostListData(_ fileName:String) -> PostList {
    //文件地址
    guard let url = Bundle.main.url(forResource: fileName, withExtension: nil ) else{
        fatalError("Can Not Find \(fileName) in main bundle")
        //抛出错误
    }

    //加载数据
    guard let data = try? Data(contentsOf: url)else{
        fatalError("Can't load \(url)")
    }

    guard let list = try? JSONDecoder().decode(PostList.self, from: data) else {
        fatalError("Can not parse post list json data")
    
    }
    //PostList.self ,表示解析城数据格式。
    return list
}


func loadImage(name:String) -> Image {
    return Image(uiImage: UIImage(named: name)!)
}
