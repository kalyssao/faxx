//
//  ContentView.swift
//  faxxSwiftUI
//
//  Created by LVZ on 7/7/20.
//  Copyright © 2020 LVZ. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var index = 0
    @ObservedObject var eventApi = EventManager()
    var body: some View {

        NavigationView {
            Landing().navigationBarTitle("")
            TabBar(index: $index)
        }.onAppear() {
            self.eventApi.getEvents()
        }
    }
}

struct TabBar: View {
    @Binding var index: Int
    var body: some View {
        
        HStack {
            Button(action: {
                self.index = 0
            }) {
                Image("menu")
                
            }.foregroundColor(Color("accentColor").opacity(self.index == 1 ? 1 : 0.2))
            
            Button(action: {
                self.index = 1
            }) {
                Image(systemName: "shuffle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(5)
                .frame(width: 40, height: 40, alignment: .center)
                
            }.foregroundColor(Color("accentColor").opacity(self.index == 1 ? 1 : 0.2))
            
            Button(action: {
                self.index = 2
            }) {
                Image("bookmark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(5)
                    .frame(width: 40, height: 40, alignment: .center)
                
            }.foregroundColor(Color("accentColor").opacity(self.index == 1 ? 1 : 0.2))
        }
        
    }
}

struct Landing: View {
    @State var show = false
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Image("logo2")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text("Random facts you didn't know you needed.").font(.headline)
            
            Spacer()
            
            NavigationLink(destination: Home(show: $show), isActive: $show) {
                
                Text("Start")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.black)
                    .background(Color("accentColor"))
            }
            
        }
        
    }
}

struct SingleVIew: View {
    var body: some View {
        VStack {
            Spacer()
            
        }
    }
}

struct DetailView: View {
    @State var date: String
    @State var year: String
    @State var eventText: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("accentColor"))
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            
            VStack(alignment: .leading, spacing: 10) {
                Text(self.date).font(.headline)
                Text(self.year).font(.largeTitle)
                Text(self.eventText).font(.title)
            
            }.padding()
        }
    }
}

struct Events: View {
    @ObservedObject var eventApi = EventManager()
    @Binding var eventShow: Bool
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    
                    self.eventShow.toggle()
                    
                }) {
                        Image("arrow").renderingMode(.original)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .aspectRatio(1, contentMode: .fit)
                    }
                
                Spacer()
                
                Button(action: {
                    
                    
                }) {
                
                    Image("menu").renderingMode(.original)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .aspectRatio(1, contentMode: .fit)
                
                }
                
            }.padding()
            
            Text("Today In Events").font(.title)
            
            GeometryReader { geo in
                //ScrollView(.horizontal) {
                    if self.eventApi.dataHasLoaded {
                        HStack(spacing: 10) {
                            //ForEach(0..<30) { i in
                                //Text("Date \(self.eventApi.events[i].year)")
                                //Text(verbatim: "\(self.eventApi.events[i].text)")
                            DetailView(date: self.eventApi.date, year: self.eventApi.events[1].year, eventText: self.eventApi.events[1].text).padding()
                            //}
                        }
                            .frame(maxWidth: geo.size.width, maxHeight: geo.size.height*0.9)
                        
                    } else {
                        Text("Loading data")
                    }
            //    }
            }
            
            Spacer()
            
            Button(action: {
                // reveal menu
                print("event pressed")
                
            }) {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        // move to next item in cache
                        
                    }) {
                        Spacer()
                        HStack {
                            Text("Next Fact")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            
                            Image("forward").renderingMode(.original)
                            .resizable()
                            .frame(width: 20, height: 20)
                            .aspectRatio(1, contentMode: .fit)
                        
                        }.padding().background(Color("accentColor"))
                        
                    }
                    
                    
                }.padding()
            }
            
            Spacer()
        
        }.navigationBarTitle("")
        .navigationBarBackButtonHidden(false)
    }
}

struct Births: View {
    @Binding var birthShow: Bool
    //@State var births: Array<String>
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    
                    self.birthShow.toggle()
                    
                }) {
                    Image("arrow").renderingMode(.original)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .aspectRatio(1, contentMode: .fit)
                }
                Spacer()
                
                Button(action: {
                    
                    
                }) {
                
                    Image("menu").renderingMode(.original)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .aspectRatio(1, contentMode: .fit)
                
                }
                
            }.padding()
            
            Text("Today In Births").font(.title)
            
            //births = EventManager().getEvents()
            
            Button(action: {
                // reveal menu
                print("event pressed")
                
            }) {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        // move to next item in cache
                        
                    }) {
                        Spacer()
                        HStack {
                            Text("Next Fact")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            
                            Image("forward").renderingMode(.original)
                            .resizable()
                            .frame(width: 20, height: 20)
                            .aspectRatio(1, contentMode: .fit)
                        
                        }.padding().background(Color("accentColor"))
                        
                    }
                    
                    
                }.padding()
            }
        }.navigationBarTitle("")
        .navigationBarBackButtonHidden(false)
    
    }
}

struct Deaths: View {
    @Binding var deathShow: Bool
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    
                    self.deathShow.toggle()
                    
                }) {
                    Image("arrow").renderingMode(.original)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .aspectRatio(1, contentMode: .fit)
                }
                
                Spacer()
                
                Button(action: {
                    
                    
                }) {
                
                    Image("menu").renderingMode(.original)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .aspectRatio(1, contentMode: .fit)
                
                }
                
            }.padding()
            
            Text("Today In Deaths").font(.title)
            
            Spacer()
            
            Button(action: {
                // reveal menu
                print("event pressed")
                
            }) {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        // move to next item in cache
                        
                    }) {
                        Spacer()
                        HStack {
                            Text("Next Fact")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            
                            Image("forward").renderingMode(.original)
                            .resizable()
                            .frame(width: 20, height: 20)
                            .aspectRatio(1, contentMode: .fit)
                        
                        }.padding().background(Color("accentColor"))
                        
                    }
                    
                    
                }.padding()
            }
        }.navigationBarTitle("")
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(false)
    }
}

/*struct Menu: View {
    var body: some View {
        VStack(spacing: 25) {
            
        }
    }
}*/

struct Home: View {
    
    @Binding var show: Bool
    @State var eventShow = false
    @State var birthShow = false
    @State var deathShow = false
    
    var body: some View {
        
        VStack(spacing: 25) {
            
            ScrollView(){
                Spacer()
                NavigationLink(destination: Events(eventShow: $eventShow), isActive: $eventShow) {
                    
                    Text("Events")
                        .padding()
                        .frame(width: 340, height: 200, alignment: .leading)
                        .background(Color("cardColor"))
                        .cornerRadius(10)
                    
                }
                
                Spacer()
                Spacer()
                Spacer()
                
                NavigationLink(destination: Births(birthShow: $birthShow), isActive: $birthShow) {
                    
                    Text("Births")
                        .padding()
                        .frame(width: 340, height: 200, alignment: .leading)
                        .background(Color("cardColor"))
                        .cornerRadius(10)
                    
                }
                
                Spacer()
                Spacer()
                Spacer()
                    
                NavigationLink(destination: Deaths(deathShow: $deathShow), isActive: $deathShow) {
                    
                    Text("Deaths")
                        .padding()
                        .frame(width: 340, height: 200, alignment: .leading)
                        .background(Color("cardColor"))
                        .cornerRadius(10)
                    
                }
                
            }
                
        }.navigationBarTitle("Choose a category")
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

