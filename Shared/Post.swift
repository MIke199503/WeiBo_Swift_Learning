//
//  Post.swift
//  WeiboDemo (iOS)
//
//  Created by 朱桃禾 on 2021/1/5.
//

import SwiftUI

struct PostList:Codable {
    var list:[Post]
}
//再次创建一个结构体是为了跟json文件对齐



struct Post:Codable{
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
let postList = loadPostListData("PostListData_recommend_1.json")

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
    
    guard let list = try? JSONDecoder().decode(PostList.self, from: data)else{
        fatalError("Can't parse post list json data~")
    }
    //PostList.self ,表示解析城数据格式。
    return list
}


