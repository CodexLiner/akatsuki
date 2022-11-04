package com.akatsuki.wastecontroller.api

import org.json.JSONObject

interface BackendResponse {
  fun Result(jsonObject: JSONObject)
}