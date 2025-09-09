//
//  TnCView.swift
//  AnxiaTude
//
//  Created by Enjel Hutasoit on 11/09/25.
//

import SwiftUI

struct TnCView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Group {
                    Text("Purpose")
                        .font(.headline)
                    Text("This app provides inspirational quotes, affirmations, and scripture for general well-being and mindfulness. It is not a substitute for professional medical or psychological care.")
                }
                
                Group {
                    Text("No Medical Advice")
                        .font(.headline)
                    Text("The content is for informational and reflective purposes only. It does not replace therapy, diagnosis, or treatment by a licensed mental health professional.")
                }
                
                Group {
                    Text("Trigger Warning")
                        .font(.headline)
                    Text("While quotes are curated to encourage resilience and calm, some content may feel triggering depending on individual experiences. Users are encouraged to skip categories that feel uncomfortable.")
                }
                
                Group {
                    Text("User Responsibility")
                        .font(.headline)
                    Text("By using this app, you acknowledge responsibility for your own emotional responses. If you are experiencing severe anxiety or crisis, please contact a qualified healthcare provider or call your local emergency number.")
                }
                
                Group {
                    Text("Faith-Based Content")
                        .font(.headline)
                    Text("Bible verses and spiritual affirmations are provided for users who find comfort in faith. You may opt out of faith-based content if preferred.")
                }
                
                Group {
                    Text("Data & Privacy")
                        .font(.headline)
                    Text("This app does not collect or share personal data. All API data comes from open, public sources.")
                }
            }
            .padding()
        }
        .toolbarBackground(.white, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Terms & Conditions")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackArrowButton { dismiss() }
            }
        }
    }
}
