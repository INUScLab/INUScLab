
<!DOCTYPE html>

<html>
<head>
    <title>WATER FOOTPRINTS VISUALIZING WEB</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    <style>
    .body{
      background-color: #E2E2E2;
    }
    #layout{
      padding-bottom: 70px;
      padding-top: 100px;
      background-color: white;

      border-color: black;

    }
    #subject{
      font-size:22px;
      color:#949191;
    }

    </style>

</head>

  <body class="body">
    <br><br><br><br><br><br><br><br><br>
    <div class="row">
      <div class="span6"></div>

      <div class="span6">
      <strong id="subject"><center>WATER FOOTPRINTS VISUALIZING WEB</center></strong>


      <form class="form-horizontal" action="send.jsp" id="layout" method="post">
        <div class="control-group">
          <label class="control-label" for="inputID">ID</label>
          <div class="controls">
            <input type="text" id="inputID" placeholder="ID" NAME="id">
          </div>
        </div>
        <div class="control-group">
          <label class="control-label" for="inputPassword">Password</label>
          <div class="controls">
            <input type="password" id="inputPassword" placeholder="Password" NAME="password">
          </div>
        </div>
        <div class="control-group">
          <div class="controls">

            <button type="submit" class="btn">Sign in</button>
          </div>
        </div>
      </form>
      </div>
    





  </div>


    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
