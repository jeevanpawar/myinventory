<?php
include("../session/session.php");

include("../include/database.php");
$per_page = 19;

$sql = "select * from stock";
$rsd = mysql_query($sql);
$count = mysql_num_rows($rsd);
$pages = ceil($count/$per_page);

?>
<?php
$qry_s="select * from stock";
$res_s=mysql_query($qry_s);

$qry_c="select * from suppliers";
$res_c=mysql_query($qry_c);

$qry_sd="select * from stock_detail";
$res_sd=mysql_query($qry_sd);

?>
<?php
	if(isset($_REQUEST['submit']))
	{
		$t1=date('Y-m-d', strtotime($_POST['t1']));
		$t2=$_POST['t2'];
		$qry_b="insert into stock(st_date,sup_name) values('".$t1."','".$t2."')";
		$res_b=mysql_query($qry_b);
		$m_id=mysql_insert_id();
		$dd=$_POST['pr'];
		$ed = count($dd);
		for($i=0; $i<$ed; $i++)
		{		
		    $p1=$_POST['pr'][$i];
			$p2=$_POST['qnt'][$i];
			$p3=$_POST['r'][$i];
			$p4=$_POST['value'][$i];
			$p5=$_POST['amt'][$i];
			$qry_p="insert into sub_stock(st_id,sb_date,sb_name,st_name,st_bag,st_kg,st_total,st_amt) values('".$m_id."','".$t1."','".$t2."','".$p1."','".$p2."','".$p3."','".$p4."','".$p5."')";
			$res_p=mysql_query($qry_p);
			
			$qry_stock="select * from stock_detail where stock_name='$p1'";
			$res_stock=mysql_query($qry_stock);
			$row_stock=mysql_fetch_array($res_stock);
			
			$qry_up="update stock_detail SET stock_bag='".$p2."' + $row_stock[1], stock_kg='".+$p3."' + $row_stock[2], total_kg='".+$p4."' + $row_stock[3] where stock_name='$p1'";
			$res_up=mysql_query($qry_up);
		}
		
		if($res_b)
		{
			header("location:purchase.php");
		}
		else
		{
			echo "error";
		}
	}
	if(isset($_REQUEST['can']))
	{
		header("location:sale.php");
	}
?>

<html>
<head>
<title>Shri Lal Bharti Food Product</title>
<link rel="stylesheet" href="../styles2.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/style.css" media="screen" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="js/addrow.js"></script>
<script type="text/javascript" src="custom.js"></script>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/slider.js"></script>
<script type="text/javascript" src="../js/superfish.js"></script>
<script type="text/javascript" src="../js/toword.js"></script>
<script>
var total = 0;
function getValues() {
var qty = 0;
var rate = 0;
var obj = document.getElementsByTagName("input");
      for(var i=0; i<obj.length; i++){
         if(obj[i].name == "qnt[]")
		 {
			 var qty = obj[i].value;
			
		}
         if(obj[i].name == "r[]")
		 {
			 var rate = obj[i].value;
		 }
         if(obj[i].name == "value[]")
		 {
          		if(qty > 0 && rate > 0)
				{
					obj[i].value = qty*rate;
					total+=(obj[i].value*1);
				}
				else
				{
					obj[i].value = 0;
				    total+=(obj[i].value*1);
				}
          }
       
		 }
		 var tax =document.getElementById("stax").value;
		 var vat =document.getElementById("vat").value;
		 var add=total*1;
		 add+=(tax*1);
		  add+=(vat*1);		 
        document.getElementById("total").value = add;
		var words = toWords(add);
		document.getElementById("word").innerHTML=words;
        total=0;
}

</script>
	<script type="text/javascript">
	
	$(document).ready(function(){
		
	//Display Loading Image
	function Display_Load()
	{
	    $("#loading").fadeIn(900,0);
	
	}
	//Hide Loading Image
	function Hide_Load()
	{
		$("#loading").fadeOut('slow');
	};
	

    //Default Starting Page Results
   
	$("#pagination li:first").css({'color' : '#FF0084'}).css({'border' : 'none'});
	
	Display_Load();
	
	$("#content").load("parchasepagination.php?page=1", Hide_Load());



	//Pagination Click
	$("#pagination li").click(function(){
			
		Display_Load();
		
		//CSS Styles
		$("#pagination li")
		.css({'color' : '#0063DC'});
		
		$(this)
		.css({'color' : '#FF0084'})
		.css({'border' : 'none'});

		//Loading Data
		var pageNum = this.id;
		
		$("#content").load("parchasepagination.php?page=" + pageNum, Hide_Load());
	});
	
	
});
	</script>
</head>
<body>
<div id="container">
<div id="sub-header">
		<?php
		   include("include/p_header.php");
		?>
        
       	<table class="emp_tab">
        <tr class="search_res">
        <td class="info">
        <span class="newbook"><a href="#" rel="popuprel" class="popup new">New Stock</a> </span>
        </td>
        </tr>
        </table>
        <div class="popupbox_small" id="popuprel">
		<div id="intabdiv">
        <h2>New Stock</h2>
                
                <form action="" method="post" name="po">
                <table class="sale">
                <tr>
                <td>Date:</td>
                <td><input type="text" name="t1" class="q_in" value="<?php echo date('d-m-Y'); ?>"></td>
                <td>Select Suppliers:</td>
                <td>
                <select name="t2">
                <?php
				while($row_c=mysql_fetch_array($res_c))
				{
					echo "<option>";
					echo $row_c[1];
					echo "</option>";
				}
				?>
                </select>
                </td>
                </tr>
                </table>
                <br><br>
                <table class="des">
                <tr class="menu_header">
                <td width="2%">S</td>
                <td width="38%">Stock Name</td>
                <td width="15%">Stock In(Bag)</td>
                <td width="15%">Stock In(Kg)</td>
                <td width="15%">Total Stock In(Kg)</td>
                <td width="15%">Amount</td>
                </tr>
                <div class="adddel">
       			<input type="button" value="+" class="add" onClick="addRow('dataTable');add();" >&nbsp;
		 		<input type="button" value="-" class="add" onClick="deleteRow('dataTable')" >
         		</div>
                </table>
                <table class="des" id="dataTable">
                <tr>
                <td width="2%"><input class="ch" type="checkbox" name="chk[]"/></td>
                <td width="38%">
                
                <select name="pr[]" class="des_cap">
                <?php
				while($row_sd=mysql_fetch_array($res_sd))
				{
					echo "<option>";
					echo $row_sd[0];
					echo "</option>";
				}
				?>
                </select>
                </td>
                <td width="15%">
                 <input class="des_cap" type="text" name="qnt[]" id="" value="" ><br>
                </td>
                <td width="15%">
                 <input class="des_q" type="text" name="r[]" id="r" value=""  onkeyup="getValues()"><br>
                </td>
                <td width="15%">
                 <input class="des_q" type="text" name="value[]" id="value" value=""  readonly><br>
                </td>
                <td width="15%">
                 <input class="des_q" type="text" name="amt[]" id="value" value=""><br>
                </td>
                </tr>
                </table>
                
 				<div class="i_button">
       			 <input type="submit" value="Submit" name="submit">
        		<input type="submit" value="Cancel" name="cancel">
       
      			</div>
				</form>
        </div>
		</div>
       		<div id="loading" ></div>
			<div id="content" ></div>
            
        	<table width="800px">
			<tr><Td>
			<ul id="pagination">
				<?php
				//Show page links
				for($i=1; $i<=$pages; $i++)
				{
					echo '<li id="'.$i.'">'.$i.'</li>';
				}
				?>
	</ul>	
	</Td></tr></table>

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
