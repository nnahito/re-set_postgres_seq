# Package

version       = "0.1.0"
author        = "nnahito"
description   = "re-set_postgres_seq"
license       = "MIT"
srcDir        = "src"
bin           = @["re_set_postgres_seq"]


# Dependencies

requires "nim >= 2.0.0"
requires "https://github.com/simonkrauter/NiGui"
requires "db_connector"
