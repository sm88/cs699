1,/BEGIN.*DONT_ERASE_04/ d
/END.*DONT_ERASE_04/,$ d
/^[ \t]*print/ d
/^[ \t]*#/ d
/^[ \t]*$/ d
/^[ \t]*None[ \t]*$/ d
