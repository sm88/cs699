BEGIN {
    FS = ","
}
{
    if ( $5 ~ /size=/ ) {
	size = substr($5, 7)
	totbytes += size
    }
}
END {
    print totbytes
}
