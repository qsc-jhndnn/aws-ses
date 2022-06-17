# AWS Simple Email Service (SES) module

### _Module for sending email using https://aws.amazon.com/ses/
 
### `SendEmail(email)`
Sends email defined by table `email`. The  arguement has the following fields

* `AccessId` - AWS Access ID
* `AccessKey` - AWS Access Key
* `Destination` - Destination email - ie `"to@bar.com"`
* `Message` - string of message content
* `Region` - AWS Server region - ie `"us-east-1"`
* `Source` - Source email - ie `"from@foo.com"`

Example of sending using SES email service

```
ses = require("aws-ses")

local destination = "to@foo.com"
local source = "from@bar.com"

local subject = "This is a subject"
local content = "and some content\n\nand another line"

local message = string.format("Subject: %s\n\n%s", subject, message)

ses.SendEmail({
  Region = "us-east-1",
  Source = source,
  Destination = destination,
  Message = message,
  AccessKey = AWS_ACCESS_KEY,
  AccessId = AWS_ACCESS_ID
})
```



 
