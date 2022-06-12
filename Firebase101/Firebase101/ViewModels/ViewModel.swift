//
//  ViewModel.swift
//  Firebase101
//
//  Created by Adem Deliaslan on 30.05.2022.
//

import Foundation
//import Firebase
import FirebaseFirestore

class ViewModel: ObservableObject {
    @Published var list = [Task]()
    
    func addData(sinifAdi: String, yazilimAriza: String, donanimAriza: String, digerAriza: String, name: String, surname: String) {
        //Get a reference to the database
        let db = Firestore.firestore()
        
        //add a document to a collection
        db.collection("tasks").addDocument(data: ["name": name, "surname": surname, "sinifAdi":sinifAdi ,"yazilimAriza": yazilimAriza, "donanimAriza": donanimAriza, "digerAriza": digerAriza ]) { error in
          //  Check for errors
                        if error == nil {
                //no errors
                
                //call get data to retrieve latest data
                self.getData()
            } else {
                
            }
        }
    }
    
    func getData() {
        //Get a reference to the database
        let db = Firestore.firestore()
        //read the documents at a specific path
        db.collection("tasks").getDocuments { snapshot, error in
            //check for errors
            if error == nil {
               //no errors
                if let snapshot = snapshot {
                    //update the list property in the main thread
                    DispatchQueue.main.async {
                        // get all the documents and create tasks
                        self.list = snapshot.documents.map { doc in
                            //create a task item for each document returned
                            return Task(id: doc.documentID,
                                        sinifAdi: doc["sinifAdi"] as? String ?? "",
                                        yazilimAriza: doc["sinifAdi"] as? String ?? "",
                                        donanimAriza: doc["sinifAdi"] as? String ?? "",
                                        digerAriza: doc["sinifAdi"] as? String ?? "",
                                        name: doc["name"] as? String ?? "",
                                        surname: doc["surname"] as? String ?? ""
                        )}
                    }
                }
            } else {
                //print(error?.localizedDescription)
            }
        }
    }
    
    func deleteData(taskToDelete: Task) {
        //get a reference to the database
        let db = Firestore.firestore()
        
        //specify the document to delete
        db.collection("tasks").document(taskToDelete.id).delete { error in
            // check for errors
            if error == nil {
                //no errors
                
                // update the UI from the main thread
                DispatchQueue.main.async {
                    
                    //remove the task that was just deleted
                    self.list.removeAll { task in
                        //check for the task to remove
                        return task.id == taskToDelete.id
                        
                    }
                }
             
            }
        }
    }
    
    func updateData(taskToUpdate: Task) {
        //get a reference to the database
        let db = Firestore.firestore()
        //set the data to update
        db.collection("tasks").document(taskToUpdate.id).setData(["name": taskToUpdate.name ,
                                                                  "surname": taskToUpdate.surname,
                                                                  "sinifAdi": taskToUpdate.sinifAdi,
                                                                  "yazilimAriza": taskToUpdate.yazilimAriza ?? "",
                                                                  "donanimAriza": taskToUpdate.donanimAriza ?? "",
                                                                  "digerAriza": taskToUpdate.digerAriza ?? ""],
                                                                 merge: true) { error in
            //check for errors
            if error == nil {
                //get the new data
                DispatchQueue.main.async {
                    self.getData()
                }
            }
        }
    }
}


