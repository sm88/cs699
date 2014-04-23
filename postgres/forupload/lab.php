<!DOCTYPE HTML>
<html>
<head>
    <title>The Final Assignment(PHP+PostgreSQL)... Why not mysql??</title>
    <style type="text/css">
        body{
            font-family: helvetica;
        }
        #rows{
            border: 1px solid black;
            border-bottom: 0px;
            text-align: center;
            margin: 0 auto;
            width:75%;
            border-collapse: collapse;
        }
        #rows td,th{
            border-bottom: 1px;
            border-top: 0px;
            border-left: 0px;
            border-right: 1px;
            border-style: solid;
            border-color: black;
        }
        h4{
            border: 1px solid black;
            background-color: #575757;
            color: #38C0F4;
            padding: 1px;
        }
        #err{
            font-family:"courier new";
            color:red;
            size:12px;
        }
    </style>
</head>
<body>
<?php
#echo "Hello World!"
#connect to postgre
#echo phpinfo();
$err = array("rollno"=>"","pass"=>"","status"=>"");
$markstable="";
$dbconn = pg_connect("host=localhost dbname=marks_db user=postgres")
    or die('Could not connect to marks_db: ' . pg_last_error());
$query = "SELECT * FROM users";
$result = pg_query($dbconn,$query);
$no_of_rows_table = "".
    "<table id='rows'>\n".
    "\t<tr>\n".
    "\t\t<th>Table</th><th>Rows</th>\n".
    "\t</tr>\n".
    "\t<tr>\n".
    "\t\t<td>users</td><td>" . pg_num_rows($result) . "</td>\n".
    "\t</tr>\n".
    "\t<tr>\n".
    "\t\t<td>marks</td><td>" . pg_num_rows($result) . "</td>\n".
    "\t</tr>\n".
    "</table>";

#login
if(isset($_POST['subbut'])){
    $roll = $_POST['rollno'];
    $pass = $_POST['pass'];
    if(strcmp($roll,"")==0){
        $err['rollno']="<span id='err'>Roll no not supplied!</span>";
    }
    if(strcmp($pass,"")==0){
        $err['pass']="<span id='err'>Password not supplied!</span>";
    }
    $query = "select roll_no from users where roll_no='".addslashes($roll)."' and password='".addslashes($pass)."'";
    $result = pg_query($dbconn,$query);
    if(pg_num_rows($result)!=1){
        $err['status']="<span id='err'>Roll no/Password invalid!</span>";
    }
    else{
        if(strcmp($roll,'133059007')==0){
            //admin
            $query="select roll_no, quiz1, midsem, quiz2, project, endsem from marks where roll_no!='".addslashes($roll)."'";
            $result = pg_query($dbconn,$query);
            $markstable="<h4>Marks of all students</h4>\n<table id='rows'>\n".
                "\t<tr>\n".
                "\t\t<th>Roll No</th><th>Quiz 1</th><th>Midsem</th><th>Quiz 2</th><th>Project</th><th>Endsem</th>\n".
                "\t</tr>\n";
            while($line=pg_fetch_array($result)){
                $markstable=$markstable.
                "\t<tr>\n".
                "\t\t<td>".$line['roll_no']."</td><td>".$line['quiz1']."</td><td>".$line['midsem']."</td><td>".$line['quiz2']."</td><td>".$line['project']."</td><td>".$line['endsem']."</td>\n".
                "\t</tr>\n";
            }
            $markstable=$markstable."</table>";
        }
        else{
            $query = "select quiz1, midsem, quiz2, project, endsem from marks where roll_no='".addslashes($roll)."'";
            $result = pg_query($dbconn,$query);
            if(pg_num_rows($result)==0){
                $err['status']="<span id='err'>Marks not entered!</span>";
            }
            else{
                $line = pg_fetch_array($result);
                $markstable="<h4>Marks of ".$roll."</h4>\n<table id='rows'>\n".
                    "\t<tr>\n".
                    "\t\t<th>Quiz 1</th><th>Midsem</th><th>Quiz 2</th><th>Project</th><th>Endsem</th>\n".
                    "\t</tr>\n";
                $markstable=$markstable."\t<tr>\n".
                    "\t\t<td>".$line[0]."</td><td>".$line[1]."</td><td>".$line[2]."</td><td>".$line[3]."</td><td>".$line[4]."</td>\n".
                    "\t</tr>\n".
                    "</table>";
            }
        }
    }
}
?>
<h4>No. of rows in tables</h4>
<?php echo $no_of_rows_table;?>
<h4>User login</h4>
<form name="userlogin" id="userlogin" method="post" action="lab.php">
<fieldset>
<legend>Credentials</legend>
<table>
    <tr>
    <td>Roll Number:</td><td><input type="text" name="rollno" id="rollno" maxlength="24" value="<?php echo $_POST['rollno']?>"/></td><td><?php echo $err['rollno'];?></td>
    </tr>
    <tr>
    <td>Password:</td><td><input type="password" name="pass" id="pass" maxlength="24" value="<?php $_POST['pass'];?>"/></td><td><?php echo $err['pass'];?></td>
    </tr>
    <tr>
        <td colspan='3'><input type="submit" name="subbut" id="subbut" value="Submit" /></td>
    </tr>
<?php 
if(strcmp($err['status'],"")!=0){
      $statrow="\t<tr>\n".
          "\t\t<td colspan='3'>". $err['status'] . "</td>\n".
          "\t</tr>\n";
      echo $statrow;    
}
?>
</table>
</fieldset>
</form>
<?php echo $markstable;?>
</body>
</html>
