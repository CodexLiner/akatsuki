package com.akatsuki.wastecontroller.UI.fragments

import android.content.Intent
import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.navigation.fragment.findNavController
import com.akatsuki.wastecontroller.R
import com.akatsuki.wastecontroller.UI.BottomNavigationActivity
import com.akatsuki.wastecontroller.databinding.FragmentLoginBinding
import com.google.firebase.auth.FirebaseAuth
import kotlinx.coroutines.Dispatchers.Main

// TODO: Rename parameter arguments, choose names that match
// the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
private const val ARG_PARAM1 = "param1"
private const val ARG_PARAM2 = "param2"

/**
 * A simple [Fragment] subclass.
 * Use the [LoginFragment.newInstance] factory method to
 * create an instance of this fragment.
 */
class LoginFragment : Fragment() {
    // TODO: Rename and change types of parameters
    lateinit var etEmail: EditText
    private lateinit var etPass: EditText
    private lateinit var btnLogin: Button
    private var _binding: FragmentLoginBinding? = null
    private val binding get() = _binding!!
    private lateinit var auth: FirebaseAuth

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        auth = FirebaseAuth.getInstance()
        _binding = FragmentLoginBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        etEmail = binding.email
        etPass = binding.password
        btnLogin = binding.signInButton2
        btnLogin.setOnClickListener {
            login()
        }
    }

    fun login() {
        val email = etEmail.text.toString()
        val pass = etPass.text.toString()
        auth.signInWithEmailAndPassword(email, pass).addOnCompleteListener {it->
            if (it.isSuccessful) {
                Toast.makeText(requireContext(), "Successfully LoggedIn", Toast.LENGTH_SHORT).show()
                activity?.let{
                    val intent = Intent (it, BottomNavigationActivity::class.java)
                    it.startActivity(intent)
                }
            } else
                Toast.makeText(requireContext(), "Log In failed ", Toast.LENGTH_SHORT).show()
        }
    }
}