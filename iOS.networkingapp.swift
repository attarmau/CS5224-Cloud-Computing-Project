import UIKit

class ViewController: UIViewController {
  
   override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make a GET request
        guard let url = URL(string: "https://api.example.com/data") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
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
    
    // Other methods and UI components...
}
