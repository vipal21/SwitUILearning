//
//  ContentView.swift
//  Wather
//
//  Created by Vipal on 13/09/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = true
    var body: some View {
        ZStack{
            GradientView(isNight: $isNight)
            VStack{
                
                //MARK : Titlte
                CityTextView(cityName: "Calgary ,AB")
          
                MainWeatherStatusView(imagename: isNight ? "moon.stars.fill" : "cloud.sun.fill", tempeture: 78)
                Spacer()
                HStack{
                    WeatherDayView(dayWeek: "TUE", imageName: "cloud.sun.fill", tempeture: 26)
                    WeatherDayView(dayWeek: "WED", imageName: "sun.max.fill", tempeture: 32)
                    WeatherDayView(dayWeek: "THU", imageName: "wind.snow", tempeture: 23)
                    WeatherDayView(dayWeek: "FRI", imageName: "snow", tempeture: 12)
                    WeatherDayView(dayWeek: "SAT", imageName: "cloud.sun.fill", tempeture: 32)
                    WeatherDayView(dayWeek: "SUN", imageName: "cloud.sun.fill", tempeture: 35)
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    ButtonView(title: "Change Day Time", backgroundColor: Color.white, foregroundColor: Color.blue, cornerRadius: 10)
                }

                

                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {

    var dayWeek :String
    var imageName: String
    var tempeture:Int
    
    var body: some View {
        VStack(spacing: 10){
            Text(dayWeek).font(.system(size: 16,weight: .regular,design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName).renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text(String(tempeture)+"°").font(.system(size: 20,weight: .medium,design: .default))
                .foregroundColor(.white)
        }
    }
}

struct GradientView: View {
    
   @Binding var isNight: Bool
    var body: some View {
        
        LinearGradient(colors: [isNight ? .black : .blue ,  isNight ? .gray : Color("lightBlue") ], startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName:String

    var body: some View {
        Text(cityName).font(.system(size: 32,weight: .medium,design: .default))
            .foregroundColor(.white).padding()
    }
}

struct MainWeatherStatusView: View {
    var imagename:String
    var tempeture:Int
    var body: some View {
        
        VStack (spacing: 10){
            Image(systemName: imagename).renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text(String(tempeture)+"°").font(.system(size: 70,weight: .medium,design: .default))
                .foregroundColor(.white)
            
        }
    }
}

struct ButtonView: View {
    var title:String
    var backgroundColor: Color
    var foregroundColor: Color
    var cornerRadius:Int
    
    var body: some View {

            Text(title).frame(width: 280,height: 50)
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .font(.system(size: 20,weight: .bold,design: .default))
                .cornerRadius(CGFloat(cornerRadius))
        }
    }

