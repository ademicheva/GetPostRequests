//
//  ViewController.swift
//  GetPostRequests
//
//  Created by Алина on 04.07.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getRequest(_ sender: UIButton) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        let session = URLSession.shared
        // response - позволяет вернуть ответ сервера
        session.dataTask(with: url) { (data, response, error) in
            guard let response = response, let data = data else { return } // получим сами данные. Видим объем данных, но не сами данные. Их нужно преобразовывать в JSON. Данный процесс называется сериализацией. - процесс перевода данных из одного типа данных в другой без потери содержания.
         //   Для перевода данных воспользуемся экземпляром класса JSONSerialization и обернем его в ду кетч
            
            print(response)
            print(data)
            
            do {
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error)
            }

        }.resume()

        
        
    }
    
    @IBAction func postRequest(_ sender: UIButton) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        // в пост запроссе мы должны выполнить передачу данных
        let userData = ["Course" : "Networking", "Lesson" : "GET and POST Requests"]
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: userData, options: []) else { return }
        request.httpBody = httpBody
        // Это нужно добавить. Инфа из консоли. Так как у нас не педалось value (a key  передалось)
        //     "Content-Type" =     ("application/json; charset=utf-8"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            guard let response = response, let data = data else {
                return
            }
            print(response)
            
            do {
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error)
            }

        }.resume()
        // 201 - создано
        


        

    }
    
}










