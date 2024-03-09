import std/times
import uing
import db_connector/db_postgres

include "sql/get_all_sequence.tmpl"
include "sql/reset_seq.tmpl"

var window: Window
var dbHostEntry = newEntry()
var dbUserEntry = newEntry()
var dbPasswordEntry = newPasswordEntry()
var dbDatabaseEntry = newEntry()

var entry: MultilineEntry

proc getTableList(_: Button) =
  var db: DbConn
  let host = dbHostEntry.text
  let user = dbUserEntry.text
  let password = dbPasswordEntry.text
  let database = dbDatabaseEntry.text

  try:
    db = open(host, user, password, database)
  except:
     window.msgBox("ERROR", "Postgres connection error")
     return

  let seqLiast = db.getAllRows(sql(getSequenceList()))

proc addEntryIei(_: Button) =
  entry.add "Saying something\n"

proc sayTime(): bool =
  entry.add now().format("ddd MMM d HH:mm:ss UUUU") & '\n'

  return true

proc main =
  window = newWindow("Re-Set Postgresql Sequences", 512, 300)
  window.margined = true

  # 縦向きのレスポンシブボックスの作成
  let vbox = newVerticalBox(true)
  window.child = vbox

  # DB接続周りのUI作成
  let hbox = newHorizontalBox()
  hbox.add newLabel("接続先：")
  hbox.add dbHostEntry
  hbox.add newLabel("ユーザ：")
  hbox.add dbUserEntry
  hbox.add newLabel("パスワード：")
  hbox.add dbPasswordEntry
  hbox.add newLabel("スキーマ：")
  hbox.add dbDatabaseEntry
  vbox.add hbox
  vbox.add newButton("接続", getTableList)

  let btn = newButton("Say Something", addEntryIei)
  vbox.add btn

  entry = newMultilineEntry()
  entry.readonly = true
  vbox.add entry, true

  timer(1000, sayTime)

  show window
  mainLoop()

init()
main()
