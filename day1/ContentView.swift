//
//  ContentView.swift
//  day1
//
//  Created by ash mutairi on 5/1/20.
//  Copyright © 2020 Warriors. All rights reserved.
//

import SwiftUI


var athkar = [ "الحمد لله", "لا إله إلا الله" , "أستغفر الله" ]


struct ContentView: View {
    var athkar = [ "الحمد لله", "لا إله إلا الله" , "أستغفر الله" ]
    @State var thekr = "الحمد لله"
    var body: some View {

       ZStack {

          BG()

        Text(thekr)
            .font(.largeTitle)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding()
            .onTapGesture {
                //this code will work only when the user taps the text

                self.thekr = self.athkar.randomElement()!
                }

       }//end ZStack
        .edgesIgnoringSafeArea(.all)

    }


}

struct CW2: View {
    @State var pageNumber = "4"
    var body: some View{
        ZStack {
            BG()
            VStack{
                Text("Page \(pageNumber)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                TextField("رقم الصفحة", text: $pageNumber)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .multilineTextAlignment(.trailing)
                    .frame(height: 90)
            }//end VStack

        }//end ZStack
        .edgesIgnoringSafeArea(.all)

    }

}

struct CW3: View {
    
    @State var thekr = athkar.randomElement()!
    @State var counter = "0"
    var body: some View {
        
        ZStack{
            BG()
            
            VStack{
                
                Text(thekr) .modifier(ThekrModifier())
                    //.onTapGesture { self.counter = String(Int(self.counter)! + 1) }
                
                    //.onLongPressGesture { self.counter = String(Int(self.counter)! + 1) }
                    
                Text(counter) .modifier(CounterModifier())
                
                
            }//end VStack
             
        }//end ZStack
            
            //tap any on the screen and the counter will incress
        .onTapGesture {
            self.counter = String(Int(self.counter)! + 1)
            }
        
        
    }
}


// MODIFIERS
struct ThekrModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
        .font(.custom("Al Tarikh", size: 50))
        .padding()
    }

}

struct CounterModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Al Tarikh", size: 50))
            .foregroundColor(Color(#colorLiteral(red: 0.7904686332, green: 0.9945966601, blue: 0.8697455525, alpha: 1)))
            .padding(.horizontal, 80)
            .padding(.vertical, 20)
            .multilineTextAlignment(.center)
            .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)))
            .clipShape(Capsule())
            .shadow(radius: 15)
  
    }

}


// previewer
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
    //here we put the view that we want to view it on the preview
    // only on view should be viewed
        //ContentView()
        //CW2()
        CW3()
    }
}


// the back ground
struct BG: View {
    var body: some View{
        
        
        ZStack {
           Image("BACKGROUND")
                  .resizable()


        VStack{
            
            Image("Header")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
            
            Image("Mosque")
               .resizable()
               .scaledToFit()
               .aspectRatio(contentMode: .fit)

        }//end VStack
        }//end ZStack
        
            .edgesIgnoringSafeArea(.all)
    }
}
