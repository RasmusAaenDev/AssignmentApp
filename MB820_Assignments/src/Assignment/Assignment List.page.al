page 50200 "Assignment List"
{
    Caption = 'Assignments';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = Assignment;

    CardPageId = "Assignment Card";
    Editable = false;
    QueryCategory = 'Assignment List';


    layout
    {
        area(Content)
        {
            repeater(Group)
            {

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the Number field.', Comment = '%';
                }
                field(Title; Rec.Title)
                {
                    ToolTip = 'Specifies the value of the Title field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field("User Id"; Rec."User Id")
                {
                    ToolTip = 'Specifies the value of the User Id field.', Comment = '%';
                }
                field("Category Code"; Rec."Category Code")
                {
                    ToolTip = 'Specifies the value of the Category Code field.', Comment = '%';
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

            action(GetTodosFromAPI)
            {
                Caption = 'Get Todos from API';
                ApplicationArea = All;
                Image = Refresh;

                trigger OnAction()
                var
                    JsonPlaceholderMgt: Codeunit "JsonPlaceholder Mgt.";
                begin
                    JsonPlaceholderMgt.GetTodos();
                end;
            }
        }
        area(Reporting)
        {
            action(ExportAssignments)
            {
                Caption = 'Export Assignments';
                Image = ExportFile;
                ApplicationArea = All;

                trigger OnAction()
                var
                    AssignmentMgt: Codeunit "Assignment Mgt.";
                begin
                    AssignmentMgt.ExportAssignmentsToAzure();
                end;
            }

            action(PrintAssignments)
            {
                Caption = 'Print Assignments';
                Image = Print;
                ApplicationArea = All;

                RunObject = report "Print Assignments";
            }

            action(GetAllCustomerInfoOnAssignments)
            {
                Caption = 'Get Customer Info';
                ApplicationArea = All;

                trigger OnAction()
                var
                    Assignment: Record Assignment;
                    Customer: Record Customer;
                    CustomerNameList: List of [Text];
                begin
                    if Assignment.FindSet() then
                        repeat
                            if Customer.Get(Assignment."Customer No.") then
                                if not CustomerNameList.Contains(Customer.Name) then
                                    CustomerNameList.Add(Customer.Name);
                        until Assignment.Next() = 0;
                end;
            }
        }
    }
}