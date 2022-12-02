//
//  AllCharactersView.swift
//  RickAndMortyApp
//
//  Created by Jesus Mora on 2/12/22.
//

import SwiftUI

struct AllCharactersView: View {
    @StateObject private var viewModel:RickAndMortyViewModel=RickAndMortyViewModel()
    
    let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 0, alignment: .center), count: 2)
    
    var body: some View {
        NavigationView {
            VStack{
                switch viewModel.charactersState{
                    
                case .initial:
                    ProgressView()
                case .loading:
                    ProgressView()
                case .error(let error):
                    Text(error)
                case .loaded(let data):
                    ScrollView(.vertical){
                        LazyVGrid(columns: columns, spacing: 0){
                            ForEach(data.results){ results in
                                
                                VStack {
                                    AsyncImage(url: URL(string: results.image)){ image in
                                        image.resizable()
                                         
                                        
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 180, height: 150)
                                    .border(Color.init(Color.RGBColorSpace.sRGB, red: 0.1451, green: 0.2, blue: 0.3176), width: 1)
                                                           
                                    VStack {
                                        
                                        Text(results.name)
                                            .font(.headline)
                                            .fontWeight(.bold)
                                        HStack{
                                            Text(results.gender)
                                            Text("-")
                                            Text(results.species)
                     
                                        }
                                        .padding(.top, 10)
                                        .font(.system(size: 16))
                                        .fontWeight(.regular)
                                        HStack {
                                            
                                            if(results.status == "Alive"){
                                                Circle()
                                                    .fill(.green)
                                                    .frame(width: 10, height: 10)
                                            }
                                            else if(results.status == "Dead"){
                                                Circle()
                                                    .fill(.red)
                                                    .frame(width: 10, height: 10)
                                            }
                                            Text(results.status)
                                                .font(.headline)
                                                .fontWeight(.bold)
                                                .padding(.top, 5)
                                        }
                                        
                                    }
                                    .frame(width: 180, height: 150)
                                    .background(Color(red: 0.1451, green: 0.2, blue: 0.3176))
                                    .padding(.top, -8)
                                    .foregroundColor(.white)
                                    

                                }
                                .padding()

                              
                            }
                        }
                    }
                }
            }
            .navigationTitle("Rick and Morty")
            .font(.system(size: 30))
            
        }
    }
}

struct AllCharactersView_Previews: PreviewProvider {
    static var previews: some View {
        AllCharactersView()
    }
}
