

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <style type="text/css">


            body {
                background-image: url('logout_wallpaper.jpg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: 100% 100%;
            }

            p{
                font-size: 50px;
                margin-right: 50px;
            }
            h1{
                margin-top: 200px;
                border: 5px solid yellow;
                background-color: rgba(160,82,45, 0.5);
                color: whitesmoke;
            }
            span{
                margin-top: 200px;
                border: 5px solid yellow;
                background-color: rgba(160,82,45, 0.5);
                color: whitesmoke;
            }
        </style>
        <div style="text-align: center">
            <h1>Invalid username or password</h1>
            <br/>
            <b style="color: red">You will be directed to /login after <span id="time"></span> seconds</b>
        </div>
        <script>
            var count = 3;
            var time = document.getElementById('time');
            time.innerHTML = count;
            function counting()
            {
                count--;
                time.innerHTML = count;
                if (count <= 0)
                {
                    window.location.href = 'login';
                }
            }
            setInterval(counting, 1000);

        </script>
    </body>
</html>
