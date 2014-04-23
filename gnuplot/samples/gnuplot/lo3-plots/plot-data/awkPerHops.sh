awk -F' ' '
BEGIN{
total = 0;
}
{
	calls[$1]++;
	total++;
}
END{
	for(i=3; i < 11; i++)
	{
		printf("\n %d %d",i,calls[i]);
	}
}' $1

