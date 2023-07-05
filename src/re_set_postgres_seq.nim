import NiGui
import std/db_postgres

include "sql/get_all_sequence.tmpl"
include "sql/reset_seq.tmpl"

app.init()

var window = newWindow()
window.width = 800
window.height = 500

var mainContainer = newLayoutContainer(Layout_Vertical)
window.add(mainContainer)

var topContainer = newLayoutContainer(Layout_Vertical)
mainContainer.add(topContainer)

# 接続情報
var labelHost = newLabel("HOST")
var textBoxHost = newTextBox("localhost")
var labelUser = newLabel("User")
var textBoxUser = newTextBox("")
var labelPassword = newLabel("Password")
var textBoxPassword = newTextBox("")
var labelDatabase = newLabel("Database")
var textBoxDatabase = newTextBox("")
var buttonConnection = newButton("Connection")
var textAreaSqlOutput = newTextArea("")
topContainer.add(labelHost)
topContainer.add(textBoxHost)
topContainer.add(labelUser)
topContainer.add(textBoxUser)
topContainer.add(labelPassword)
topContainer.add(textBoxPassword)
topContainer.add(labelDatabase)
topContainer.add(textBoxDatabase)
topContainer.add(buttonConnection)
topContainer.add(textAreaSqlOutput)

#
# Connection button is clicked
#
buttonConnection.onClick = proc(event: ClickEvent) =
  let host = textBoxHost.text
  let user = textBoxUser.text
  let password = textBoxPassword.text
  let database = textBoxDatabase.text

  var db: DbConn
  try:
    db = open(host, user, password, database)
  except:
     window.alert("Postgres connection error")
     return

  let seqList = db.getAllRows(sql(getSequenceList()))
  for sequence in seqList:
    let sql = resetSequenceId(sequence[2], sequence[1], sequence[0])
    textAreaSqlOutput.addText(sql)
    textAreaSqlOutput.addLine()

  db.close()

window.show()
app.run()
