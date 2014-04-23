cat $1|sed -n '/[[:space:]]*<body>/,/[ \t]*<\/body>/ p'|sed '/^[[:space:]]*<body>/ d;/^[[:space:]]*<\/body>/d'|sed 's/^[[:space:]]*//g'|wc -w
