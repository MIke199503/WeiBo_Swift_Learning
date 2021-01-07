//
//  PostImageView.swift
//  WeiboDemo (iOS)
//
//  Created by 朱桃禾 on 2021/1/7.
//

import SwiftUI

private let kImageSpace : CGFloat = 6 //private :私有变量，防止其他文件使用

struct PostImageView: View {
    var image:[String]
    var width:CGFloat
    
    var body: some View {
        Group{
            //1-3张都是一样的，横着放
            if image.count == 1 {
                PostImageCellRow(images: image, width: width)
            }else if image.count == 2{
                PostImageCellRow(images: image, width: width)
            }else if image.count == 3{
                PostImageCellRow(images: image, width: width)
            }else if image.count == 4{
                VStack(spacing:kImageSpace){
                    //使用Array的原因是因为：我们先自己提取出来分配好每行几个的问题，然后再包装起来，因为structure中定义的是【】。
                    PostImageCellRow(images: Array(image[0...1]), width: width) //上面两张
                    PostImageCellRow(images: Array(image[2...3]), width: width) // 下面两张
                }
            }else if image.count == 5{
                VStack(spacing:kImageSpace){
                    PostImageCellRow(images: Array(image[0...1]), width: width) //上面两张
                    PostImageCellRow(images: Array(image[2...4]), width: width) //下面三张
                }
            }else if image.count == 6{
                VStack(spacing:kImageSpace){
                    PostImageCellRow(images: Array(image[0...2]), width: width) // 上面三张
                    PostImageCellRow(images: Array(image[3...5]), width: width) //下面三张
                }
            }
        }
        
    }
}

struct PostImageCellRow : View{
    let images : [String] //获取照片数组
    let width :CGFloat //获取宽度
    var body: some View{
        HStack(spacing : 6){
            ForEach(images,id:\.self ){ image in
                loadImage(name: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: (self.width - 6 * CGFloat( self.images.count - 1 )) / CGFloat(self.images.count),
                           height:(self.width - 6 * CGFloat( self.images.count - 1 )) / CGFloat(self.images.count)
                    )
                    //先计算图片与图片之间的间隔，然后总的减去间隔，再除个数，就得到了每个图片的frame大小。
                    //高度也是一样的计算
                    .clipped()
                
            }
        }
    }
}

struct PostImageView_Previews: PreviewProvider {
    static var previews: some View {
        let images =  postList.list[0].image  //获取单个用户的所有照片数组
        let width = UIScreen.main.bounds.width //获取屏幕宽度
        return Group{
            PostImageView(image: Array(images[0...0]),width: width ) // 显示单张照片
            PostImageView(image: Array(images[0...1]),width: width ) // 显示两张照片
            PostImageView(image: Array(images[0...2]),width: width ) // 显示三张照片
            PostImageView(image: Array(images[0...3]),width: width ) // 显示四张照片
            PostImageView(image: Array(images[0...4]),width: width ) // 显示五张照片
            PostImageView(image: Array(images[0...5]),width: width ) // 显示六张照片
        }
//        .previewLayout(.fixed(width: width, height: 300)) //设置预览的高宽

    }
}
