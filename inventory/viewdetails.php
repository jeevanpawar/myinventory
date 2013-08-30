<?php
include("../session/session.php");
error_reporting(0);
include("../include/database.php");
$id=$_REQUEST['id'];

$qry="select * from sub_stock where st_id='$id'";
$res=mysql_query($qry);

?>

<html>
<head>
<title>Shri Lal Bharti Food Product</title>
<link rel="stylesheet" href="../styles2.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/style.css" media="screen" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="custom.js"></script>
</head>
<body>
		<div id="container">
	 	<div id="sub-header">
    	<?php
			include("include/p_header.php");
		?>
       	<div>
        <table class="emp_tab">
        <tr class="search_res">
        <td class="info">
        <center>View Stock Details <?php echo $row_s[1]; ?></center>
        </td>
        </tr>
        </table>
        <br>
        <table class="detail">
        <tr class="menu_header">
        <td >Stock Name</td>
        <td width="150">Bag/Box</td>
        <td width="180">Kg</td>
        <td width="150">Total</td>
        <td width="150">Amount</td>
        </tr>
        <?php
		while($row_d=mysql_fetch_array($res))
		{
			echo "<tr class='pagi'>";
			echo "<td>";
			echo $row_d[4];
			echo "</td>";
			echo "<td>";
			echo $row_d[5];
			echo "</td>";
			echo "<td>";
			echo $row_d[6];
			echo "</td>";
			echo "<td>";
			echo $row_d[7];
			echo "</td>";
			echo "<td>";
			echo $row_d[8].'&nbsp;'.'Rs/-';
			echo "</td>";
			echo "</tr>";
		}
		?>
        
        </table>
       
        
        </div>
        </div>
    </div>
    </div>
        
    <div id="fade"></div>
    	<div class="clear"></div>
    </div>
</div>
 <div id="footer">
     <div class="clear"></div> 
    </div>
    </div>
</body>
</html>
