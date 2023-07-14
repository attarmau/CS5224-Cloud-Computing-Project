import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLabel()
        addButton()
        fetchData()

        // Call the calculateSum function
        calculateSum(num1: 5, num2: 10)

        // Call the sendMessage function
        sendMessage(recipient: "example@example.com", message: "Hello, this is a test message!")
    }
    
    func calculateSum(num1: Int, num2: Int) {
        let sum = num1 + num2
        showAlert(title: "Sum Result", message: "The sum of \(num1) and \(num2) is \(sum).")
    }
    
    func addLabel() {
        let label = UILabel(frame: CGRect(x: 50, y: 100, width: 200, height: 30))
        label.text = "Hello, World!"
        label.textAlignment = .center
        self.view.addSubview(label)
    }
    
    func addButton() {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 100, y: 200, width: 100, height: 50)
        button.setTitle("Tap Me", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc func buttonTapped() {
        showAlert (title: "Button Tapped", message: "You tapped the button!")
    }

    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func fetchData() {
        guard let url = URL(string: "https://api.example.com/data") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer YOUR_AUTH_TOKEN", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let data = data {
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                    print("Response: \(jsonResponse)")
                    
                    // You can parse and handle the response data as needed
                } catch {
                    print("Error parsing response data: \(error)")
                }
            }
        }.resume()
    }
    
    func performGETRequest() {
        guard let url = URL(string: "https://api.example.com/get") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer YOUR_AUTH_TOKEN", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let data = data {
                // Process the response data
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                    print("Response: \(jsonResponse)")
                    
                    // You can parse and handle the response data as needed
                    
                } catch {
                    print("Error parsing response data: \(error)")
                }
            }
        }.resume()
    }
    
    func performPOSTRequest() {
        guard let url = URL(string: "https://api.example.com/post") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer YOUR_AUTH_TOKEN", forHTTPHeaderField: "Authorization")
        
        // Add the request body if needed
        let requestBody = ["key": "value"]
        if let jsonData = try? JSONSerialization.data(withJSONObject: requestBody) {
            request.httpBody = jsonData
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let data = data {
                // Process the response data
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                    print("Response: \(jsonResponse)")
                    
                    // You can parse and handle the response data as needed
                } catch {
                    print("Error parsing response data: \(error)")
                }
            }
        }.resume()
    }
    
    func performPUTRequest() {
        guard let url = URL(string: "https://api.example.com/put") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer YOUR_AUTH_TOKEN", forHTTPHeaderField: "Authorization")
        
        // Add the request body if needed
        let requestBody = ["key": "value"]
        if let jsonData = try? JSONSerialization.data(withJSONObject: requestBody) {
            request.httpBody = jsonData
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let data = data {
                // Process the response data
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                    print("Response: \(jsonResponse)")
                    
                    // You can parse and handle the response data as needed
                    
                } catch {
                    print("Error parsing response data: \(error)")
                }
            }
        }.resume()
    }
    
    func performDELETERequest() {
        guard let url = URL(string: "https://api.example.com/delete") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer YOUR_AUTH_TOKEN", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let data = data {
                // Process the response data
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                    print("Response: \(jsonResponse)")
                    
                    // You can parse and handle the response data as needed
                    
                } catch {
                    print("Error parsing response data: \(error)")
                }
            }
        }.resume()
    }
    
    func performPATCHRequest() {
        guard let url = URL(string: "https://api.example.com/patch") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer YOUR_AUTH_TOKEN", forHTTPHeaderField: "Authorization")
        
        // Add the request body if needed
        let requestBody = ["key": "value"]
        if let jsonData = try? JSONSerialization.data(withJSONObject: requestBody) {
            request.httpBody = jsonData
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let data = data {
                // Process the response data
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                    print("Response: \(jsonResponse)")
                    
                    // You can parse and handle the response data as needed
                    
                } catch {
                    print("Error parsingresponse data: \(error)")
                }
            }
        }.resume()
    }
    
    func uploadImage(image: UIImage) {
        guard let url = URL(string: "https://api.example.com/upload") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer YOUR_AUTH_TOKEN", forHTTPHeaderField: "Authorization")
        
        // Convert image to data
        guard let imageData = image.jpegData(compressionQuality: 1.0) else {
            return
        }
        
        let boundary = "Boundary-\(UUID().uuidString)"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        var body = Data()
        
        // Add image data to the request body
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"image\"; filename=\"image.jpg\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
        body.append(imageData)
        body.append("\r\n".data(using: .utf8)!)
        
        // Add more fields to the request body if needed
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        
        request.httpBody = body
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let data = data {
                // Process the response data
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                    print("Response: \(jsonResponse)")
                    
                    // You can parse and handle the response data as needed
                    
                } catch {
                    print("Error parsing response data: \(error)")
                }
            }
        }.resume()
    }

    func sendEmail(recipient: String, subject: String, message: String) {
    // Prepare the email
    let email = Email(recipient: recipient, subject: subject, message: message)
    
    // Send the email using an email service or API
    EmailService.send(email: email) { result in
        switch result {
        case .success:
            showAlert(title: "Email Sent", message: "Your email to \(recipient) was successfully sent.")
        case .failure(let error):
            showAlert(title: "Error", message: "Failed to send email. Error: \(error.localizedDescription)")
        }
    }

    func makeAPICall() {
    guard let url = URL(string: "https://api.example.com/endpoint") else {
        return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("Bearer YOUR_AUTH_TOKEN", forHTTPHeaderField: "Authorization")
    
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let error = error {
            print("Error: \(error.localizedDescription)")
            return
        }
        
        if let data = data {
            // Process the response data
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                print("Response: \(jsonResponse)")
                
                // You can parse and handle the response data as needed
                
            } catch {
                print("Error parsing response data: \(error)")
            }
        }
    }.resume()

    func sendMessage(recipient: String, message: String) {
    // Prepare the message
    let messageObject = Message(recipient: recipient, content: message)
    // Send the message using a messaging service or API
    MessagingService.send(message: messageObject) { result in
        switch result {
        case .success:
            showAlert(title: "Message Sent", message: "Your message to \(recipient) was successfully sent.")
        case .failure(let error):
            showAlert(title: "Error", message: "Failed to send message. Error: \(error.localizedDescription)")
        }
    }
}
