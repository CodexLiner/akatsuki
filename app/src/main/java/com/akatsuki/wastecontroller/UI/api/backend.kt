package com.akatsuki.wastecontroller.api

import android.app.Activity
import android.os.AsyncTask

class backend(val activity: Activity , url : String) : AsyncTask<Void, Void, String>() {
    lateinit var backendResponse : BackendResponse;

    override fun doInBackground(vararg p0: Void?): String {
        return "git ";
    }

    override fun onPreExecute() {
        super.onPreExecute()
    }

    override fun onPostExecute(result: String?) {
        super.onPostExecute(result)
    }
    fun sendResponse(){

    }

}