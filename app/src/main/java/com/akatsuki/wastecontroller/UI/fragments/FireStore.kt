package com.akatsuki.wastecontroller.UI.fragments

import com.akatsuki.wastecontroller.UI.Users
import com.google.firebase.firestore.FirebaseFirestore


class FireStore {

    val fireStoreDatabase = FirebaseFirestore.getInstance()


    fun uploadUser(user: Users): String {

        val docId: String = FireStore().fireStoreDatabase.collection("users").document().id

        val hashMap = hashMapOf<String, Any>(
            "user_email" to user.user_email,
            "uid" to docId,
        )
        fireStoreDatabase.collection("users").document(docId).set(hashMap)
        return docId;
    }
}