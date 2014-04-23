BEGIN {
    FS = ","
}
{
    if ( $4 ~ /from=/ ) {
	logid = $3
	from = substr($4, 7)
	size = substr($5, 7)
    }
    if ( ($4 ~ /to=/) && (logid == $3) ) {
	to = substr($4, 5)
	numrecd[to]++
    }
}
END {
    for (to in numrecd)
	print to, numrecd[to]
}
