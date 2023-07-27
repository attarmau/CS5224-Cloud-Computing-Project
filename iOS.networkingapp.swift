import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer: AVAudioPlayer? // Added missing property
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLabel()
        addButton()
        fetchData()

        calculateSum(num1: 5, num2: 10)

        sendMessage(recipient: "example@example.com", message: "Hello, this is a test message!")

        changeBackgroundColor(color: .yellow) // Example usage of the new function

        addImageView() // Adding the new function to display an image
    }

    func calculateSum(num1: Int, num2: Int) {
        let sum = num1 + num2
        showAlert(title: "Sum Result", message: "The sum of \(num1) and \(num2) is \(sum).")
    }

    func addLabel() {
        let label = UILabel(frame: CGRect(x: 50, y: 100, width: 200, height: 30))
        label.text = "Hello, World!"
        label.textAlignment = .center
        view.addSubview(label)
    }

    func addButton() {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 100, y: 200, width: 100, height: 50)
        button.setTitle("Tap Me", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc func buttonTapped() {
        showAlert(title: "Button Tapped", message: "You tapped the button!")
    }

    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

    func fetchData() {
        guard let url = URL(string: "https://api.example.com/data") else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
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

    func sendMessage(recipient: String, message: String) {
        // Send the message using a messaging service or API
        MessagingService.send(message: message, recipient: recipient) { result in
            switch result {
            case .success:
                showAlert(title: "Message Sent", message: "Your message to \(recipient) was successfully sent.")
            case .failure(let error):
                showAlert(title: "Error", message: "Failed to send message. Error: \(error.localizedDescription)")
            }
        }
    }

    func changeBackgroundColor(color: UIColor) {
        view.backgroundColor = color
    }

    func addImageView() {
        let imageView = UIImageView(frame: CGRect(x: 50, y: 250, width: 200, height: 200))
        imageView.image = UIImage(named: "exampleImage") // Replace "exampleImage" with the name of your image asset
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)

    func showCustomAlert(title: String, message: String, actions: [UIAlertAction]) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            alertController.addAction(action)
        }

        present(alertController, animated: true, completion: nil)
    }
    
    func playSound() {
        guard let soundURL = Bundle.main.url(forResource: "sound", withExtension: "mp3") else {
            print("Sound file not found.")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
            
        } catch {
            print("Error playing sound: \(error)")

        func addImageView() {
        let imageView = UIImageView(frame: CGRect(x: 50, y: 250, width: 200, height: 200))
        imageView.image = UIImage(named: "exampleImage") // Replace "exampleImage" with the name of your image asset
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
    }

   func sendRequestToServer() {
    guard let url = URL(string: "https://api.example.com/send_request") else {
        print("Invalid URL")
        return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    let requestBody = ["key1": "value1", "key2": "value2"] // Replace with your request body

    do {
        let jsonData = try JSONSerialization.data(withJSONObject: requestBody, options: [])
        request.httpBody = jsonData
    } catch {
        print("Error creating JSON data: \(error)")
        return
    }

    let session = URLSession.shared
    let task = session.dataTask(with: request) { (data, response, error) in
        if let error = error {
            print("Error: \(error.localizedDescription)")
            return
        }

        if let data = data {
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                print("Response: \(jsonResponse)")

                // Handle the server response as needed

            } catch {
                print("Error parsing response data: \(error)")
            }
        }
    }

    task.resume()
}

    func playSound() {
        guard let soundURL = Bundle.main.url(forResource: "sound", withExtension: "mp3") else {
        print("Sound file not found.")
        return
    }

    do {
        audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
        audioPlayer?.prepareToPlay()
        audioPlayer?.play()
    } catch {
        print("Error playing sound: \(error)")
    }
    
        // Function to capture an image using the device's camera
    func captureImageFromCamera() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }

    // Function to handle the captured image and display it in an image view
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            let imageView = UIImageView(frame: CGRect(x: 50, y: 250, width: 200, height: 200))
            imageView.image = image
            imageView.contentMode = .scaleAspectFit
            view.addSubview(imageView)
        }
        picker.dismiss(animated: true, completion: nil)
    }

    // Function to handle image picker cancellation
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
