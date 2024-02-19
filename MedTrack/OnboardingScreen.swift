import SwiftUI

struct DynamicSearchDropdownView: View {
    let allChoices = ["Apple", "Banana", "Cherry", "Date", "Fig", "Grape", "Honeydew"]
    @State private var searchTerm: String = ""
    @State private var filteredChoices: [String]
    @State private var isDropdownVisible: Bool = true

    init() {
        _filteredChoices = State(initialValue: allChoices)
    }

    var body: some View {
        VStack {
            Text("What medicine are you currently taking?")
                .font(.largeTitle)
                .padding()

            Spacer()

            TextField("Search prescribed drug...", text: $searchTerm)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .onChange(of: searchTerm) { newValue in
                    filterChoices()
                    isDropdownVisible = true
                }

            ScrollView {
                VStack {
                    if isDropdownVisible {
                        ForEach(filteredChoices.indices, id: \.self) { index in
                            Text(filteredChoices[index])
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .onTapGesture {
                                    self.searchTerm = filteredChoices[index]
    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
                                        self.isDropdownVisible = false
                                    }
                                }

                            if index < filteredChoices.count - 1 {
                                Divider()
                            }
                        }
                    }
                }
            }
            .frame(maxHeight: 400)

            Spacer()

            Button(action: {
                // Action for the Next button
            }) {
                Text("Next")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
        .padding()
    }

    func filterChoices() {
        if searchTerm.isEmpty {
            filteredChoices = allChoices
        } else {
            filteredChoices = allChoices.filter { $0.lowercased().contains(searchTerm.lowercased()) }
        }
    }
}

struct DynamicSearchDropdownView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicSearchDropdownView()
    }
}
