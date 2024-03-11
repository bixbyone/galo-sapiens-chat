#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <libpq-fe.h>
#include <microhttpd.h>
#include <regex.h>
#include <time.h>
#include <ctype.h>
#include <pthread.h>
#include <signal.h>
#include <cJSON.h>

// Include SQLite header
#include <sqlite3.h>

// Include C++ headers for SQLite
#include <iostream>
#include <string>

// Include the C++ API file
#include "api.cpp"

// Rest of the code...