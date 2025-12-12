codeunit 50251 "Assignment Performance Test"
{

    trigger OnRun()
    var
        Assignment: Record Assignment;
        BCPTTestContext: Codeunit "BCPT Test Context";
    begin
        BCPTTestContext.StartScenario('Find Assignment');
        Assignment.SetRange(Status, Assignment.Status::Incomplete);
        Assignment.FindFirst();
        BCPTTestContext.EndScenario('Find Assignment');

        BCPTTestContext.StartScenario('Complete Assignment');
        Assignment.SetCompleted();
        BCPTTestContext.EndScenario('Complete Assignment');
    end;
}