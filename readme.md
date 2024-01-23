# Convert an NSArray of NSDictionary objects to an AppleScript List of Records

AppleScript does not allow you to use variables as key names in Records:
`set theRecord to {randomKey:"value"}`

This method let's you create records as long as you know what the keys are going to be. It cannot handle random data.

If your dictionary has a key for "email_address", the record must have a key set as "email address".