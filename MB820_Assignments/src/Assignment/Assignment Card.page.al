page 50201 "Assignment Card"
{
    PageType = Card;
    // ApplicationArea = All;
    // UsageCategory = Administration;
    SourceTable = Assignment;

    Caption = 'Assignment Card';
    RefreshOnActivate = true;

    AboutTitle = 'About Assignment details';
    AboutText = 'Find the specific details of the *assignment*, as well as controlling the relationship to the Customers.';


    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Number field.', Comment = '%';

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit() then
                            CurrPage.Update();
                    end;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                    ToolTip = 'A short text describing the assignment', Comment = '%';

                    AboutTitle = 'Title';
                    AboutText = 'The title will be a shorthand reference describing the assignment.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Selection of the current status of the assignment.', Comment = '%';

                    AboutTitle = 'Status';
                    AboutText = 'The status indicates where in the workflow the assignment is currently.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("User Id"; Rec."User Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a specific user responsible for the assignment', Comment = '%';

                    AboutTitle = 'User Id';
                    AboutText = 'The user id indicates which user is currently responsible for the assignment.';
                }
                field("Category Code"; Rec."Category Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Category Code field.', Comment = '%';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.', Comment = '%';
                }
            }

            group(MetaData)
            {
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.', Comment = '%';
                }
                field(SystemId; Rec.SystemId)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemId field.', Comment = '%';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.', Comment = '%';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Complete)
            {
                Caption = 'Completed';
                ApplicationArea = All;
                Image = Approval;


                trigger OnAction()
                begin
                    Rec.SetCompleted();
                end;
            }

            action(InProgress)
            {
                Caption = 'In Progress';
                ApplicationArea = All;
                Image = WorkCenterLoad;

                trigger OnAction()
                begin
                    Rec.SetInProgress();
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        AssignmentMgt: Codeunit "Assignment Mgt.";
    begin
        AssignmentMgt.VerifyAssignmentSetup();
    end;
}