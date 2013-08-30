<?php
include("../session/session.php");
include("../include/database.php");
?>
<html>
<head>
<title>Shri Lal Bharti Food Product</title>
<link rel="stylesheet" href="../styles2.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../css/style.css" media="screen" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
</head>
<body class="fade-in">
<div id="container">
<div id="sub-header">
		<?php
		   include("include/p_header.php");
		   $test = 15.01;
		   echo round($test,2,PHP_ROUND_HALF_UP);
		?>
  </div>
</div>
  	<div class="clear"></div>
    </div>
</div>
 <div id="footer">
     <div class="clear"></div> 
    </div>
    </div>
</body>
</html>
