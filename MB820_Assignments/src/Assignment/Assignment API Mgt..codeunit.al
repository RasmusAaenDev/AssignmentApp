codeunit 50201 "Assignment API Mgt."
{
    procedure GetAssignmentsFromAPI()
    var
        myInt: Integer;
    begin
        GetAccessToken();
    end;

    procedure POSTAssignmentsToAPI()
    var
        myInt: Integer;
    begin

    end;

    [NonDebuggable]
    internal procedure GetAccessToken(): SecretText;
    var
        AccessToken: Text;
        APIKeyText: Text;
    begin
        APIKeyText := APIKey();
        // Do something with OAuth
        AccessToken := 'Something from OAuth';
        exit(AccessToken)
    end;


    [NonDebuggable]
    local procedure APIKey(): Text
    var
        myInt: Integer;
    begin
        exit('some-very-important-api-key-0992982');
    end;
}