//
//  MainMessage.swift
//  SwiftUIFirebase
//
//  Created by 許桓菘 on 2023/8/5.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase
import FirebaseFirestoreSwift

class MainMessagesViewModel: ObservableObject {
    
    @Published var errorMessage = ""
    @Published var chatUser: ChatUser?
    @Published var isUserCurrentlyLoggedOut = false
    
    init() {
        
        DispatchQueue.main.async {
            self.isUserCurrentlyLoggedOut = FirebaseManager.shared.auth.currentUser?.uid == nil
        }
        
        fetchCurrentUser()
        
        fetchRecentMessages()
    }
    
    @Published var recentMessages = [RecentMessage]()
    
    private var firestoreListener: ListenerRegistration?
    
    func fetchRecentMessages() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        
        firestoreListener?.remove()
        self.recentMessages.removeAll()
        
        firestoreListener = FirebaseManager.shared.firestore
            .collection(FirebaseConstants.recentMessages)
            .document(uid)
            .collection(FirebaseConstants.messages)
            .order(by: FirebaseConstants.timestamp)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    self.errorMessage = "Failed to listen for recent messages: \(error)"
                    print(error)
                    return
                }
                
                querySnapshot?.documentChanges.forEach({ change in
                    let docId = change.document.documentID
                    
                    if let index = self.recentMessages.firstIndex(where: { rm in
                        return rm.id == docId
                    }) {
                        self.recentMessages.remove(at: index)
                    }
                    
                    do {
                        if let rm = try? change.document.data(as: RecentMessage.self) {
                            self.recentMessages.insert(rm, at: 0)
                        }
                    } catch {
                        print(error)
                    }
                })
            }
    }
    
    func fetchCurrentUser() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "Could not find firebase uid"
            return
        }
        
        FirebaseManager.shared.firestore.collection("users").document(uid).getDocument { snapshot, error in
            if let error = error {
                self.errorMessage = "Failed to fetch current user: \(error)"
                print("Failed to fetch current user:", error)
                return
            }
            
            self.chatUser = try? snapshot?.data(as: ChatUser.self)
            FirebaseManager.shared.currentUser = self.chatUser
        }
    }
    
    func handleSignOut() {
        isUserCurrentlyLoggedOut.toggle()
        try? FirebaseManager.shared.auth.signOut()
    }
    
}

struct MainMessagesView: View {
    
    @State var shouldShowLogOutOptions = false
    
    @State var shouldNavigateToChatLogView = false
    
    @ObservedObject private var vm = MainMessagesViewModel()
    
    private var chatLogViewModel = ChatLogViewModel(chatUser: nil)
    
