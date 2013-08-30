<?php
include("../session/session.php");
error_reporting(0);
include("../include/database.php");
$per_page = 19; 
if($_GET)
{
$page=$_GET['page'];

}
$start = ($page-1)*$per_page;
$qry_u="select * from stock order by st_id desc limit $start,$per_page";
$res_u=mysql_query($qry_u);
?>
        <table class="emp_tab">
        <tr class="menu_header">
        <td width="200">Date</td>
        <td>Supplier Name</td>
        <td width="150">Amount</td>
        <td width="150">View</td>
        </tr>
        <?php
		while($row_u=mysql_fetch_array($res_u))
		{
		$qry_st="select SUM(st_amt) from sub_stock where st_id='$row_u[0]'";
		$res_st=mysql_query($qry_st);
		$row_st=mysql_fetch_array($res_st);
		echo "<tr class='pagi'>";
        echo "<td>";
		echo $row_u[1];
		echo "</td>";
		echo "<td>";
		echo $row_u[2];
		echo "</td>";
		echo "<td>";
		echo $row_st[0];
		echo "</td>";
		echo "<td>";
		echo "<a href='viewdetails.php?id=$row_u[0]' class='print'>Details</a>";
		echo "</td>";
		
		}
		?>
        
        </table>
        
      
