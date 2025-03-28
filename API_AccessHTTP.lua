local RequestLib = {}

function RequestLib.Request(options)
    local responseFunction = syn and syn.request or request
    if not responseFunction then
        error("not support HTTP requests.")
    end

    if not options.Url then
        error("Need Link(API)")
    end

    local method = options.Method or "GET"
    local headers = options.Headers or { ["Content-Type"] = "application/json" }
    local body = options.Body or ""

    local response = responseFunction({
        Url = options.Url,
        Method = method,
        Headers = headers,
        Body = method == "POST" and HttpService:JSONEncode(body) or nil
    })

    -- Process the response and invoke the callback(API)
    local result = {
        Success = response and response.Success or false,
        StatusCode = response and response.StatusCode or 500,
        Body = response and (response.Success and HttpService:JSONDecode(response.Body) or response.StatusMessage) or "Unknown error"
    }

    if options.Callback then
        options.Callback(result)
    else
        warn("Callback function not provided for the request.")
    end
end
