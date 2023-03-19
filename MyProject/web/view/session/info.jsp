
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
        <div class="container" style="margin-left: 50px">
            <div class="row" style="display: flex">
                <div class="col-md-8" style="margin-left: 100px">
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
            <div class="row" style="background-color: rgb(234, 234, 234); height: 40px; width: 1100px; margin-top: 30px; margin-left: 100px; display: flex">
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
                    <h3 style="margin-top: 8px; margin-left: 20px"><strong>| View</strong></h3></a>               
                </div>
                <div class="col-md-6" style="margin-left: 640px">
                    <c:if test="${requestScope.stu ne null}">
                        <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                            <button style="background-color: rgb(67, 205, 128); color: white">
                                <a style="color: white" href="../student/info">${s.account.accountName}</a>
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
            <table style="margin-left: 50px;">
                <tbody>
                    <tr>
                        <td>
                            <div>
                                <h2 style="margin-left: 50px">Activity detail</h2>
                                <br/>
                            </div>
                            <table>
                                <tbody>
                                    <c:forEach items="${requestScope.sessions}" var="s" varStatus="loop">
                                        <tr>
                                            <td style="width: 550px; border-bottom: solid lightgray 1px"><b>Date:</b></td>
                                            <td style="width: 550px; border-bottom: solid lightgray 1px"><fmt:formatDate value="${s.date}" pattern="EEEE"/> - <fmt:formatDate value="${s.date}" type="date"/></td>
                                        </tr>
                                        <tr>
                                            <td style=" border-bottom: solid lightgray 1px"><b>Slot:</b></td>
                                            <td style=" border-bottom: solid lightgray 1px">${s.slot.id}</td>
                                        </tr>
                                        <tr>
                                            <td style=" border-bottom: solid lightgray 1px"><b>Student group:</b></td>                                    
                                            <td style=" border-bottom: solid lightgray 1px"><a style="color: blue" href="../student/group?class=${s.group.id}">${s.group.name}</a></td>
                                        </tr>
                                        <tr>
                                            <td style=" border-bottom: solid lightgray 1px"><b>Instructor:</b></td>
                                            <td style=" border-bottom: solid lightgray 1px"><a style="color: blue" href="../lecturer/info?lecturer=${s.lecturer.id}">${s.lecturer.code}</a></td>

                                        </tr>
                                        <tr>
                                            <td style=" border-bottom: solid lightgray 1px"><b>Course:</b></td>
                                            <td style=" border-bottom: solid lightgray 1px">${s.course.name}(${s.course.code})</td>
                                        </tr>
                                        <tr>
                                            <td style=" border-bottom: solid lightgray 1px"><b>Course session number:</b></td>
                                            <td style=" border-bottom: solid lightgray 1px"></td>
                                        </tr>
                                        <tr>
                                            <td style=" border-bottom: solid lightgray 1px"><b>Course session type:</b></td>
                                            <td style=" border-bottom: solid lightgray 1px"></td>
                                        </tr>
                                        <tr>
                                            <td style=" border-bottom: solid lightgray 1px"><b>Course session description:</b></td>
                                            <td style=" border-bottom: solid lightgray 1px"></td>
                                        </tr>
                                        <tr>
                                            <c:forEach items="${requestScope.camps}" var="cs" varStatus="loop">          
                                                <td style=" border-bottom: solid lightgray 1px"><b>Campus/Programme:</b></td>
                                                <td style=" border-bottom: solid lightgray 1px">${cs.name}</td>
                                            </c:forEach>
                                        </tr>
                                        <tr>
                                            <td style=" border-bottom: solid lightgray 1px"><b>Attendance:</b></td>
                                            <c:if test="${s.status eq true}">
                                                <%--<c:if test="${s.status eq true}">--%>
                                                <td style=" border-bottom: solid lightgray 1px">Attended</td>
                                                <%--</c:if>--%>
                                                <%--<c:if test="${s.status eq false}">--%>
                                                <!--<td style=" border-bottom: solid lightgray 1px">Absent</td>-->
                                                <%--</c:if>--%>                                      
                                            </c:if>
                                            <c:if test="${s.status eq false}">
                                                <td style=" border-bottom: solid lightgray 1px">Not yet</td>
                                            </c:if>
                                        </tr>
                                        <tr>
                                            <td style=" border-bottom: solid lightgray 1px"><b>Record time:</b></td>
                                            <td style=" border-bottom: solid lightgray 1px"></td>
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
