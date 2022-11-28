unit Unit1;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls, jsdelphisystem,
  WEBLib.Forms, WEBLib.Dialogs, Vcl.Controls, WEBLib.WebCtrls,
  Vcl.StdCtrls, WEBLib.StdCtrls, WEBLib.ComCtrls;

type
  TForm1 = class(TWebForm)
    divMain: TWebHTMLDiv;
    divDocumentsHolder: TWebHTMLDiv;
    divPageControlHolder: TWebHTMLDiv;
    divDocumentsButtons: TWebHTMLDiv;
    divDocuments: TWebHTMLDiv;
    btnAdd: TWebButton;
    btnDelete: TWebButton;
    divDocumentsSplitter: TWebHTMLDiv;
    pageControlMain: TWebPageControl;
    pageSettings: TWebTabSheet;
    pageView: TWebTabSheet;
    pageEdit: TWebTabSheet;
    divContentHolder: TWebHTMLDiv;
    divContentFooter: TWebHTMLDiv;
    divContent: TWebHTMLDiv;
    divContentHeader: TWebHTMLDiv;
    divViewer: TWebHTMLDiv;
    divTabButtons: TWebHTMLDiv;
    btnExport: TWebButton;
    btnImport: TWebButton;
    btnClone: TWebButton;
    WebHTMLDiv2: TWebHTMLDiv;
    divGroupEdit: TWebHTMLDiv;
    labelGroupEdit: TWebLabel;
    editGroupEdit: TWebEdit;
    divNameEdit: TWebHTMLDiv;
    labelNameEdit: TWebLabel;
    editNameEdit: TWebEdit;
    divCollectionEdit: TWebHTMLDiv;
    labelCollectionEdit: TWebLabel;
    editCollectionEdit: TWebEdit;
    labelCollection: TWebLabel;
    divTabButtonGroup: TWebHTMLDiv;
    btnView: TWebButton;
    btnEdit: TWebButton;
    btnSettings: TWebButton;
    divViewerButtons: TWebHTMLDiv;
    btnPrint: TWebButton;
    procedure WebFormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnViewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnSettingsClick(Sender: TObject);
    procedure DocSelect(DocID: String);
    procedure DocChanged;
    procedure btnCloneClick(Sender: TObject);
    procedure editGroupEditChange(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
    procedure UpdateTitle(Collection: String);
    procedure editCollectionEditChange(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tabDocuments: JSValue;
    tabDocumentsReady: Boolean;
    suneditorContent: JSValue;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnPrintClick(Sender: TObject);
begin

  asm
    var PageTitle = 'Document';
    var table = this.tabDocuments;
    var rows = table.getSelectedRows();
    var divContents = '';;

    if (rows.length > 0) {
      PageTitle = rows[0].getCell('doc_collection').getValue()+' / '+rows[0].getCell('doc_group').getValue()+' / '+rows[0].getCell('doc_name').getValue();
      divContents = rows[0].getCell('doc').getValue();
    }

    var a = window.open(' ', '', '');
    a.document.write('<html>');
    a.document.write('<title>'+PageTitle+'</title>');

    a.document.write('<link crossorigin="anonymous" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" rel="stylesheet"/>');
    a.document.write('<link href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6/css/all.min.css" rel="stylesheet"/>');
    a.document.write('<link href="https://fonts.googleapis.com" rel="preconnect"/>');
    a.document.write('<link crossorigin href="https://fonts.gstatic.com" rel="preconnect"/>');
    a.document.write('<link href="https://fonts.googleapis.com/css2?family=Roboto&amp;family=Cairo&amp;family=Roboto+Condensed&amp;display=swap" rel="stylesheet"/>');
    a.document.write('<link href="https://cdn.jsdelivr.net/npm/tabulator-tables@5/dist/css/tabulator.min.css" rel="stylesheet"/>');
    a.document.write('<link href="https://cdn.jsdelivr.net/npm/codemirror@5.49.0/lib/codemirror.min.css" rel="stylesheet"/>');
    a.document.write('<link href="https://cdn.jsdelivr.net/npm/katex@0.11.1/dist/katex.min.css" rel="stylesheet"/>');
    a.document.write('<link href="https://cdn.jsdelivr.net/npm/suneditor@latest/dist/css/suneditor.min.css" rel="stylesheet"/>');
    a.document.write('<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.7.0/build/styles/base16/eighties.min.css">');
    a.document.write('<script src="https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.7.0/build/highlight.min.js"></script>');
    a.document.write('<script src="https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.7.0/build/languages/delphi.min.js"></script>');
    a.document.write('<script src="https://cdn.jsdelivr.net/npm/prismjs@1.29.0/prism.min.js" data-manual></script>');
    a.document.write('<script src="https://cdn.jsdelivr.net/npm/prismjs@1.29.0/components/prism-css.min.js"></script>');
    a.document.write('<script src="https://cdn.jsdelivr.net/npm/prismjs@1.29.0/components/prism-json.min.js"></script>');
    a.document.write('<script src="https://cdn.jsdelivr.net/npm/prismjs@1.29.0/components/prism-markup.min.js"></script>');
    a.document.write('<script src="https://cdn.jsdelivr.net/npm/prismjs@1.29.0/components/prism-pascal.min.js"></script>');
    a.document.write('<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/prismjs@1.29.0/themes/prism-coy.min.css">');
    a.document.write('<script src="https://cdn.jsdelivr.net/npm/prismjs@1.29.0/plugins/line-numbers/prism-line-numbers.min.js"></script>');
    a.document.write('<script src="https://cdn.jsdelivr.net/npm/prismjs@1.29.0/plugins/match-braces/prism-match-braces.min.js"></script>');
    a.document.write('<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/prismjs@1.29.0/plugins/line-numbers/prism-line-numbers.min.css">');
    a.document.write('<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/prismjs@1.29.0/plugins/match-braces/prism-match-braces.min.css">');
    a.document.write('<link href="editor.css" rel="stylesheet"/>');

    a.document.write('<body>');
    a.document.write(
        '<div id="suneditorPrint" class="sun-editor line-numbers sun-editor-editable" style="width:auto; max-width:720px; background:white; margin:auto;">'+divContents+'</div>'+
        '<script>'+
           'hljs.configure({ ignoreUnescapedHTML: true });'+
           'document.querySelectorAll(".HLJS").forEach((el) => {'+
             'el.classList.replace("l-delphi","language-delphi");'+
             'el.classList.replace("l-js","language-js");'+
             'el.classList.replace("l-html","language-html");'+
             'el.classList.replace("l-css","language-css");'+
             'el.classList.replace("l-json","language-json");'+
             'if (el.classList.contains("language-json")) {'+
             'try {'+
               'el.innerHTML = JSON.stringify(JSON.parse(el.innerHTML.replace(/(<br\s*\\/?\\s*>\\s*)+$/,"")),null,2);'+
             '} catch {}}'+
             'el.textContent = el.innerText;'+
             'hljs.highlightElement(el);'+
           '});'+
           'document.querySelectorAll(".PRISM").forEach((el) => {'+
              'var elpre = document.createElement("pre");'+
              'var elcode = document.createElement("code");'+
              'if (el.classList.contains("l-delphi")) {'+
                'elpre.classList.add("language-pascal", "PRISM");'+
                'elcode.classList.add("language-pascal");'+
              '}'+
              'else if (el.classList.contains("l-js")) {'+
                'elpre.classList.add("language-js", "PRISM");'+
                'elcode.classList.add("language-js");'+
              '}'+
              'else if (el.classList.contains("l-html")) {'+
                'elpre.classList.add("language-html", "PRISM");'+
                'elcode.classList.add("language-html");'+
              '}'+
              'else if (el.classList.contains("l-css")) {'+
                'elpre.classList.add("language-css", "PRISM");'+
                'elcode.classList.add("language-css");'+
              '}'+
              'else if (el.classList.contains("l-json")) {'+
                'elpre.classList.add("language-json", "PRISM");'+
                'elcode.classList.add("language-json");'+
              '}'+
              'if (elcode.classList.contains("language-json")) {'+
                'try {'+
                  'elcode.innerHTML = JSON.stringify(JSON.parse(el.innerHTML.replace(/(<br\\s*\\/?\\s*>\\s*)+$/,"")),null,2);'+
                '}'+
                'catch {'+
                  'elcode.innerHTML = el.innerHTML;'+
                '}'+
              '}'+
              'else {'+
                'elcode.innerHTML = el.innerHTML;'+
              '}'+
              'elpre.innerHTML = elcode.outerHTML;'+
              'el.outerHTML = elpre.outerHTML;'+
              'Prism.hooks.add("before-highlight", function (env) {'+
                'env.element.innerHTML = env.element.innerHTML.replace(/<br>/g, "\\n");'+
                'env.code = env.element.innerText;'+
              '});'+
            '});'+
            'document.querySelectorAll(".PRISM").forEach((el) => {'+
              'Prism.highlightElement(el.firstElementChild);'+
            '});'+
            'document.addEventListener("readystatechange", event => {'+
              'if (event.target.readyState === "complete") {'+
                'print();'+
                'window.close();'+
             '}});'+
        '</script>');

    a.document.write('</body>');
    a.document.write('</html>');
    a.document.close();

  end;
end;


procedure TForm1.btnAddClick(Sender: TObject);
var
  NewID: String;
  NewGroup: String;
  NewName: String;
  NewDoc: String;
  DocCount: Integer;


begin

  // To add a new document we'll need to know the name of the current group
  // and the current document reference so we can insert the new document after the current one.
  // From there, we just add a new blank document.
  // Note - in the default view, which is sorted, this doesn't matter so much.
  // But if we end up with a view that is user-sortable, this matters more.


  NewID := TGUID.NewGUID.ToString;
  NewGroup := 'New Group';
  NewName := 'New Document';
  NewDoc := 'New document.';
  DocCount := 0;

  asm
    var table = this.tabDocuments;
    var row = false;

    // Part of Initializing the UI
    DocCount = table.getDataCount();

    // if a row is already selected, get the group from there
    if (DocCount > 0) {
      var rows = table.getSelectedRows();
      if (rows.length > 0) {
        row = rows[0].getCell('doc_id').getValue();
        NewGroup = rows[0].getCell('doc_group').getValue();
      }
    }

    // No row selected, so just append wherever
    if (row == false) {
      table.addRow({
        doc_id: NewID,
        doc_group: NewGroup,
        doc_name: NewName,
        doc: NewDoc
      }).then(function(row){
        table.deselectRow();
        table.selectRow(NewID);
        pas.Unit1.Form1.DocSelect(NewID);

        // Re-sort the table
        table.setSort([
          {column:"doc_name", dir:"asc"},
          {column:"doc_group", dir:"asc"}
        ]);

        // Groups seem resistant to change?
        table.setGroupBy('');
        table.setGroupBy('doc_group');
        table.redraw(true);

      });
    }
    // Append after selected row
    else {
      table.addRow({
        doc_id: NewID,
        doc_group: NewGroup,
        doc_name: NewName,
        doc: NewDoc
      }, false, row).then(function(row){
        table.deselectRow();
        table.selectRow(row);
        pas.Unit1.Form1.DocSelect(NewID);

        // Re-sort the table
        table.setSort([
          {column:"doc_name", dir:"asc"},
          {column:"doc_group", dir:"asc"}
        ]);

        // Groups seem resistant to change?
        table.setGroupBy('');
        table.setGroupBy('doc_group');
        table.redraw(true);

      });
    }

    // Sometimes it needs a little nudge
    this.tabDocuments.redraw();

  end;

  // We're most likely going to want to edit this.
  btnSettingsClick(Sender);

  if DocCount = 0 then
  begin
    editCollectionEdit.Text := 'New Collection';
    UpdateTitle(editCollectionEdit.Text);
  end;

end;

procedure TForm1.btnEditClick(Sender: TObject);
begin
  pageControlMain.TabIndex := 2;

  btnView.ElementHandle.classList.replace('btn-primary','btn-dark');
  btnEdit.ElementHandle.classList.replace('btn-dark','btn-primary');
  btnSettings.ElementHandle.classList.replace('btn-primary','btn-dark');
end;

procedure TForm1.btnExportClick(Sender: TObject);
var
  Collection: String;

begin

  Collection := editcollectionEdit.Text;

  asm
    // set every record to have the same collection. Lazy, I know.
    var table = this.tabDocuments;
    var rows = table.getRows();
    for (var i = 0; i < rows.length; i++) {
      rows[i].getCell('doc_collection').setValue(Collection);
    }

    // Nothing special here, just a JSON export of the entire underlying table
    this.tabDocuments.download("json", "DocumentEditor.documents");
  end;

end;

procedure TForm1.btnImportClick(Sender: TObject);
var
  Collection: String;

begin

  Collection := 'New Collection';

  asm
    var table = this.tabDocuments;

    // Just importing a JSON representation of the table.
    // Kind of lazy to have the document title as one of the columns, but hey.
    table.import("json", ".documents")
      .then(() => {
        //file successfully imported

        // Re-sort the table
        table.setSort([
          {column:"doc_name", dir:"asc"},
          {column:"doc_group", dir:"asc"}
        ]);

        // Groups seem resistant to change?
        table.setGroupBy('');
        table.setGroupBy('doc_group');
        table.redraw(true);

        var rows = table.getRows();
        if (rows.length > 0) {
          rows[0].select();
          Collection = rows[0].getCell('doc_collection').getValue();
          pas.Unit1.Form1.UpdateTitle(Collection);
          pas.Unit1.Form1.DocSelect(rows[0].getCell('doc_id').getValue());
        }

      })
      .catch(() => {
        //something went wrong?
        alert('\nSorry, the import was unsuccessful.\nPlease try again.\n');
      })
  end;

end;

procedure TForm1.btnSettingsClick(Sender: TObject);
begin
  pageControlMain.TabIndex := 0;

  btnView.ElementHandle.classList.replace('btn-primary','btn-dark');
  btnEdit.ElementHandle.classList.replace('btn-primary','btn-dark');
  btnSettings.ElementHandle.classList.replace('btn-dark','btn-primary');
end;

procedure TForm1.btnViewClick(Sender: TObject);
begin
  pageControlMain.TabIndex := 1;

  asm
    var row = this.tabDocuments.getSelectedRows();
    if (row.length == 1) {
      pas.Unit1.Form1.DocSelect (row[0].getCell('doc_id').getValue());
    };
  end;

  btnView.ElementHandle.classList.replace('btn-dark','btn-primary');
  btnEdit.ElementHandle.classList.replace('btn-primary','btn-dark');
  btnSettings.ElementHandle.classList.replace('btn-primary','btn-dark');
end;

procedure TForm1.DocChanged;
begin
  if Form1.tabDocumentsReady = true then
  begin
    asm
      var row = this.tabDocuments.getSelectedRows();
      if (row.length == 1) {
        var doc = this.suneditorContent.getContents();
        row[0].getCell('doc').setValue(doc);
        divViewer.innerHTML = doc;
        pas.Unit1.Form1.DocSelect(row[0].getCell('doc_id').getValue());
      }
    end;
  end;
end;

procedure TForm1.DocSelect(DocID: String);
var
  Group: String;
  Name: String;
  Doc: String;
begin

  asm
    var row = this.tabDocuments.searchRows('doc_id', '=', DocID);
    if (row.length == 1) {
      Group = row[0].getCell('doc_group').getValue();
      Name = row[0].getCell('doc_name').getValue();
      Doc = row[0].getCell('doc').getValue();
      divViewer.innerHTML = Doc;

      // Apply HighlightJS Styling if any HLJS selectors are found
      hljs.configure({ ignoreUnescapedHTML: true });
      divViewer.querySelectorAll('.HLJS').forEach((el) => {
        el.classList.replace('l-delphi','language-delphi');
        el.classList.replace('l-js','language-js');
        el.classList.replace('l-html','language-html');
        el.classList.replace('l-css','language-css');
        el.classList.replace('l-json','language-json');

        if (el.classList.contains('language-json')) {
          try {
            el.innerHTML = JSON.stringify(JSON.parse(el.innerHTML.replace(/(<br\s*\/?\s*>\s*)+$/,'')),null,2);
          }
          catch {
          }
        }

        el.textContent = el.innerText;
        hljs.highlightElement(el);
      });

      // Apply PrimsJS styling if any are found
      divViewer.querySelectorAll('.PRISM').forEach((el) => {

        var elpre = document.createElement('pre');
        var elcode = document.createElement('code');
        var language = '';
        var fileext = '';

        // Prism doesn't do automatic language detection :(
        if (el.classList.contains('l-delphi')) {
          language = 'language-pascal';
          fileext = 'pas';
        }
        else if (el.classList.contains('l-js')) {
          language = 'language-js';
          fileext = 'js';
        }
        else if (el.classList.contains('l-html')) {
          language = 'language-html';
          fileext = 'html';
        }
        else if (el.classList.contains('l-css')) {
          language = 'language-css';
          fileext = 'css';
        }
        else if (el.classList.contains('l-json')) {
          language = 'language-json';
          fileext = 'json';
        }

        elpre.classList.add(language, 'PRISM', 'line-numbers', 'match-braces', 'rainbow-braces');
        elpre.setAttribute('data-toolbar-order', 'select-code,copy-to-clipboard');
        elpre.setAttribute('data-prismjs-copy','Copy '+fileext.toUpperCase()+' to Clipboard');
        elcode.classList.add(language);

        if (language == 'language-json') {
          try {
            elcode.innerHTML = JSON.stringify(JSON.parse(el.innerHTML.replace(/(<br\s*\/?\s*>\s*)+$/,'')),null,2);
          }
          catch {
            elcode.innerHTML = el.innerHTML;
          }
        }
        else {
          elcode.innerHTML = el.innerHTML;
        }
        elpre.innerHTML = elcode.outerHTML;
        el.outerHTML = elpre.outerHTML;

        Prism.hooks.add("before-highlight", function (env) {
          env.element.innerHTML = env.element.innerHTML.replace(/<br>/g, '\n');
          env.code = env.element.innerText;
        });
      });

      divViewer.querySelectorAll('.PRISM').forEach((el) => {
        Prism.highlightElement(el.firstElementChild);
      });

      divViewer.querySelectorAll('.url-link').forEach((el) => {
        el.setAttribute('target','_blank');
      });

      divViewer.style.width += 1;
      divViewer.style.width -= 1;

      this.suneditorContent.setContents(Doc,false);
      this.suneditorContent.core.history.reset();
      this.suneditorContent.core.context.tool.save.disabled = true;
    }
  end;

  editGroupEdit.Text := Group;
  editNameEdit.Text := Name;
end;

procedure TForm1.editCollectionEditChange(Sender: TObject);
begin
  UpdateTitle(editCollectionEdit.Text);
end;

procedure TForm1.editGroupEditChange(Sender: TObject);
var
  NewGroup: String;
  NewName: String;
begin

  NewGroup := Trim(editGroupEdit.Text);
  NewName := Trim(editNameEdit.Text);

  asm
    var table = this.tabDocuments;
    var row = false;

    if (table.getDataCount() > 0) {
      var rows = table.getSelectedRows();
      if (rows.length > 0) {
        rows[0].getCell('doc_group').setValue(NewGroup);
        rows[0].getCell('doc_name').setValue(NewName);
      }
    }

    // Re-sort the table
    table.setSort([
      {column:"doc_name", dir:"asc"},
      {column:"doc_group", dir:"asc"}
    ]);

    // Groups seem resistant to change?
    table.setGroupBy('');
    table.setGroupBy('doc_group');
    table.redraw(true);

  end;


end;

procedure TForm1.UpdateTitle(Collection: String);
begin
  labelCollection.Caption := Collection;
  Form1.editCollectionEdit.text := Collection;
  Form1.Caption := Collection;
end;

procedure TForm1.btnCloneClick(Sender: TObject);
var
 NewID: String;
 NewGroup: String;
 NewName: String;
 NewDoc: String;
begin

  // To add a new document we'll need to know the name of the current group
  // and the current document so we can insert the new document after the current one.
  // From there, we just add a new blank document.

  NewID := TGUID.NewGUID.ToString;
  NewGroup := 'New Group';
  NewName := 'New Document';
  NewDoc := '';

  asm
    var table = this.tabDocuments;
    var row = false;

    // if a row is already selected, get the group from there
    if (table.getDataCount() > 0) {
      var rows = table.getSelectedRows();
      if (rows.length > 0) {
        row = rows[0].getCell('doc_id').getValue();
        NewGroup = rows[0].getCell('doc_group').getValue();
        NewName = rows[0].getCell('doc_name').getValue();
        NewDoc = rows[0].getCell('doc').getValue();
      }
    }

    // No row selected, so do nothing
    if (row == false) {
      // nope
    }
    // Append after selected row
    else {
      table.addRow({
        doc_id: NewID,
        doc_group: NewGroup,
        doc_name: NewName+' (clone)',
        doc: NewDoc
      }, false, row).then(function(row){
        table.deselectRow();
        table.selectRow(row);
        pas.Unit1.Form1.DocSelect(NewID);

        // Re-sort the table
        table.setSort([
          {column:"doc_name", dir:"asc"},
          {column:"doc_group", dir:"asc"}
        ]);

        // Groups seem resistant to change?
        table.setGroupBy('');
        table.setGroupBy('doc_group');
        table.redraw(true);

      });
    }

  end;

  // We're most likely going to want to edit this.
  btnSettingsClick(Sender);

end;

procedure TForm1.btnDeleteClick(Sender: TObject);
begin
  asm
    var table = this.tabDocuments;
    var row = false;

    if (table.getDataCount() > 0) {
      var rows = table.getSelectedRows();
      var selectrow = false;
      if (rows.length > 0) {
        // Want to highlght a row after deleting this one
        if (rows[0].getNextRow() !== false) {
          selectrow = rows[0].getNextRow();
        }
        else if (rows[0].getPrevRow() !== false) {
          selectrow = rows[0].getPrevRow();
        }

        rows[0].delete();

        if (selectrow !== false) {
          table.selectRow(selectrow);
          pas.Unit1.Form1.DocSelect(selectrow.getCell('doc_id').getValue());
        }
      }
    }

    // Re-sort the table
    table.setSort([
      {column:"doc_name", dir:"asc"},
      {column:"doc_group", dir:"asc"}
    ]);

    // Groups seem resistant to change?
    table.setGroupBy('');
    table.setGroupBy('doc_group');
    table.redraw(true);


  end;
end;

procedure TForm1.WebFormCreate(Sender: TObject);
begin

  // Start out on the View page
  pageControlMain.TabIndex := 1;
  tabDocumentsReady := False;


  //////////////////////////////////////////////////////////////////////////////
  // Custom Tabulator support functions
  //////////////////////////////////////////////////////////////////////////////
  asm

    // Used in BottomCalcs to show unique values rather than "sum" or "count"
    var distinctCount = function(values, data, calcParams) {
                          return new Set(values).size;
                        }

    // Formatter for large integers to include commas
    var commaFormat = function(cell, formatterParams, onRendered) {
                           var el = document.createElement('span');
                           el.innerHTML = cell.getValue().toLocaleString();
                           return el;
                         }

    // Formatter for distinct values to wrap with <em> and also include commas
    // This is so at the bottom of a table you can tell between "count" and "distinct"
    var distinctFormat = function(cell, formatterParams, onRendered) {
                           var el = document.createElement('em');
                           el.innerHTML = cell.getValue().toLocaleString();
                           return el;
                         }
  end;


  //////////////////////////////////////////////////////////////////////////////
  // Document List
  //////////////////////////////////////////////////////////////////////////////
  asm
    this.tabDocuments = new Tabulator("#divDocuments",{
      layout: "fitColumns",
      groupBy: 'doc_group',
      columnCalcs: "table",
      headerVisible: false,
      selectable: 1,
      index: "doc_id",
      groupToggleElement: "header",
      layoutColumnsOnNewData: true,
      columnHeaderSortMulti: true,
      clipboard: "copy",
      placeholder: 'No Documents',
      columnDefaults: {
        headerSortTristate: true,
        resizable: false,
        download: true
      },
      initialSort: [{column:"doc_name", dir:"asc"},{column:"doc_group", dir:"asc"}],
      columns: [
        { title: "ID", field: "doc_id", visible: false },
        { title: "Collection", field: "doc_collection", visible: false },
        { title: "Group", field: "doc_group", visible: false },
        { title: "Name", field: "doc_name", bottomCalc: "count", bottomCalcFormatter: commaFormat },
        { title: "Doc", field: "doc", visible: false }
      ]
    });
    this.tabDocuments.on('rowClick', function(e,row) {
      row.select();
      pas.Unit1.Form1.DocSelect(row.getCell("doc_id").getValue());
    });
    this.tabDocuments.on('tableBuilt', function() {
      pas.Unit1.Form1.tabDocumentsReady = true;

      // Load up the examples
      fetch('Example.documents')
      .then(
        function(response) {
          if (response.status !== 200) {
            console.log('Error encountered. Status Code: ' +response.status);
          }
          response.json().then(function(data) {
            var table = pas.Unit1.Form1.tabDocuments;
            table.setData(data);

            // Re-sort the table
            table.setSort([
              {column:"doc_name", dir:"asc"},
              {column:"doc_group", dir:"asc"}
            ]);

            // Groups seem resistant to change?
            table.setGroupBy('');
            table.setGroupBy('doc_group');
            table.redraw(true);

            var rows = table.getRows();
            if (rows.length > 0) {
              rows[0].select();
              var Collection = rows[0].getCell('doc_collection').getValue();
              pas.Unit1.Form1.UpdateTitle(Collection);
              pas.Unit1.Form1.DocSelect(rows[0].getCell('doc_id').getValue());
            }
          });
        }
      )
      .catch(function(err) {
        console.log('Fetch Error :-S', err);
      });

    });
  end;


  //////////////////////////////////////////////////////////////////////////////
  // InteractJS: https://interactjs.io
  //////////////////////////////////////////////////////////////////////////////
  asm
    interact('.RightSplitter')
      .resizable({
        edges: { right: '.ResizeElement' },
        listeners: {
          move (event) {
            var target = event.target;
            target.style.width = event.rect.width + 'px';
          }
        }
      });
  end;


  //////////////////////////////////////////////////////////////////////////////
  // HTML Editor (SunEditor + CodeMirror + Katex)
  //////////////////////////////////////////////////////////////////////////////
  asm
    var SunEditorDefaultOptions = {
      mode: "classic",
      resizingBar: true,
      charCounter: true,
      charCounterLabel: "Character Count: ",
      showPathLabel: true,
      addTagsWhitelist: "i|svg|label|input|select|option|textarea",
      attributesWhitelist: {
        input: "type|id|maxlength|value|name|style|class",
        label: "id|for|style|class",
        textarea: "id|maxlength|rows|cols|style|class|resize"
      },
      previewTemplate: '<div id="suneditorPreview" class="sun-editor line-numbers sun-editor-editable" style="width:auto; max-width:1080px; background:white; margin:auto;">{{contents}}</div>'+
        '<script src="https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.7.0/build/highlight.min.js"></script>'+
        '<script src="https://cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.7.0/build/languages/delphi.min.js"></script>'+
        '<script src="https://cdn.jsdelivr.net/npm/prismjs@1.29.0/prism.min.js" data-manual></script>'+
        '<script src="https://cdn.jsdelivr.net/npm/prismjs@1.29.0/components/prism-css.min.js"></script>'+
        '<script src="https://cdn.jsdelivr.net/npm/prismjs@1.29.0/components/prism-json.min.js"></script>'+
        '<script src="https://cdn.jsdelivr.net/npm/prismjs@1.29.0/components/prism-markup.min.js"></script>'+
        '<script src="https://cdn.jsdelivr.net/npm/prismjs@1.29.0/components/prism-pascal.min.js"></script>'+
        '<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/prismjs@1.29.0/themes/prism-coy.min.css">'+
        '<script src="https://cdn.jsdelivr.net/npm/prismjs@1.29.0/plugins/line-numbers/prism-line-numbers.min.js"></script>'+
        '<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/prismjs@1.29.0/plugins/line-numbers/prism-line-numbers.min.css">'+
        '<script>'+
           'hljs.configure({ ignoreUnescapedHTML: true });'+
           'document.querySelectorAll(".HLJS").forEach((el) => {'+
             'el.classList.replace("l-delphi","language-delphi");'+
             'el.classList.replace("l-js","language-js");'+
             'el.classList.replace("l-html","language-html");'+
             'el.classList.replace("l-css","language-css");'+
             'el.classList.replace("l-json","language-json");'+
             'if (el.classList.contains("language-json")) {'+
             'try {'+
               'el.innerHTML = JSON.stringify(JSON.parse(el.innerHTML.replace(/(<br\\s*\\/?\\s*>\\s*)+$/,"")),null,2);'+
             '} catch {}}'+
             'el.textContent = el.innerText;'+
             'hljs.highlightElement(el);'+
           '});'+
           'document.querySelectorAll(".PRISM").forEach((el) => {'+
              'var elpre = document.createElement("pre");'+
              'var elcode = document.createElement("code");'+
              'if (el.classList.contains("l-delphi")) {'+
                'elpre.classList.add("language-pascal", "PRISM");'+
                'elcode.classList.add("language-pascal");'+
              '}'+
              'else if (el.classList.contains("l-js")) {'+
                'elpre.classList.add("language-js", "PRISM");'+
                'elcode.classList.add("language-js");'+
              '}'+
              'else if (el.classList.contains("l-html")) {'+
                'elpre.classList.add("language-html", "PRISM");'+
                'elcode.classList.add("language-html");'+
              '}'+
              'else if (el.classList.contains("l-css")) {'+
                'elpre.classList.add("language-css", "PRISM");'+
                'elcode.classList.add("language-css");'+
              '}'+
              'else if (el.classList.contains("l-json")) {'+
                'elpre.classList.add("language-json", "PRISM");'+
                'elcode.classList.add("language-json");'+
              '}'+
              'if (elcode.classList.contains("language-json")) {'+
                'try {'+
                  'elcode.innerHTML = JSON.stringify(JSON.parse(el.innerHTML.replace(/(<br\\s*\\/?\\s*>\\s*)+$/,"")),null,2);'+
                '}'+
                'catch {'+
                  'elcode.innerHTML = el.innerHTML;'+
                '}'+
              '}'+
              'else {'+
                'elcode.innerHTML = el.innerHTML;'+
              '}'+
              'elpre.innerHTML = elcode.outerHTML;'+
              'el.outerHTML = elpre.outerHTML;'+
              'Prism.hooks.add("before-highlight", function (env) {'+
                'env.element.innerHTML = env.element.innerHTML.replace(/<br>/g, "\\n");'+
                'env.code = env.element.innerText;'+
              '});'+
            '});'+
            'document.querySelectorAll(".PRISM").forEach((el) => {'+
              'Prism.highlightElement(el.firstElementChild);'+
            '});'+
        '</script>',
      formats: ['p','div','blockquote','pre','h1','h2','h3','h4','h5','h6',
        { tag: 'pre', // Tag name
          name: 'HighlightJS',
          command: 'replace',
          class: 'se-code-language HLJS'
        },
        { tag: 'pre', // Tag name
          name: 'PrismJS-Delphi',
          command: 'replace',
          class: 'se-code-language PRISM l-delphi'
        },
        { tag: 'pre', // Tag name
          name: 'PrismJS-JS',
          command: 'replace',
          class: 'se-code-language PRISM l-js'
        },
        { tag: 'pre', // Tag name
          name: 'PrismJS-HTML',
          command: 'replace',
          class: 'se-code-language PRISM l-html'
        },
        { tag: 'pre', // Tag name
          name: 'PrismJS-CSS',
          command: 'replace',
          class: 'se-code-language PRISM l-css'
        },
        { tag: 'pre', // Tag name
          name: 'PrismJS-JSON',
          command: 'replace',
          class: 'se-code-language PRISM l-json'
        }
      ],
      codeMirror: window.CodeMirror,
      katex: katex,
      font: [
        'Roboto',
        'Roboto Condensed',
        'Cairo',
      ],
      buttonList: [
        ['undo', 'save', 'redo'],
        ['fullScreen','showBlocks', 'codeView', 'preview','print'],
        ['font', 'fontSize', 'formatBlock'],
        ['paragraphStyle', 'blockquote','horizontalRule'],
        ['bold', 'underline', 'italic', 'strike', 'subscript', 'superscript', 'math'],
        ['fontColor', 'hiliteColor', 'textStyle', 'removeFormat'],
        ['list', 'outdent', 'indent', 'align', 'lineHeight'],
        ['table', 'link', 'image', 'video', 'audio'],
      ],
      icons: {
        undo: '<span><i class="fas fa-undo"></i></span>',
        save: '<span class="HTMLSave" style="margin: -2px 0px 0px -2px; font-size:24px;"><i class="fas fa-check"></i></span>',
        redo: '<span><i class="fas fa-redo"></i></span>',

        paragraph_style: '<span><i class="fas fa-paragraph"></i></span>',
        blockquote: '<span><i class="fas fa-quote-left"></i></span>',
//        horizontal_rule: '<span><i class="fas fa-horizontal-rule"></i></span>',

        bold: '<span><i class="fas fa-bold"></i></span>',
        underline: '<span><i class="fas fa-underline"></i></span>',
        italic: '<span><i class="fas fa-italic"></i></span>',
        strike: '<span><i class="fas fa-strikethrough"></i></span>',
        subscript: '<span><i class="fas fa-subscript"></i></span>',
        superscript: '<span><i class="fas fa-superscript"></i></span>',
        math: '<span><i class="fas fa-square-root-variable"></i></span>',

        font_color: '<span><i class="fas fa-pen-nib"></i></span>',
        highlight_color: '<span><i class="fas fa-highlighter"></i></span>',
//        text_style: '<span><i class="fas fa-text"></i></span>',
        erase: '<span><i class="fas fa-eraser"></i></span>',

        list_bullets: '<span><i class="fas fa-list"></i></span>',
        list_number: '<span><i class="fas fa-list-ol"></i></span>',
        outdent: '<span><i class="fas fa-outdent"></i></span>',
        indent: '<span><i class="fas fa-indent"></i></span>',
        align_left: '<span><i class="fas fa-align-left"></i></span>',
        align_right: '<span><i class="fas fa-align-right"></i></span>',
        align_justify: '<span><i class="fas fa-align-justify"></i></span>',
        align_center: '<span><i class="fas fa-align-center"></i></span>',
        line_height: '<span><i class="fas fa-text-height"></i></span>',

        table: '<span><i class="fas fa-table"></i></span>',
        link: '<span><i class="fas fa-link"></i></span>',
        image: '<span><i class="fas fa-image"></i></span>',
        video: '<span><i class="fas fa-video"></i></span>',
        audio: '<span><i class="fas fa-microphone"></i></span>',

        expansion: '<span><i class="fas fa-expand"></i></span>',
        reduction: '<span><i class="fas fa-compress"></i></span>',
        show_blocks: '<span><i class="fas fa-tasks-alt"></i></span>',
        code_view: '<span><i class="fas fa-code"></i></span>',
        print: '<span><i class="fas fa-print"></i></span>'
      }
    };

    SunEditorDefaultOptions["toolbarContainer"] = "#divContentHeader";
    SunEditorDefaultOptions["resizingBarContainer"] = "#divContentFooter";
    this.suneditorContent = SUNEDITOR.create('divContentText', SunEditorDefaultOptions );
    this.suneditorContent.onSave = function(contents, core) { pas.Unit1.Form1.DocChanged(null); };
    this.suneditorContent.setContents('');
  end;


  // Custom Prism Button!
  asm
    Prism.plugins.toolbar.registerButton('select-code', function(env) {
    	var button = document.createElement('button');
    	button.innerHTML = 'Select All';
    	button.addEventListener('click', function () {
    		// Source: http://stackoverflow.com/a/11128179/2757940
    		if (document.body.createTextRange) { // ms
    			var range = document.body.createTextRange();
    			range.moveToElementText(env.element);
    			range.select();
     		} else if (window.getSelection) { // moz, opera, webkit
    			var selection = window.getSelection();
    			var range = document.createRange();
    			range.selectNodeContents(env.element);
    			selection.removeAllRanges();
    			selection.addRange(range);
        }
  	  });
   	  return button;
	  });
  end;

end;



end.