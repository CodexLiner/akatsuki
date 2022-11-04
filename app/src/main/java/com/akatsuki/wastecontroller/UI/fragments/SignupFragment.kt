package com.akatsuki.wastecontroller.UI.fragments

import android.app.Activity
import android.os.Bundle
import android.util.Log
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.navigation.fragment.findNavController
import com.akatsuki.wastecontroller.R
import com.akatsuki.wastecontroller.UI.Users
import com.akatsuki.wastecontroller.databinding.FragmentSignupBinding
import com.akatsuki.wastecontroller.network.AsyncResponse
import com.akatsuki.wastecontroller.network.BackendCall
import com.google.firebase.auth.FirebaseAuth
import org.json.JSONObject


/**
 * A simple [Fragment] subclass.
 * Use the [SignupFragment.newInstance] factory method to
 * create an instance of this fragment.
 */
class SignupFragment : Fragment(), AsyncResponse {

    lateinit var etEmail: EditText
    lateinit var username: EditText
    lateinit var etConfPass: EditText
    private lateinit var etPass: EditText
    private lateinit var btnSignUp: Button
    var fireStore = FireStore()
    private var _binding: FragmentSignupBinding? = null
    private val binding get() = _binding!!

    // create Firebase authentication object
    private lateinit var auth: FirebaseAuth

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        auth = FirebaseAuth.getInstance()
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        _binding = FragmentSignupBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        btnSignUp = binding.signInButton2
        etEmail = binding.email
        etConfPass = binding.confirmPassword
        etPass = binding.password
        username = binding.username
        btnSignUp.setOnClickListener {
            signUpUser()
        }
    }

    fun signUpUser() {
        val email = etEmail.text.toString()
        val pass = etPass.text.toString()
        val confirmPassword = etConfPass.text.toString()

        // check pass
        if (email.isBlank() || pass.isBlank() || confirmPassword.isBlank()) {
            Toast.makeText(requireContext(), "Password and Confirm Password do not match", Toast.LENGTH_SHORT)
                .show()
            return
        }
        auth.createUserWithEmailAndPassword(email, pass).addOnCompleteListener {it->
            if (it.isSuccessful) {
                Toast.makeText(requireContext(), "Successfully Singed Up", Toast.LENGTH_SHORT).show()
                var uid = fireStore.uploadUser(
                    Users(
                        etEmail.text.toString(),
                        etPass.text.toString()
                    )
                )

                val userInfo = hashMapOf<Any, Any>(
                    "email" to etEmail.text.toString(),
                    "password" to etPass.text.toString(),
                    "username" to username,
                    "uid" to uid,
                )
                var backendCall = BackendCall("http:localhost:5000/user/register", userInfo, "",requireActivity())
                backendCall.asyncResponse = this
                backendCall.execute()
                findNavController().navigate(R.id.action_signupFragment_to_loginFragment)
            } else {
                Toast.makeText(requireContext(), "Singed Up Failed!", Toast.LENGTH_SHORT).show()
            }
        }
    }

    override fun Result(jsonObject: JSONObject?) {
        Log.d("Signup", jsonObject.toString())
    }


//    fun getMethod() {
//        val request = Request.Builder()
//            .url("https://publicobject.com/helloworld.txt")
//            .build()
//
//        client.newCall(request).execute().use { response ->
//            if (!response.isSuccessful) throw IOException("Unexpected code $response")
//
//            for ((name, value) in response.headers) {
//                println("$name: $value")
//            }
//            println(response.body!!.string())
//        }
//    }
//
//    fun run(userInfo: HashMap<String, Any>) {
//
//        val request = Request.Builder()
//            .url("https://api.github.com/markdown/raw")
//            .post(userInfo)
//            .build()
//
//        client.newCall(request).execute().use { response ->
//            if (!response.isSuccessful) throw IOException("Unexpected code $response")
//
//            println(response.body!!.string())
//        }
//    }
}