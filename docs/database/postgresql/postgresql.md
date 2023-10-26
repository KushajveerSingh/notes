## Introduction

Convention

- `[ ]` - optional parts
- `{ }`, `a | b` - choose one alternative
- `...` - preceding element can be repeated
- `=>` - sql commands
- `$` - shell commands

Postgres uses client/server model
- Server process - `postgres` program manages database files, accepts connections to the database from client applications, and performs database actions on behalf of the clients. 
- Client application - that wants to perform database opeartions. In case client/server are on different host TCP/IP is used.
- To handle concurrent connections from the clients, the server "forks" a new process for each connection, and `postgres` main process hands all the responsibilities to this process for the client.

## SQL Syntax

### Lexical Structure

Keywords

- Like `SELECT`, `UPDATE` that have a fixed meaning in SQL language.
- Case-insensitive.

Identifier (also called anmes)

- Like table name, column name.
- Unquoted identifiers are case-insensitive (convention is to use lower case).

Naming convention for keyword, identifer

- Start with `a-z` or `_` and then can use letters, underscore, digits, dollar sign (to make SQL more portable avoid using dollar sign).
- The max length is `NAMEDATALEN-1` bytes (63 by default). Longer names would automatically be truncated. Can be adjusted by changing `NAMEDATALEN` in `src/include/pg_config_manual.h`.
