--example api location:jsonplaceholder 
--location library version:1
--Tip:If yours executor is not support request don't use this!
local RequestLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/DropRevive/request/refs/heads/main/API_AccessHTTP.lua"))()
local options = {
    Url = "https://jsonplaceholder.typicode.com/posts/1",
    Method = "GET",
    Headers = { ["Accept"] = "application/json" },
    Callback = function(result)
        if result.Success then
            print("Request succeeded:")
            print("Status Code:", result.StatusCode)
            print("Response Body:", HttpService:JSONEncode(result.Body))
        else
            print("Request failed:")
            print("Status Code:", result.StatusCode)
            print("Error:", result.Body)
        end
    end
}

RequestLib.Request(options)
