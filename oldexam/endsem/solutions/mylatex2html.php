<html>
<body>
<?php
$PATH_TO_MYLATEX2HTML="/home/br/teaching/cs699-autumn2011/exams/endsem/solutions/mylatex2html";
if ($_FILES["file"]["error"] > 0) {
  echo "Error: " . $_FILES["file"]["error"] . "<br />";
} else {
  if($_FILES["file"]["size"] <= (1024*64)) {
    echo "<h2>Upload Success</h2>";
    echo "Upload: " . $_FILES["file"]["name"] . "<br />";
    echo "Type: " . $_FILES["file"]["type"] . "<br />";
    echo "Size: " . ($_FILES["file"]["size"]) . " Bytes<br />";
    $md5str = md5_file($_FILES["file"]["tmp_name"]);
    echo "Check md5sum: $md5str<br />";
    $cmd = $PATH_TO_MYLATEX2HTML . " < " . $_FILES["file"]["tmp_name"];
    $output = shell_exec($cmd);
    echo "<h2>Table is below</h2>";
    echo $output;
  } else {
    echo "<h2>Upload failure</h2>";
    echo "Upload file has to be named hp-stats.py or Makefile and less than 64KB size<br />";
  }
}
?>

<address>
Based upon code from: http://www.w3schools.com/php/php_file_upload.asp
</address>

</body>
</html>
