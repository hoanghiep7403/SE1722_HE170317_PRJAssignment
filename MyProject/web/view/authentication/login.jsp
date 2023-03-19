
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">

        <meta http-equiv="X-UA-Compatible" content="IE=Edge" /><meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" /><title>
            FPT University Academic Portal
        </title><link rel="Stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" type="text/css" /><link rel="Stylesheet" href="view/authentication/login.css" type="text/css" />
        <link rel="Stylesheet" href="Content/bootstrap.css" type="text/css" /><link rel="Stylesheet" href="Content/bootstrap.min.css" type="text/css" />
        <style type="text/css">
            .style1 {
                font-weight: bold;
            }

            body {
                background-image: url('1271205.jpg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: 100% 100%;
            }
            legend{
                font-size: 40px;
                border: 2px solid #1b34b2;
                border-radius: 2px;
            }
            p{
                font-size: 50px;
                margin-right: 50px;
            }
        </style>


    </head>

    <body>
       
        <div class="container">

            <div class="row">

                <div class="col-md-8">

                    <h1><span>FPT University Academic Portal</span>
                    </h1>

                </div>
                <div class="col-md-4">
                    <table>
                        <tr>
                            <td colspan="2" class="auto-style1"><strong>FAP mobile app (myFAP) is ready at</strong></td>

                        </tr>
                        <tr>
                            <td><a href="https://apps.apple.com/app/id1527723314">
                                    <img src="https://fap.fpt.edu.vn/images/app-store.svg" style="width: 120px; height: 40px" alt="apple store" /></a></td>
                            <td><a href="https://play.google.com/store/apps/details?id=com.fuct">
                                    <img src="https://fap.fpt.edu.vn/images/play-store.svg" style="width: 120px; height: 40px" alt="google store" /></a></td>

                        </tr>
                    </table>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">

                    <table>
                        <tr style="border-bottom: 0 none">
                            <td>
                                <div>
                                    <div style="height: 300px" class="row">
                                        <div class="col-md-6">
                                            <div style="border: solid 1px #ccc; height: 200px;">
                                                <fieldset>
                                                    <legend><span style="background-color: orange" class="label label-default  btn-warning"><b>Sinh viên, Giảng viên, Cán bộ ĐH-FPT</b></span></legend>
                                                    <div id="loginform" 
                                                         vertical-align: central">
                                                        <center>
                                                            <div class="row">
                                                                <form action="login" method="POST">
                                                                    <div class="content">
                                                                        <div class="input-field">
                                                                            <input name="username" type="username" placeholder="Username" autocomplete="nope">
                                                                        </div>
                                                                        <div class="input-field">
                                                                            <input name="password" type="password" placeholder="Password" autocomplete="new-password">
                                                                        </div>
                                                                        <div class="input-field">
                                                                            <select name="campus" class="btn btn-default" required>
                                                                                <option selected="selected" value="">Select Campus</option>
                                                                                <option value="1">FU-Hoà Lạc</option>
                                                                                <option value="2">FU-Hồ Chí Minh</option>
                                                                                <option value="3">FU-Đà Nẵng</option>
                                                                                <option value="4">FU-Cần Thơ</option>
                                                                                <option value="5">FU-Quy Nhơn</option>
                                                                            </select>
                                                                        </div>
                                                                        <br/>
                                                                        <a href="#" class="link">Forgot Your Password?</a>
                                                                    </div>
                                                                    <div class="action">
                                                                        <button>Register</button>
                                                                        <button>Log in</button>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                            <br />
                                                        </center>
                                                    </div>
                                                </fieldset>
                                            </div> 
                                        </div>
                                        <div class="col-md-6">
                                            <p>Welcome to FPTU Hoa Lac!</p>
                                        </div>
                                       
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <p style="text-align: center">
                            <h3>Make FPT great again!!!!</h3>
                        </p>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
