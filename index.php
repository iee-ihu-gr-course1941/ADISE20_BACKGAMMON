<!DOCTYPE html>
<html>
<head>
    <title>Dice</title>
</head>
<body>
<div align = "center" >

<form action="index.php" method="post">
  <input type="submit" value="dice" name="dice"/>


</form>

<?php
$dice1=rand(1,6);
$dice2=rand(1,6);

if($_POST){
    echo "<br> " , "<img src='img/$dice1.png'>";

}
if($_POST){
  echo "<br> " , "<img src='img/$dice2.png'>";

}

?>

</body>
</html>