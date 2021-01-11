//
//  SearchView.swift
//  InstagramSwiftUITutorial
//
//  Created by Stephen Dowless on 12/26/20.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @State var inSearchMode = false
    @ObservedObject var viewModel = SearchViewModel(config: .search)
    
    var body: some View {
        
        ScrollView {
            SearchBar(text: $searchText, isEditing: $inSearchMode)
                .padding()
            
            ZStack {
                if inSearchMode {
                    UserListView(viewModel: viewModel, searchText: $searchText)
                } else {
                    PostGridView(config: .explore)
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
