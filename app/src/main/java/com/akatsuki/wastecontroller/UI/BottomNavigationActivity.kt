package com.akatsuki.wastecontroller.UI

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.fragment.app.Fragment
import com.akatsuki.wastecontroller.R
import com.akatsuki.wastecontroller.UI.fragments.HomeFragment
import com.akatsuki.wastecontroller.UI.fragments.ProfileFragment
import com.akatsuki.wastecontroller.UI.fragments.SearchFragment
import com.akatsuki.wastecontroller.UI.fragments.SettingsFragment
import com.akatsuki.wastecontroller.databinding.ActivityBottomNavigationBinding

class BottomNavigationActivity : AppCompatActivity() {
    private lateinit var binding: ActivityBottomNavigationBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityBottomNavigationBinding.inflate(layoutInflater)
        val view = binding.root
        setContentView(view)

        val homeFragment = HomeFragment()
        val searchFragment = SearchFragment()
        val profileFragment = ProfileFragment()
        val settingsFragment = SettingsFragment()

        binding.bottomNavigationView.setItemSelected(R.id.home)
        setCurrentFragment(homeFragment)

        binding.bottomNavigationView.setOnItemSelectedListener {
            when(it){
                R.id.home->setCurrentFragment(homeFragment)
                R.id.search->setCurrentFragment(searchFragment)
                R.id.profile->setCurrentFragment(profileFragment)
                R.id.settings->setCurrentFragment(settingsFragment)

            }
            true
        }
    }

    private fun setCurrentFragment(fragment: Fragment)=
        supportFragmentManager.beginTransaction().apply {
            replace(R.id.flFragment,fragment)
            commit()
        }
}