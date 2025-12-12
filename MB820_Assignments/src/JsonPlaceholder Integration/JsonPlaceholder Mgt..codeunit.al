codeunit 50205 "JsonPlaceholder Mgt."
{
    procedure GetTodos()
    var
        Client: HttpClient;
        ResponseMessage: HttpResponseMessage;
        Content: HttpContent;
        AssignmentMgt: Codeunit "Assignment Mgt.";

        ResponseString: Text;
        JArray: JsonArray;
        JObject: JsonObject;
        JToken: JsonToken;
        ResultToken: JsonToken;

        UserId: Integer;
        Id: Integer;
        Title: Text;
        Completed: Boolean;
    begin
        // Request data from https://jsonplaceholder.typicode.com/todos
        if not Client.Get('https://jsonplaceholder.typicode.com/todos', ResponseMessage) then
            Error('Could not reach todos-api, try again later');

        Content := ResponseMessage.Content();
        Content.ReadAs(ResponseString);

        JArray.ReadFrom(ResponseString);
        foreach JToken in JArray do begin
            JObject := JToken.AsObject();

            //  {
            //     "userId": 1,
            //     "id": 1,
            //     "title": "delectus aut autem",
            //     "completed": false
            //   }

            UserId := JObject.SelectToken('userId', ResultToken) ? ResultToken.AsValue().AsInteger() : 0;
            Id := JObject.SelectToken('id', ResultToken) ? ResultToken.AsValue().AsInteger() : 0;
            Title := JObject.SelectToken('title', ResultToken) ? ResultToken.AsValue().AsText() : '';
            Completed := JObject.SelectToken('completed', ResultToken) ? ResultToken.AsValue().AsBoolean() : false;

            AssignmentMgt.InsertAssignment(UserId, Title, StrSubstNo('%1 created by %2, at: %3', Title, UserId, Today()), Id, Completed);
        end;
    end;
}