    var body: some View {
        NavigationView {
            ZStack{
                
                VStack {
                    
                    customNavBar
                    
                    messagesView
                    
                    NavigationLink("", isActive: $shouldNavigateToChatLogView) {
                        ChatLogView(vm: chatLogViewModel)//.navigationBarHidden(true)
                    }
                    
                }
                ZStack() {
                    ZStack() {
                        ZStack() {
                            ZStack() {
                                Image("icon")
                                    .frame(width: 19.87, height: 19.86)
                                    .offset(x: 0, y: 0)
                            }
                            .frame(width: 17.66, height: 19.81)
                            .offset(x: -0.06, y: -10.32)
                            Text("个人主页")
                                .font(Font.custom("Roboto", size: 10))
                                .foregroundColor(Color(red: 0.41, green: 0.38, blue: 0.45))
                                .offset(x: 0, y: 13.72)
                        }
                        .frame(width: 40, height: 40.45)
                        .offset(x: 164, y: -2.95)
                    }
                        
                    
                    ZStack() {
                        ZStack() {
                            Image("Group 7")
                                .frame(width: 19.87, height: 19.86)
                                .offset(x: 0, y: 0)
                        }
                        .frame(width: 19.87, height: 19.86)
                        .offset(x: -0.12, y: -9.74)
                        
                        Text("消息")
                            .font(Font.custom("Roboto", size: 10))
                            .foregroundColor(Color(red: 0.41, green: 0.38, blue: 0.45))
                            .offset(x: 0.05, y: 13.17)
                    }
                    .frame(width: 20.11, height: 39.34)
                    .offset(x: 82.05, y: -2.05)
                    

                    
                    
                    ZStack() {
                        ZStack() {
                            ZStack() { }
                            Image("Group 6")
                                .frame(width: 19.87, height: 19.86)
                                .offset(x: 0, y: 0)
                        }
                        .frame(width: 19.88, height: 19.87)
                        .offset(x: -0.23, y: -9.74)
                        
                        Text("训练计划")
                            .font(Font.custom("Roboto", size: 10))
                            .foregroundColor(Color(red: 0.41, green: 0.38, blue: 0.45))
                            .offset(x: 0, y: 13.17)
                    }
                    .frame(width: 41, height: 39.35)
                    .offset(x: -79.50, y: -2.05)
                    
                    
                    
                    
                    ZStack() {
                        Image("Path 1508")
                            .frame(width: 19.87, height: 19.86)
                            .offset(x: 0, y: -8)
                        
                        Text("首页")
                            .font(Font.custom("Roboto", size: 10))
                            .foregroundColor(Color(red: 0.41, green: 0.38, blue: 0.45))
                            .offset(x: 0, y: 13.72)
                    }
                    .frame(width: 21, height: 38.55)
                    .offset(x: -164.50, y: -2)
                    
                    ZStack() { }
                    Image("posst")
                        .frame(width: 66.24, height: 66.21)
                        .offset(x: 0.55, y: -15.45)
                }
                .frame(width: 414, height: 112.55)
                .offset(x: 0, y: 412.28)
            }
            
            /*.overlay(
                newMessageButton, alignment: .bottom)
            .navigationBarHidden(true)*/
        }.ignoresSafeArea(.all)
    }
    
    private var customNavBar: some View {
        @State var temp = ""
        return VStack{
            HStack(spacing: 16) {
                Text("消息")
                      .font(Font.custom("Roboto", size: 20))
                      .foregroundColor(Color(red: 0.33, green: 0.30, blue: 0.37));
                Spacer()
                Button(action: {
                    shouldShowNewMessageScreen.toggle()
                    // 執行按鈕點擊時的操作
                }) {
                    HStack{
                        Image(systemName: "person.badge.plus")
                            .padding(.trailing, -5)
                        Text("好友申請")
                    }.foregroundColor(Color(red: 0.33, green: 0.30, blue: 0.37))
                        .padding(.horizontal, 20)
                        .padding(.vertical, 5)
                        .background(Color("gray"))
                        .cornerRadius(50)
                    
                }.padding(.trailing, -7)
                    .fullScreenCover(isPresented: $shouldShowNewMessageScreen) {
                        CreateNewMessageView(didSelectNewUser: { user in
                            print(user.email)
                            self.shouldNavigateToChatLogView.toggle()
                            self.chatUser = user
                            self.chatLogViewModel.chatUser = user
                            self.chatLogViewModel.fetchMessages()
                        })
                    }
                /*WebImage(url: URL(string: vm.chatUser?.profileImageUrl ?? ""))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipped()
                    .cornerRadius(50)
                    .overlay(RoundedRectangle(cornerRadius: 44)
                                .stroke(Color(.label), lineWidth: 1)
                    )
                    .shadow(radius: 5)
                
                
                VStack(alignment: .leading, spacing: 4) {
                    let email = vm.chatUser?.email.replacingOccurrences(of: "@gmail.com", with: "") ?? ""
                    Text(email)
                        .font(.system(size: 24, weight: .bold))
                    
                    HStack {
                        Circle()
                            .foregroundColor(.green)
                            .frame(width: 14, height: 14)
                        Text("online")
                            .font(.system(size: 12))
                            .foregroundColor(Color(.lightGray))
                    }
                    
                }*/
                
                
                Button {
                    shouldShowLogOutOptions.toggle()
                } label: {
                    Image(systemName: "plus")
                        .frame(width: 30,height: 30)
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(Color(red: 0.33, green: 0.30, blue: 0.37))
                        .background(Color("gray"))
                        .cornerRadius(50)
                }
            }
            .padding()
            .actionSheet(isPresented: $shouldShowLogOutOptions) {
                .init(title: Text("Settings"), message: Text("What do you want to do?"), buttons: [
                    .destructive(Text("Sign Out"), action: {
                        print("handle sign out")
                        vm.handleSignOut()
                    }),
                        .cancel()
                ])
            }
            HStack(spacing: 16){
                Image(systemName: "magnifyingglass")
                TextField("搜索",text: $temp)
            }
            .padding(.horizontal, 20.0)
            .padding(.vertical,5)
            .foregroundColor(Color(red: 0.33, green: 0.30, blue: 0.37))
            .background(Color("gray"))
            .cornerRadius(50)
            
            .padding(.horizontal, 12.0)
        }
        .padding(.bottom,10)
        .fullScreenCover(isPresented: $vm.isUserCurrentlyLoggedOut, onDismiss: nil) {
            LoginView(didCompleteionLoginProcess: {
                self.vm.isUserCurrentlyLoggedOut = false
                self.vm.fetchCurrentUser()
                self.vm.fetchRecentMessages()
            })
        }
    }
    
