<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>编辑用户信息</title>
    <style>
        body {
            font-family: Arial, sans-serif; /* 设置字体 */
            background-color: #f4f4f4; /* 背景颜色 */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* 占满视口高度 */
            margin: 0; /* 移除默认边距 */
        }
        .container {
            background-color: white; /* 容器背景颜色 */
            padding: 20px; /* 内边距 */
            border-radius: 8px; /* 边框圆角 */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 轻微的阴影 */
            width: 100%;
            max-width: 400px; /* 最大宽度 */
        }
        form {
            display: flex;
            flex-direction: column; /* 表单元素垂直排列 */
        }
        label {
            margin-top: 10px; /* 标签上边距 */
        }
        input[type="text"],
        input[type="number"],
        select {
            width: 100%; /* 输入框宽度 */
            padding: 10px; /* 输入框内边距 */
            margin-top: 5px; /* 输入框上边距 */
            border: 1px solid #ddd; /* 输入框边框 */
            border-radius: 4px; /* 输入框圆角 */
            box-sizing: border-box; /* 边框计算在宽度内 */
        }
        input[type="submit"] {
            margin-top: 20px; /* 提交按钮上边距 */
            background-color: #5cb85c; /* 提交按钮背景颜色 */
            color: white; /* 提交按钮文字颜色 */
            border: none; /* 无边框 */
            padding: 10px;
            border-radius: 4px; /* 圆角 */
            cursor: pointer; /* 鼠标悬停时显示手形图标 */
        }
        input[type="submit"]:hover {
            background-color: #4cae4c; /* 提交按钮悬浮效果 */
        }
        .error-message, .success-message {
            margin-top: 10px; /* 消息上边距 */
            padding: 10px;
            border-radius: 5px; /* 消息圆角 */
        }
    </style>
</head>
<body>
<div class="container">
    <c:if test="${not empty errorMessage}">
        <p class="error-message">${errorMessage}</p>
    </c:if>
    <c:if test="${not empty successMessage}">
        <p class="success-message">${successMessage}</p>
    </c:if>

    <form action="${pageContext.request.contextPath}/user/update" method="post">
        <input type="hidden" name="id" value="${user.id}" />
        <label for="name">姓名:</label>
        <input type="text" id="name" name="name" value="${user.name}" required />

        <label for="age">年龄:</label>
        <input type="number" id="age" name="age" value="${user.age}" required />

        <label for="sex">性别:</label>
        <select id="sex" name="sex" required>
            <option value="男" ${user.sex == '男' ? 'selected' : ''}>男</option>
            <option value="女" ${user.sex == '女' ? 'selected' : ''}>女</option>
        </select>

        <input type="submit" value="提交" />
    </form>
</div>
</body>
</html>