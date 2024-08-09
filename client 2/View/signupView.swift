import SwiftUI

struct SignUpView: View {
    @State private var displayName: String = ""
    @State private var username: String = ""
    @State private var emailAddress: String = ""
    @State private var confirmEmailAddress: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 7)
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 7)
                            .foregroundColor(.clear)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.white)
                            )
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 7)
                            .foregroundColor(.clear)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.white)
                            )
                    }
                    
                    // Title
                    Text("Create Your Account")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical)
                    
                    // Input Fields
                    Group {
                        CustomTextField(placeholder: "Display Name", text: $displayName)
                        CustomTextField(placeholder: "Username", text: $username)
                        CustomTextField(placeholder: "Email address", text: $emailAddress)
                        CustomTextField(placeholder: "Confirm email address", text: $confirmEmailAddress)
                        CustomSecureField(placeholder: "Password", text: $password)
                        Text("At least 6 characters, including 1 number and 1 special character.")
                            .font(.system(size: 10))
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding([.leading, .trailing])
                            .padding(.bottom, 5)
                        CustomSecureField(placeholder: "Confirm password", text: $confirmPassword)
                        
                        Text("By selecting Sign Up, you confirm that you agree to the Terms of Conditions and you have read our Privacy Policy.")
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 10))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .padding(.bottom, -25)
                            .lineLimit(2, reservesSpace: true)
                    }
                    
                    // Sign Up Button
                    NavigationLink(destination: SelectYourSub()) {
                        Text("Sign Up")
                            .frame(height: 15)
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    .padding(.top, 20)
                    
                    // Sign in options
                    HStack {
                        // Left line
                        VStack{
                            Divider()
                                .background(Color.white)
                        }
                        // OR text
                        Text("OR")
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                        
                        // Right line
                        VStack{
                            Divider()
                                .background(Color.white)
                        }
                    }
                    .padding(.horizontal)
                    .padding([.top, .bottom], 5)
                    
                    Text("Sign in with")
                        .foregroundColor(.white)
                    
                    HStack(spacing: 30) {
                        SignInWithButton(imageName: "signup-img/google")
                        SignInWithButton(imageName: "signup-img/apple")
                        SignInWithButton(imageName: "signup-img/facebook")
                    }
                    .padding()
                    
                    Spacer()
                    
                    // Log in option
                    HStack {
                        Text("Have an account?")
                            .foregroundColor(.white)
                        Button(action: {
                            // Action for login button
                        }) {
                            Text("Log in")
                                .foregroundColor(.blue)
                        }
                    }
                    .padding(.bottom, 20)
                }
                .padding()
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom))
        }
    }
}

struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .frame(height: 15)
            .padding()
            .background(Color.black.opacity(0.7))
            .cornerRadius(10)
            .foregroundColor(.white)
            .autocapitalization(.none)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.white.opacity(0.5), lineWidth: 1)
            )
            .padding(.horizontal, 5)
            .padding(.bottom,3)
    }
}

struct CustomSecureField: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        SecureField(placeholder, text: $text)
            .frame(height: 15)
            .padding()
            .background(Color.black.opacity(0.7))
            .cornerRadius(10)
            .foregroundColor(.white)
            .autocapitalization(.none)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.white.opacity(0.5), lineWidth: 1)
            )
            .padding(.horizontal, 5)
    }
}

struct SignInWithButton: View {
    var imageName: String
    
    var body: some View {
        Button(action: {
            // Action for sign-in with social button
        }) {
            Image("\(imageName)")
                .resizable()
                .padding(12)
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .background(Color.white)
                .cornerRadius(25)
        }
    }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