    private var messagesView: some View {
        ScrollView {
            
            ForEach(vm.recentMessages) { recentMessage in
                VStack {
                    Button {
                        let uid = FirebaseManager.shared.auth.currentUser?.uid == recentMessage.fromId ? recentMessage.toId : recentMessage.fromId
                        
                        self.chatUser = .init(id: uid, uid: uid, email: recentMessage.email, profileImageUrl: recentMessage.profileImageUrl)
                        
                        self.chatLogViewModel.chatUser = self.chatUser
                        self.chatLogViewModel.fetchMessages()
                        self.shouldNavigateToChatLogView.toggle()
                    } label: {
                        HStack(spacing: 16) {
                            WebImage(url: URL(string: recentMessage.profileImageUrl))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 64, height: 64)
                                .clipped()
                                .cornerRadius(64)
                                
                            
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text(recentMessage.username)
                                    .font(.system(size: 16))
                                    .foregroundColor(Color(.label))
                                    .multilineTextAlignment(.leading)
                                Text(recentMessage.text)
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(.darkGray))
                                    .multilineTextAlignment(.leading)
                            }
                            Spacer()
                            VStack(){
                                Text(recentMessage.timeAgo)
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(Color(.darkGray))
                                Spacer()
                            }
                            
                        }
                    }


                    
                    //Divider()
                        .padding(.vertical, 8)
                }.padding(.horizontal)
                
            }.padding(.bottom, 50)
        }
    }
    
    @State var shouldShowNewMessageScreen = false
    
    private var newMessageButton: some View {
        Button {
            shouldShowNewMessageScreen.toggle()
        } label: {
            HStack {
                Spacer()
                Text("+ New Message")
                    .font(.system(size: 16, weight: .bold))
                Spacer()
            }
            .foregroundColor(.white)
            .padding(.vertical)
                .background(Color.blue)
                .cornerRadius(32)
                .padding(.horizontal)
                .shadow(radius: 15)
        }
        .fullScreenCover(isPresented: $shouldShowNewMessageScreen) {
            CreateNewMessageView(didSelectNewUser: { user in
                print(user.email)
                self.shouldNavigateToChatLogView.toggle()
                self.chatUser = user
                self.chatLogViewModel.chatUser = user
                self.chatLogViewModel.fetchMessages()
            })
        }
    }
    
    @State var chatUser: ChatUser?
}

struct MainMessagesView_Previews: PreviewProvider {
    static var previews: some View {

        MainMessagesView()
    }
}
