import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addLabel()
        addButton()
        
        fetchData()
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
        print("Button tapped!")
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
    
    // Additional methods
    
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
}
