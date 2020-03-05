//
//  CourseDetail.swift
//  my-swift-ui
//
//  Created by Amza Andrei on 3/4/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import SwiftUI

struct CourseDetail: View {
    
    var course: Course
    @Binding var active: Bool
    @Binding var activeIndex: Int
    @Binding var show: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    HStack(alignment: .top){
                        VStack(alignment: .leading, spacing: 8){
                            Text(course.title)
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(Color.white)
                            Text(course.subtitle)
                                .foregroundColor(Color.white.opacity(0.7))
                        }
                        Spacer()
                        ZStack {
                            VStack {
                                Image(systemName: "xmark")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                            }
                            .frame(width: 36, height: 36)
                            .background(Color.black)
                            .clipShape(Circle())
                            .onTapGesture {
                                self.show = false
                                self.active = false
                                self.activeIndex = -1
                            }
                        }
                    }
                    Spacer()
                    Image(uiImage: course.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .frame(height: 140, alignment: .top)
                    
                }
                .padding(show ? 30 : 20)
                .padding(.top, show ? 30 : 0)
                    //        .frame(width: show ? screen.width : screen.width - 60 ,height: show ? screen.height : 280)
                .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? 460 : 280)
                .background(Color(course.color))
                .shadow(color: Color(course.color).opacity(0.3), radius: 20, x: 0, y: 20)    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                
                VStack(alignment: .leading, spacing: 30){
                    Text("Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.")
                    
                    Text("About this courses")
                        .font(.title).bold()
                    
                    Text("Advanced extended doubtful he he blessing together. Introduced far law gay considered frequently entreaties difficulty. Eat him four are rich nor calm. By an packages rejoiced exercise. To ought on am marry rooms doubt music. Mention entered an through company as. Up arrived no painful between. It declared is prospect an insisted pleasure. ")
                    
                    Text("She who arrival end how fertile enabled. Brother she add yet see minuter natural smiling article painted. Themselves at dispatched interested insensible am be prosperous reasonably it. In either so spring wished. Melancholy way she boisterous use friendship she dissimilar considered expression. Sex quick arose mrs lived. Mr things do plenty others an vanity myself waited to. Always parish tastes at as mr father dining at. Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects. ")
                }
                .padding(30)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CourseDetail_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetail(course: coursesData[0], active: .constant(true), activeIndex: .constant(-1), show: .constant(true))
    }
}
