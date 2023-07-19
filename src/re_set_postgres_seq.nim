import NiGui
import std/db_postgres

include "sql/get_all_sequence.tmpl"
include "sql/reset_seq.tmpl"

app.init()

var window = newWindow()
window.width = 800
window.height = 500

var mainContainer = newContainer()
window.add(mainContainer)

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
mainContainer.add(labelHost)
mainContainer.add(textBoxHost)
mainContainer.add(labelUser)
mainContainer.add(textBoxUser)
mainContainer.add(labelPassword)
mainContainer.add(textBoxPassword)
mainContainer.add(labelDatabase)
mainContainer.add(textBoxDatabase)
mainContainer.add(buttonConnection)
mainContainer.add(textAreaSqlOutput)

labelHost.x = 5
labelHost.y = 5
labelHost.width = 300
labelHost.height = 21

textBoxHost.x = 5
textBoxHost.y = 35
textBoxHost.width = 300
textBoxHost.height = 21

labelUser.x = 350
labelUser.y = 5
labelUser.width = 100
labelUser.height = 21

textBoxUser.x = 350
textBoxUser.y = 35
textBoxUser.width = 100
textBoxUser.height = 21

labelPassword.x = 500
labelPassword.y = 5
labelPassword.width = 100
labelPassword.height = 21

textBoxPassword.x = 500
textBoxPassword.y = 35
textBoxPassword.width = 100
textBoxPassword.height = 21

labelDatabase.x = 650
labelDatabase.y = 5
labelDatabase.width = 100
labelDatabase.height = 21

textBoxDatabase.x = 650
textBoxDatabase.y = 35
textBoxDatabase.width = 100
textBoxDatabase.height = 21

buttonConnection.x = 250
buttonConnection.y = 70
buttonConnection.width = 300
buttonConnection.height = 35

textAreaSqlOutput.x = 5
textAreaSqlOutput.y = 120
textAreaSqlOutput.width = 770
textAreaSqlOutput.height = 330

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
