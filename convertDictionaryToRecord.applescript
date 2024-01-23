use framework "Foundation"
use scripting additions

-- TEST AREA
-- Create Test Data
set myNSDictionary to current application's NSDictionary's dictionaryWithObjects:{"Object1", "Object2", "Object3"} forKeys:{"created", "bounceFolder", "bounceFile"}
set myOther to current application's NSDictionary's dictionaryWithObjects:{"Object4", "Object5", "Object6"} forKeys:{"created", "bounceFolder", "bounceFile"}
set myArray to current application's NSMutableArray's arrayWithObject:myNSDictionary
myArray's addObject:myOther

set theRecords to convertDictionaryToRecord(myArray)
log theRecords
-- END TEST AREA

-- Convert an NSArray of NSDictionary objects to a list of records for use in AppleScript
on convertDictionaryToRecord(sessionData)

    -- Prepare an empty list for AppleScript records
    set listOfRecords to {}
    repeat with theObject in sessionData

        -- set variables to keep things clean
        set createdDate to (theObject's objectForKey:"created") as string
        set bounceFolder to (theObject's objectForKey:"bounceFolder") as string
        set bounceFile to (theObject's objectForKey:"bounceFile") as string

        -- create new record but with predefined keys
        set currentRecord to {created:createdDate, bounceFolder:bounceFolder, bounceFile:bounceFile}

        -- Add the record to the list
        copy currentRecord to end of listOfRecords
    end repeat

    -- return a list of records
    return listOfRecords
end convertDictionaryToRecord

