<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html
    PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
            <title>

            </title>
            <link rel="Stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" type="text/css" />
            <style type="text/css">
                .style1 {
                    font-weight: bold;
                }
            </style>

    </head>

    <body>
        <div class="container" style="margin-left: 50px">
            <div class="row" style="display: flex">
                <div class="col-md-8" style="margin-left: 50px">
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
            <div class="row" style="background-color: rgb(234, 234, 234); height: 40px; width: 1100px; margin-top: 30px; margin-left: 50px; display: flex">
                <div class="col-md-6" style="text-align: left; display: flex">
                    <c:if test="${requestScope.stu ne null}">
                        <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                            <a style="margin-left: 20px;" href="../timetable"><h3 style="margin-top: 8px"><strong>Timetable</strong></h3></a>
                        </c:forEach>
                    </c:if>
                    <c:if test="${requestScope.lect ne null}">
                        <c:forEach items="${requestScope.lect}" var="s" varStatus="loop">          
                            <a style="margin-left: 20px;" href="../schedule"><h3 style="margin-top: 8px"><strong>Schedule</strong></h3></a>
                        </c:forEach>
                    </c:if>
                    <h3 style="margin-top: 8px; margin-left: 20px"><strong>| Groups</strong></h3></a>
                </div>
                <div class="col-md-6" style="margin-left: 620px">
                    <c:if test="${requestScope.stu ne null}">
                        <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                            <button style="background-color: rgb(67, 205, 128); color: white">
                                <a style="color: white" href="info">${s.account.accountName}</a>
                            </button>
                        </c:forEach>
                    </c:if>
                    <c:if test="${requestScope.lect ne null}">
                        <c:forEach items="${requestScope.lect}" var="l" varStatus="loop">          
                            <button style="background-color: rgb(67, 205, 128); color: white">
                                <a style="color: white" href="../lecturer/info?lecturer=${l.id}">${l.account.accountName}</a>
                            </button>
                        </c:forEach>
                    </c:if>
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
            <div class="row" style="margin-top: 50px;">
                <div style="margin-left: 50px;">
                    <table style=" border: 2px solid black">
                        <caption style="text-align: left; font-size: large"><h1>Select a course, then a group...</h1></caption>
                        <thead style="background-color: rgb(0, 179, 255);">
                            <tr>
                                <th scope="col" style="width: 100px; text-align: left;">Campus</th>
                                <th scope="col" style="width: 100px; text-align: left;">Term</th>
                                <th scope="col" style="width: 220px; text-align: left;">Department</th>
                                <th scope="col" style="width: 420px; text-align: left;">Course</th>
                                <th scope="col" style="width: 240px; text-align: left;">Group</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td valign="top">
                                    <div>
                                        <table border="1">
                                            <tbody>
                                                <tr>
                                                    <c:forEach items="${requestScope.camps}" var="cs" varStatus="loop">
                                                        ${cs.name}
                                                    </c:forEach>
                                                </tr>
                                            </tbody>
                                        </table> 
                                    </div>
                                </td>
                                <td valign="top"></td>
                                <td valign="top"></td>
                                <td valign="top">
                                    <div>
                                        <table border="1">
                                            <tbody>
                                                <tr>
                                                    <c:forEach items="${requestScope.courses}" var="c" varStatus="loop">
                                                        <input type="button" onclick="window.location.href = 'group?course=${c.id}'" value="${c.name} (${c.code})"></button><br/>
                                                        </c:forEach>
                                                </tr>
                                            </tbody>
                                        </table> 
                                    </div>
                                </td>
                                <td valign="top">
                                    <div>
                                        <table border="1">
                                            <tbody>
                                                <tr>
                                                    <c:if test="${requestScope.groups ne null}">
                                                        <c:forEach items="${requestScope.groups}" var="g" varStatus="loop">
                                                            <input type="button" onclick="window.location.href = 'group?class=${g.id}'" value="${g.name}"></button><br/>
                                                            </c:forEach>
                                                        </c:if>                                                  
                                                </tr>
                                            </tbody>
                                        </table> 
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row">
                <c:if test="${requestScope.students ne null}">
                    <table style="margin-left: 50px; margin-top: 50px; border: 2px solid black">
                        <caption style="text-align: left; font-size: large;">...then see the student list</caption>
                        <thead>
                            <tr style="background-color: rgb(0, 179, 255);">
                                <th style="width: 100px; text-align: left;">INDEX</th>
                                <th style="width: 50px; text-align: left;">IMAGE</th>
                                <th style="width: 100px; text-align: left;">CODE</th>
                                <th style="width: 280px; text-align: left;">FULL NAME</th>
                                <th style="width: 50px; text-align: left;">Date of Birth</th>
                                <th style="width: 50px; text-align: left;">Email</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.students}" var="s" varStatus="loop">
                                <tr>
                                    <td style="background-color: #dddddd"><strong>${loop.index + 1}</strong></td>
                                    <td style="text-align: center"><img src="${s.img}" alt="alt"/></td>
                                    <td>${s.code}</td>
                                    <td>${s.name}</td>
                                    <td>
                                        <fmt:formatDate type = "date" 
                                                        value = "${s.dob}" />
                                    </td>
                                    <td>${s.email}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>                                                  
            </div>
            <div style="margin-bottom: 50px; margin-top: 100px" class="row">
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