//
//  HomeView.swift
//  my-swift-ui
//
//  Created by Amza Andrei on 2/29/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var showProfile: Bool
    @Binding var showContent: Bool
    @State var showUpdate = false
    
    var body: some View {
        ScrollView {
            VStack {
                HStack{
                    Text("Watching")
                        .font(.system(size: 28, weight: .bold))
    //                    .modifier(CustomtFontModifier())
                    ///nu functioneaza custom font-ul. Trebuie sa vad de ce :/
                    
                    Spacer()
                    AvatarView(showProfile: $showProfile)
                    
                    Button(action: { self.showUpdate.toggle() }) {
                        Image(systemName: "bell")
                            .renderingMode(.original)
                            .font(.system(size: 16, weight: .medium))
                            .frame(width: 36, height: 36)
                            .background(Color.white)
                            .cornerRadius(18)
                            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                            
                    }.sheet(isPresented: $showUpdate) {
                        UpdateList()
                    }
                }.padding(.horizontal)
                    .padding(.leading, 14)
                    .padding(.top, 30)
                
                ScrollView(.horizontal, showsIndicators: false){
                    WatchRingsView()
                    .padding(.horizontal, 30)
                    .padding(.bottom, 30)
                        .onTapGesture {
                            self.showContent = true
                    }
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20){
                        ForEach(sectionData) { item in
                            GeometryReader { geometry in
                                SectionView(section: item)
                                .rotation3DEffect(Angle(degrees:
                                    Double(geometry.frame(in: .global).minX - 30) / -20
                                ), axis: (x: 0, y: 10.0, z: 0))
                            }.frame(width: 275, height: 275)
                        }
                    }.padding(30)
                    .padding(.bottom, 30)
                }.offset(y: -30)
                
                HStack{
                    Text("Courses")
                    .font(.title).bold()
                    Spacer()
                }.padding(.leading, 30)
                .offset(y: -60)
                
                SectionView(section: sectionData[2], width: screen.width - 60, height: 275)
                .offset(y: -60)
                
//                CourseList(store: coursesData, active: false, activeIndex: -1)
                
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false), showContent: .constant(false))
    }
}

struct SectionView: View {
    
    var section: Section
    var width: CGFloat = 275
    var height: CGFloat = 275
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160,alignment: .leading)
                    .foregroundColor(Color.white)
                Image(section.logo)
            }
            
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.horizontal)
            
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }.padding(.top, 20)
            .padding(.horizontal, 20)
            .frame(width: width, height: height)
            .background(section.color)
            .cornerRadius(30)
            .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}


struct Section: Identifiable {
    
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image
    var color: Color
    
}


let sectionData = [
    Section(title: "Prototype designs in SwiftUI", text: "18 Sections", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card4")), color: Color(#colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1))),
    Section(title: "Prototype designs in Reactive Native", text: "10 Sections", logo: "Logo2", image: Image(uiImage: #imageLiteral(resourceName: "Card1")), color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))),
    Section(title: "Prototype designs in React", text: "7 Sections", logo: "Logo3", image: Image(uiImage: #imageLiteral(resourceName: "Card5")), color: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))),
    Section(title: "Prototype designs in Kotlin", text: "5 Sections", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card6")), color: Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1))),
]



struct WatchRingsView: View {
    var body: some View {
        HStack(spacing: 30) {
            HStack(spacing: 12) {
                RingView(color1: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), color2: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), width: 44, height: 44, prozent: 68, show: .constant(true))
                VStack(alignment: .leading , spacing: 4) {
                    Text("6 minutes left").bold().modifier(FontModifier(style: .subheadline))
                    Text("Watched 10 minutes today").modifier(FontModifier(style: .caption))
                }.modifier(FontModifier())
            }.padding(8)
                .background(Color.white)
                .cornerRadius(20)
                .modifier(ShadowModifier())
            
            HStack(spacing: 12) {
                RingView(color1: #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), color2: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), width: 32, height: 32, prozent: 32, show: .constant(true))
                
            }.padding(8)
                .background(Color.white)
                .cornerRadius(20)
                .modifier(ShadowModifier())
            
            HStack(spacing: 12) {
                RingView(color1: #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1), color2: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), width: 32, height: 32, prozent: 56, show: .constant(true))
                
            }.padding(8)
                .background(Color.white)
                .cornerRadius(20)
                .modifier(ShadowModifier())
        }
    }
}
