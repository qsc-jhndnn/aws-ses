aws = require("aws-auth")

local ses = {}

function ses.SendEmail(data)
  local encodedMessage = Crypto.Base64Encode(data.Message)
  -- trim off trailing =s if it exists
  encodedMessage = string.gsub(encodedMessage, "=", "")

  local payloadString = "Action=SendRawEmail"
  payloadString = payloadString..string.format("&Destinations.member.1=%s", HttpClient.EncodeString(data.Destination))
  payloadString = payloadString..string.format("&RawMessage.Data=%s", encodedMessage)
  payloadString = payloadString..string.format("&Source=%s", HttpClient.EncodeString(data.Source))

  local rq = {
    Region = data.Region,
    Service = "email",
    ContentType = "application/x-www-form-urlencoded",
    Payload = payloadString,
    AccessId = data.AccessId,
    AccessKey = data.AccessKey
  }
  local signedRequest = aws.GetSignedRequest(rq)

  signedRequest.EventHandler = function(_,code,data,err) 
    print("RESP: ",  data, code)
  end

  HttpClient.Upload(signedRequest)
end

return ses
