

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container" style="margin-left: 200px">
            <div class="row" style="display: flex">
                <div class="col-md-8" style="margin-left: 200px">
                    <h1><span>FPT University Academic Portal</span></h1>
                </div>
                <div class="col-md-4" style="margin-left: 200px">
                    <table>
                        <tr>
                            <td colspan="2" class="auto-style1"><strong>FAP mobile app (myFAP) is ready at</strong></td>
                        </tr>
                        <tr>
                            <td><a href="https://apps.apple.com/app/id1527723314">
                                    <img src="https://fap.fpt.edu.vn/images/app-store.svg"
                                         style="width: 120px; height: 40px" alt="apple store" /></a></td>
                            <td><a href="https://play.google.com/store/apps/details?id=com.fuct">
                                    <img src="https://fap.fpt.edu.vn/images/play-store.svg"
                                         style="width: 120px; height: 40px" alt="google store" /></a></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="row" style="background-color: rgb(234, 234, 234); height: 40px; width: 1100px; margin-top: 30px; margin-left: 200px; display: flex">
                <div class="col-md-6" style="text-align: left; display: flex">
                    <a style="margin-left: 20px;" href="../timetable"><h3 style="margin-top: 8px"><strong>Timetable</strong></h3></a>
                    <h3 style="margin-top: 8px; margin-left: 20px"><strong>| User detail</strong></h3></a>                </div>
                <div class="col-md-6" style="margin-left: 600px">
                    <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                        <button style="background-color: rgb(67, 205, 128); color: white">
                            <a style="color: white" href="">${s.account.accountName}</a>
                        </button>
                    </c:forEach>
                    |
                    <button style="background-color: rgb(67, 205, 128)">
                        <a style="color: white" href="http://localhost:9999/PRJ_Assignment/logout">Logout</a>
                    </button>
                    |
                    <c:forEach items="${requestScope.camps}" var="cs" varStatus="loop">          
                        <button style="background-color: rgb(67, 205, 128); color: white">
                            ${cs.name}
                        </button>
                    </c:forEach>
                </div>
            </div>
            <table style="margin-left: 200px">
                <tbody>
                    <tr>
                        <td>
                            <div>
                                <h2 style="margin-left: 50px">User detail</h2><br/>
                            </div>
                            <table>
                                <tbody>
                                    <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">
                                        <tr>
                                            <td style="width: 450px"><b>Login</b></td>
                                            <td style="width: 550px; border-bottom: solid lightgray 1px">${s.account.accountName}</td>
                                        </tr>
                                        <tr>
                                            <td style=" border-bottom: solid lightgray 1px"><b>Full name</b></td>
                                            <td style=" border-bottom: solid lightgray 1px">${s.name}</td>
                                        </tr>
                                        <tr>
                                            <td style=" border-bottom: solid lightgray 1px"><b>Image</b></td>
                                            <td style=" border-bottom: solid lightgray 1px"><img style="height: 150px; width: 120px" src="${s.img}" alt="alt"/></td>
                                        </tr>
                                        <tr>
                                            <td style=" border-bottom: solid lightgray 1px"><b>Email</b></td>
                                            <td style=" border-bottom: solid lightgray 1px">${s.email}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </td> 
                    </tr>
                </tbody>
            </table>
            <div style="margin-bottom: 200px; margin-top: 100px" class="row">
                <div style="margin-left: 150px">
                    <b>Mọi góp ý, thắc mắc xin liên hệ: </b>
                    <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13.333333969116211px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">Phòng dịch vụ sinh viên</span>
                    : Email: 
                    <a style="color: blue" href="">dichvusinhvien@fe.edu.vn</a>
                    . Điện thoại: 
                    <span class="style1" style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13.333333969116211px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">(098)2.730.924 </span>
                </div>
                <tr>
                    <td>
                        <p style="text-align: center; margin-right: 20px">
                            © Powered by <a style="color: blue" href="" target="_blank">FPT University</a>&nbsp;|&nbsp;
                            <a style="color: blue" href="" target="_blank">CMS</a>&nbsp;|&nbsp; <a style="color: blue" href="" target="_blank">library</a>&nbsp;|&nbsp; <a style="color: blue" href="" target="_blank">books24x7</a>
                            <span id="ctl00_lblHelpdesk"></span>
                        </p>
                    </td>
                </tr>
            </div>
        </div>
    </body>
</html>
