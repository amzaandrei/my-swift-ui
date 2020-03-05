//
//  CourseList.swift
//  my-swift-ui
//
//  Created by Amza Andrei on 3/3/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import SwiftUI

struct CourseList: View {
    
    @ObservedObject var store = CourseStore()
    @State var active = false
    @State var activeIndex = -1
    
    var body: some View {
        ScrollView{
            VStack(spacing: 30) {
                
                Text("Courses")
                    .font(.largeTitle).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                    .padding(.top, 30)
                    .blur(radius: active ? 20 : 0)
                    
                
                ForEach(store.courses.indices, id: \.self) { index in
                    GeometryReader { geometry in
                        CourseView(
                            show: self.$store.courses[index].show,
                            course: self.store.courses[index],
                            active: self.$active,
                            index: index,
                            activeIndex: self.$activeIndex
                        )
                            .offset(y: self.store.courses[index].show ? -geometry.frame(in: .global).minY : 0)
                            .opacity(self.activeIndex != index && self.active ? 0 : 1)
                            .scaleEffect(self.activeIndex != index && self.active ? 0.5 : 1)
                            .offset(x: self.activeIndex != index && self.active ? screen.width : 0)
                    }
                    .frame(height: self.store.courses[index].show ? screen.height :  280)
                    .frame(maxWidth: self.store.courses[index].show ? .infinity : screen.width - 60)
                }
            }
            .frame(width: screen.width)
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        }
        .statusBar(hidden: active ? true : false)
        .animation(.linear)
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}

struct CourseView: View {
    
    @Binding var show: Bool
    var course: Course
    @Binding var active: Bool
    var index: Int
    @Binding var activeIndex: Int
    @State var activeView = CGSize.zero
    
    var body: some View {
        ZStack(alignment: .top) {
            
            VStack(alignment: .leading, spacing: 30){
                Text("Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.")
                
                Text("About this courses")
                    .font(.title).bold()
                
                Text("Advanced extended doubtful he he blessing together. Introduced far law gay considered frequently entreaties difficulty. Eat him four are rich nor calm. By an packages rejoiced exercise. To ought on am marry rooms doubt music. Mention entered an through company as. Up arrived no painful between. It declared is prospect an insisted pleasure. ")
                
                Text("She who arrival end how fertile enabled. Brother she add yet see minuter natural smiling article painted. Themselves at dispatched interested insensible am be prosperous reasonably it. In either so spring wished. Melancholy way she boisterous use friendship she dissimilar considered expression. Sex quick arose mrs lived. Mr things do plenty others an vanity myself waited to. Always parish tastes at as mr father dining at. Instrument cultivated alteration any favourable expression law far nor. Both new like tore but year. An from mean on with when sing pain. Oh to as principles devonshire companions unsatiable an delightful. The ourselves suffering the sincerity. Inhabit her manners adapted age certain. Debating offended at branched striking be subjects. ")
            }
            .padding(30)
            .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? .infinity : 280, alignment: .top)
            .offset(y: show ? 460 : 0)
            .background(Color("background2"))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius:  20, x: 0, y: 20)
            .opacity(show ? 1 : 0)
            
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
                        Image(uiImage: course.logo)
                            .opacity(show ? 0 : 1)
                        VStack {
                            Image(systemName: "xmark")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                        }
                        .frame(width: 36, height: 36)
                        .background(Color.black)
                        .clipShape(Circle())
                        .opacity(show ? 1 : 0)
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
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color(course.color).opacity(0.3), radius: 20, x: 0, y: 20)
            .gesture(
                show ?
                DragGesture().onChanged { value in
                    guard value.translation.height < 300 else { return }
                    guard value.translation.height > 0 else { return }
                    
                    self.activeView = value.translation
                }.onEnded { value in
                    if self.activeView.height > 50 {
                        self.show = false
                        self.active = false
                        self.activeIndex = -1
                    }
                    self.activeView = .zero
                }
                : nil
            )
            .onTapGesture {
                self.show.toggle()
                self.active.toggle()
                if self.show{
                    self.activeIndex = self.index
                }else{
                    self.activeIndex = -1
                }
            }
            
            if show {
//                CourseDetail(course: course, active: $show, activeIndex: $activeIndex, show: $active)
//                    .background(Color.white)
//                    .animation(nil)
            }
        }
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .scaleEffect(1 - self.activeView.height / 1000)
        .edgesIgnoringSafeArea(.all)
    }
}

struct Course: Identifiable {
    
    var id = UUID()
    var title: String
    var subtitle: String
    var image: UIImage
    var logo: UIImage
    var color: UIColor
    var show: Bool
    
}

var coursesData: [Course] = [
    Course(title: "Prototype Designs with SwiftUI", subtitle: "18 Sections", image: #imageLiteral(resourceName: "Card4"), logo: #imageLiteral(resourceName: "Logo3"), color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), show: false),
    Course(title: "SwifUI Advanced", subtitle: "20 Sections", image: #imageLiteral(resourceName: "Background1"), logo: #imageLiteral(resourceName: "Logo2"), color: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), show: false),
    Course(title: "UI Design for Developers", subtitle: "18 Sections", image: #imageLiteral(resourceName: "Card5"), logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), show: false),
]
