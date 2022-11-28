object Form1: TForm1
  Width = 1100
  Height = 589
  CSSLibrary = cssBootstrap
  ElementClassName = 'd-flex w-100 h-100 bg-dark'
  ElementFont = efCSS
  OnCreate = WebFormCreate
  object divMain: TWebHTMLDiv
    Left = 40
    Top = 8
    Width = 1025
    Height = 573
    ElementClassName = 'd-flex flex-fill p-1 w-100 h-100'
    ElementID = 'divMain'
    HeightStyle = ssAuto
    WidthStyle = ssAuto
    ElementPosition = epRelative
    ElementFont = efCSS
    Role = ''
    object divDocumentsHolder: TWebHTMLDiv
      Left = 57
      Top = 40
      Width = 450
      Height = 505
      ElementClassName = 
        'flex-shrink-0 overflow-hidden RightSplitter d-flex flex-column o' +
        'rder-0 rounded border border-secondary bg-secondary'
      ElementID = 'divDocumentsHolder'
      HeightStyle = ssAuto
      ElementPosition = epRelative
      ElementFont = efCSS
      Role = ''
      object divDocumentsButtons: TWebHTMLDiv
        Left = 32
        Top = 19
        Width = 361
        Height = 73
        ElementClassName = 
          'rounded-0 border-bottom border-dark  flex-wrap order-0  d-flex j' +
          'ustify-content-start align-items-center bg-white p-1 gap-1'
        ElementID = 'divDocumentsButtons'
        HeightStyle = ssAuto
        WidthStyle = ssAuto
        ElementPosition = epRelative
        ElementFont = efCSS
        Role = ''
        object btnAdd: TWebButton
          Left = 3
          Top = 16
          Width = 50
          Height = 33
          Caption = '<i class="fa-solid fa-file-circle-plus fa-lg  me-2"></i>Add'
          ElementClassName = 'flex-fill order-0 btn btn-success btn-sm border border-dark'
          ElementID = 'btnAdd'
          ElementFont = efCSS
          ElementPosition = epRelative
          HeightStyle = ssAuto
          HeightPercent = 100.000000000000000000
          WidthStyle = ssAuto
          WidthPercent = 100.000000000000000000
          OnClick = btnAddClick
        end
        object btnDelete: TWebButton
          Left = 115
          Top = 16
          Width = 50
          Height = 33
          Caption = '<i class="fa-solid fa-file-circle-minus fa-lg me-2"></i>Delete'
          ChildOrder = 1
          ElementClassName = 'flex-fill order-2 btn btn-danger btn-sm border border-dark'
          ElementID = 'btnDelete'
          ElementFont = efCSS
          ElementPosition = epRelative
          HeightStyle = ssAuto
          HeightPercent = 100.000000000000000000
          WidthStyle = ssAuto
          WidthPercent = 100.000000000000000000
          OnClick = btnDeleteClick
        end
        object btnExport: TWebButton
          Left = 171
          Top = 16
          Width = 50
          Height = 33
          Caption = '<i class="fa-solid fa-download fa-lg me-2"></i>Export'
          ChildOrder = 1
          ElementClassName = 'flex-fill order-3 btn btn-secondary btn-sm border border-dark'
          ElementID = 'btnExport'
          ElementFont = efCSS
          ElementPosition = epRelative
          HeightStyle = ssAuto
          HeightPercent = 100.000000000000000000
          WidthStyle = ssAuto
          WidthPercent = 100.000000000000000000
          OnClick = btnExportClick
        end
        object btnImport: TWebButton
          Left = 227
          Top = 16
          Width = 50
          Height = 33
          Caption = '<i class="fa-solid fa-upload fa-lg me-2"></i>Import'
          ChildOrder = 1
          ElementClassName = 'flex-fill order-4 btn btn-secondary btn-sm border border-dark'
          ElementID = 'btnImport'
          ElementFont = efCSS
          ElementPosition = epRelative
          HeightStyle = ssAuto
          HeightPercent = 100.000000000000000000
          WidthStyle = ssAuto
          WidthPercent = 100.000000000000000000
          OnClick = btnImportClick
        end
        object btnClone: TWebButton
          Left = 59
          Top = 16
          Width = 50
          Height = 33
          Caption = '<i class="fa-solid fa-clone fa-lg  me-2"></i>Clone'
          ChildOrder = 4
          ElementClassName = 'flex-fill order-1 btn btn-primary btn-sm border border-dark'
          ElementID = 'btnClone'
          ElementFont = efCSS
          ElementPosition = epRelative
          HeightStyle = ssAuto
          HeightPercent = 100.000000000000000000
          WidthStyle = ssAuto
          WidthPercent = 100.000000000000000000
          OnClick = btnCloneClick
        end
      end
      object divDocuments: TWebHTMLDiv
        Left = 32
        Top = 128
        Width = 369
        Height = 273
        ElementClassName = 'flex-fill order-1'
        ElementID = 'divDocuments'
        HeightStyle = ssAuto
        WidthStyle = ssAuto
        ChildOrder = 1
        ElementPosition = epRelative
        ElementFont = efCSS
        Role = ''
      end
      object divDocumentsSplitter: TWebHTMLDiv
        Left = 288
        Top = 456
        Width = 100
        Height = 41
        Cursor = crHSplit
        ElementClassName = 'ResizeElement'
        ElementID = 'divDocumentsSplitter'
        HeightStyle = ssAuto
        WidthStyle = ssAuto
        ChildOrder = 2
        ElementPosition = epIgnore
        ElementFont = efCSS
        HTML.Strings = (
          '<div class="InnerTriangle1"></div>'
          '<div class="InnerTriangle2"></div>')
        Role = ''
      end
    end
    object divPageControlHolder: TWebHTMLDiv
      Left = 488
      Top = 40
      Width = 489
      Height = 505
      ElementClassName = 
        'd-flex flex-column overflow-hidden flex-fill order-1 rounded bor' +
        'der border-secondary bg-white'
      ElementID = 'divPageControlHolder'
      HeightStyle = ssAuto
      WidthStyle = ssAuto
      ChildOrder = 1
      ElementPosition = epRelative
      ElementFont = efCSS
      Role = ''
      object pageControlMain: TWebPageControl
        Left = 40
        Top = 160
        Width = 425
        Height = 305
        ElementClassName = 'order-1 flex-fill'
        ElementID = 'pageControlMain'
        HeightStyle = ssAuto
        WidthStyle = ssAuto
        ElementFont = efCSS
        TabIndex = 1
        ShowTabs = False
        TabOrder = 0
        object pageSettings: TWebTabSheet
          Left = 0
          Top = 20
          Width = 425
          Height = 285
          ElementClassName = 'flex-fill'
          ElementID = 'pageSettings'
          Caption = 'Settings'
          ElementBodyClassName = 'd-flex overflow-hidden h-100'
          ElementFont = efCSS
          object WebHTMLDiv2: TWebHTMLDiv
            Left = 24
            Top = 104
            Width = 353
            Height = 162
            ElementClassName = 'd-flex flex-column flex-fill bg-secondary'
            ElementID = 'divSettingsHolder'
            HeightStyle = ssAuto
            WidthStyle = ssAuto
            ChildOrder = 1
            ElementPosition = epRelative
            ElementFont = efCSS
            Role = ''
            object divGroupEdit: TWebHTMLDiv
              Left = 32
              Top = 48
              Width = 321
              Height = 41
              ElementClassName = 'order-1 d-flex p-1 gap-2 align-items-center'
              ElementID = 'divGroupEdit'
              HeightStyle = ssAuto
              WidthStyle = ssAuto
              ElementPosition = epRelative
              ElementFont = efCSS
              Role = ''
              object labelGroupEdit: TWebLabel
                Left = 24
                Top = 16
                Width = 75
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Group'
                ElementLabelClassName = 'text-white'
                ElementID = 'labelGroupEdit'
                ElementFont = efCSS
                ElementPosition = epRelative
                HeightStyle = ssAuto
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object editGroupEdit: TWebEdit
                Left = 144
                Top = 8
                Width = 121
                Height = 30
                ChildOrder = 1
                ElementClassName = 'rounded px-2 border-1 border-dark'
                ElementID = 'editGroupEdit'
                ElementFont = efCSS
                ElementPosition = epRelative
                HeightPercent = 100.000000000000000000
                WidthStyle = ssPercent
                WidthPercent = 100.000000000000000000
                OnChange = editGroupEditChange
              end
            end
            object divNameEdit: TWebHTMLDiv
              Left = 29
              Top = 95
              Width = 321
              Height = 41
              ElementClassName = 'order-2 d-flex p-1 gap-2 align-items-center'
              ElementID = 'divNameEdit'
              HeightStyle = ssAuto
              WidthStyle = ssAuto
              ChildOrder = 1
              ElementPosition = epRelative
              ElementFont = efCSS
              Role = ''
              object labelNameEdit: TWebLabel
                Left = 16
                Top = 17
                Width = 75
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Name'
                ElementLabelClassName = 'text-white'
                ElementID = 'labelNameEdit'
                ElementFont = efCSS
                ElementPosition = epRelative
                HeightStyle = ssAuto
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object editNameEdit: TWebEdit
                Left = 152
                Top = 7
                Width = 121
                Height = 30
                ChildOrder = 1
                ElementClassName = 'rounded px-2 border-1 border-dark'
                ElementID = 'editNameEdit'
                ElementFont = efCSS
                ElementPosition = epRelative
                HeightPercent = 100.000000000000000000
                WidthStyle = ssPercent
                WidthPercent = 100.000000000000000000
                OnChange = editGroupEditChange
              end
            end
            object divCollectionEdit: TWebHTMLDiv
              Left = 29
              Top = 3
              Width = 321
              Height = 41
              ElementClassName = 'order-0 d-flex p-1 gap-2 align-items-center'
              ElementID = 'divCollectionEdit'
              HeightStyle = ssAuto
              WidthStyle = ssAuto
              ChildOrder = 2
              ElementPosition = epRelative
              ElementFont = efCSS
              Role = ''
              object labelCollectionEdit: TWebLabel
                Left = 24
                Top = 16
                Width = 75
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Collection'
                ElementLabelClassName = 'text-white'
                ElementID = 'labelCollectionEdit'
                ElementFont = efCSS
                ElementPosition = epRelative
                HeightStyle = ssAuto
                HeightPercent = 100.000000000000000000
                WidthPercent = 100.000000000000000000
              end
              object editCollectionEdit: TWebEdit
                Left = 144
                Top = 9
                Width = 121
                Height = 30
                ChildOrder = 1
                ElementClassName = 'rounded px-2 border-1 border-dark'
                ElementID = 'editCollectionEdit'
                ElementFont = efCSS
                ElementPosition = epRelative
                HeightStyle = ssAuto
                HeightPercent = 100.000000000000000000
                WidthStyle = ssPercent
                WidthPercent = 100.000000000000000000
                OnChange = editCollectionEditChange
              end
            end
          end
        end
        object pageView: TWebTabSheet
          Left = 0
          Top = 20
          Width = 425
          Height = 285
          ElementClassName = 'flex-fill'
          ElementID = 'pageView'
          WidthStyle = ssAuto
          Caption = 'View'
          ChildOrder = 1
          ElementBodyClassName = 'd-flex flex-column overflow-hidden h-100 text-wrap'
          ElementFont = efCSS
          ElementPosition = epRelative
          object divViewer: TWebHTMLDiv
            Left = 8
            Top = 3
            Width = 414
            Height = 166
            ElementClassName = 
              'order-0 sun-editor sun-editor-editable bg-white pe-auto user-sel' +
              'ect-auto flex-fill d-flex flex-column overflow-auto'
            ElementID = 'divViewer'
            HeightStyle = ssAuto
            WidthStyle = ssAuto
            ChildOrder = 3
            ElementPosition = epRelative
            ElementFont = efCSS
            Role = ''
          end
          object divViewerButtons: TWebHTMLDiv
            Left = 3
            Top = 196
            Width = 201
            Height = 63
            ElementClassName = 'd-flex order-1 w-100 p-1 border-top border-1 border-dark'
            ElementID = 'divViewerButtons'
            HeightStyle = ssAuto
            WidthStyle = ssAuto
            ChildOrder = 1
            ElementPosition = epRelative
            ElementFont = efCSS
            Role = ''
            object btnPrint: TWebButton
              Left = 19
              Top = 16
              Width = 50
              Height = 33
              Caption = '<i class="fa-solid fa-print fa-lg me-2"></i>Print'
              ElementClassName = 'order-0 btn btn-primary btn-sm border border-dark'
              ElementID = 'btnPrint'
              ElementFont = efCSS
              ElementPosition = epRelative
              HeightStyle = ssAuto
              HeightPercent = 100.000000000000000000
              WidthStyle = ssAuto
              WidthPercent = 100.000000000000000000
              OnClick = btnPrintClick
            end
          end
        end
        object pageEdit: TWebTabSheet
          Left = 0
          Top = 20
          Width = 425
          Height = 285
          ElementClassName = 'flex-fill'
          ElementID = 'pageEdit'
          HeightStyle = ssAuto
          WidthStyle = ssAuto
          Caption = 'Edit'
          ChildOrder = 2
          ElementBodyClassName = 'd-flex overflow-hidden h-100'
          ElementFont = efCSS
          ElementPosition = epRelative
          object divContentHolder: TWebHTMLDiv
            Left = 8
            Top = 24
            Width = 414
            Height = 225
            ElementClassName = 'flex-fill d-flex flex-column overflow-hidden'
            ElementID = 'divContentHolder'
            HeightStyle = ssAuto
            WidthStyle = ssAuto
            ChildOrder = 3
            ElementPosition = epRelative
            ElementFont = efCSS
            Role = ''
            object divContentFooter: TWebHTMLDiv
              Left = 40
              Top = 182
              Width = 180
              Height = 20
              ElementClassName = 'order-2 flex-shrink-0'
              ElementID = 'divContentFooter'
              WidthStyle = ssAuto
              ChildOrder = 1
              ElementPosition = epRelative
              ElementFont = efCSS
              Role = ''
            end
            object divContent: TWebHTMLDiv
              Left = 40
              Top = 71
              Width = 337
              Height = 105
              ElementClassName = 'order-1 flex-fill overflow-auto'
              ElementID = 'divContent'
              HeightStyle = ssAuto
              WidthStyle = ssAuto
              ChildOrder = 1
              ElementPosition = epRelative
              ElementFont = efCSS
              HTML.Strings = (
                '<div id="divContentText" class="w-100 h-100"></div>')
              Role = ''
            end
            object divContentHeader: TWebHTMLDiv
              Left = 40
              Top = 24
              Width = 180
              Height = 41
              ElementClassName = 'order-0 flex-shrink-0 sun-editor'
              ElementID = 'divContentHeader'
              HeightStyle = ssAuto
              WidthStyle = ssAuto
              ChildOrder = 2
              ElementPosition = epRelative
              ElementFont = efCSS
              Role = ''
            end
          end
        end
      end
      object divTabButtons: TWebHTMLDiv
        Left = 40
        Top = 27
        Width = 385
        Height = 102
        ElementClassName = 
          'flex-shrink-0 rounded-0 border-bottom border-dark order-0 d-flex' +
          ' justify-content-between align-items-center bg-white p-1 gap-1'
        ElementID = 'divTabButtons'
        HeightStyle = ssAuto
        WidthStyle = ssAuto
        ChildOrder = 1
        ElementPosition = epRelative
        ElementFont = efCSS
        Role = ''
        object labelCollection: TWebLabel
          Left = 280
          Top = 43
          Width = 70
          Height = 13
          AutoSize = False
          Caption = 'No Documents'
          ElementClassName = 'order-1 pe-2'
          ElementID = 'labelCollection'
          ElementFont = efCSS
          ElementPosition = epRelative
          HeightStyle = ssAuto
          HeightPercent = 100.000000000000000000
          WidthStyle = ssAuto
          WidthPercent = 100.000000000000000000
        end
        object divTabButtonGroup: TWebHTMLDiv
          Left = 16
          Top = 18
          Width = 201
          Height = 63
          ElementClassName = 'btn-group order-0 d-flex align-items-center bg-white'
          ElementID = 'divTabButtonGroup'
          HeightStyle = ssAuto
          WidthStyle = ssAuto
          ChildOrder = 1
          ElementPosition = epRelative
          ElementFont = efCSS
          Role = ''
          object btnView: TWebButton
            Left = 19
            Top = 16
            Width = 50
            Height = 33
            Caption = '<i class="fa-solid fa-eye fa-lg me-2"></i>View'
            ElementClassName = 'order-0 btn btn-primary btn-sm border border-dark'
            ElementID = 'btnView'
            ElementFont = efCSS
            ElementPosition = epRelative
            HeightStyle = ssAuto
            HeightPercent = 100.000000000000000000
            WidthStyle = ssAuto
            WidthPercent = 100.000000000000000000
            OnClick = btnViewClick
          end
          object btnEdit: TWebButton
            Left = 75
            Top = 16
            Width = 50
            Height = 33
            Caption = '<i class="fa-solid fa-pencil fa-lg me-2"></i>Edit'
            ChildOrder = 1
            ElementClassName = 'order-1 btn btn-dark btn-sm border border-dark'
            ElementID = 'btnEdit'
            ElementFont = efCSS
            ElementPosition = epRelative
            HeightStyle = ssAuto
            HeightPercent = 100.000000000000000000
            WidthStyle = ssAuto
            WidthPercent = 100.000000000000000000
            OnClick = btnEditClick
          end
          object btnSettings: TWebButton
            Left = 131
            Top = 16
            Width = 50
            Height = 33
            Caption = '<i class="fa-solid fa-gear fa-lg me-2"></i>Settings'
            ChildOrder = 2
            ElementClassName = 'order-2 btn btn-dark btn-sm border border-dark'
            ElementID = 'btnSettings'
            ElementFont = efCSS
            ElementPosition = epRelative
            HeightStyle = ssAuto
            HeightPercent = 100.000000000000000000
            WidthStyle = ssAuto
            WidthPercent = 100.000000000000000000
            OnClick = btnSettingsClick
          end
        end
      end
    end
  end
end
