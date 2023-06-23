import UIKit

class ViewController: UIViewController {
  
   override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make a GET request
        guard let url = URL(string: "https://api.example.com/data") else {
            return
        }
     
        // Add headers if needed
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
    
       // Add UILabel
        let label = UILabel(frame: CGRect(x: 50, y: 100, width: 200, height: 30))
        label.text = "Hello, World!"
        label.textAlignment = .center
        self.view.addSubview(label)
        
        // Add UIButton
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 100, y: 200, width: 100, height: 50)
        button.setTitle("Tap Me", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc func buttonTapped() {
        print("Button tapped!")
    }
    
    // Other methods...
}
