<%--
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>获取信息</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
        }
        #centeredButton {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        #centeredButton:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<!-- 创建一个表单，action设置为/users，method设置为GET -->
<form action="/user" method="get">
    <button id="centeredButton" type="submit">获取信息</button>
</form>
</body>
</html>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>用户列表</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #333;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 50px auto;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 15px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .btn {
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .btn-edit {
            background-color: #5cb85c;
        }
        .btn-delete {
            background-color: #d9534f;
        }
        .btn:hover {
            opacity: 0.9;
        }
        button {
            padding: 10px 20px; /* 按钮内边距 */
            font-size: 16px; /* 字体大小 */
            color: #ffffff; /* 字体颜色 */
            background-color: #007bff; /* 背景颜色 */
            border: none; /* 边框 */
            border-radius: 5px; /* 圆角 */
            cursor: pointer; /* 鼠标悬停时的光标样式 */
            transition: background-color 0.3s; /* 背景颜色变化的过渡效果 */
        }
    </style>
</head>
<body>
<c:if test="${not empty errorMessage}">
    <p class="error-message">${errorMessage}</p>
</c:if>
<c:if test="${not empty successMessage}">
    <p class="success-message">${successMessage}</p>
</c:if>
<h1>用户列表</h1>
<td>
    <!-- 添加一个按钮，点击时跳转到insert.jsp -->
    <a class="btn btn-edit" href="${pageContext.request.contextPath}/user/toInsert">添加用户</a>
</td>
<table border="1">
    <tr>
        <th>ID</th>
        <th>姓名</th>
        <th>年龄</th>
        <th>性别</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${users}" var="user">
        <tr>
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.age}</td>
            <td>${user.sex}</td>
            <td>
                <!-- 编辑按钮 -->
                <a class="btn btn-edit" href="${pageContext.request.contextPath}/user/toUpdateUser/${user.id}">修改</a>
                <!-- 删除按钮 -->
                <a class="btn btn-delete" href="${pageContext.request.contextPath}/user/deleteUser/${user.id}" onclick="return confirm('确定要删除吗？');">删除</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
<script type="text/javascript">
    window.onload = function() {
        // 发送请求到/list获取数据
        fetch('/user').then(function(response) {
            return response.json();
        }).then(function(data) {
            // 处理获取到的数据
            console.log(data);
        }).catch(function(error) {
            console.error('Error:', error);
        });
    };
</script>
</html>