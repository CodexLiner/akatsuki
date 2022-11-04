package com.akatsuki.wastecontroller.UI.fragments

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import androidx.navigation.fragment.findNavController
import com.akatsuki.wastecontroller.R
import com.akatsuki.wastecontroller.databinding.FragmentFirstBinding
import com.akatsuki.wastecontroller.databinding.FragmentLoginBinding

/**
 * A simple [Fragment] subclass.
 * Use the [FirstFragment.newInstance] factory method to
 * create an instance of this fragment.
 */
class FirstFragment : Fragment() {

    private var _binding: FragmentFirstBinding? = null
    private val binding get() = _binding!!
    private lateinit var btnSignUp: Button
    private lateinit var btnSignin: Button

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        _binding = FragmentFirstBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        btnSignin = binding.signInButton
        btnSignUp = binding.signUpButton
        btnSignin.setOnClickListener {
            findNavController().navigate(R.id.action_firstFragment_to_loginFragment)
        }
        btnSignUp.setOnClickListener {
            findNavController().navigate(R.id.action_firstFragment_to_signupFragment)
        }

    }
}