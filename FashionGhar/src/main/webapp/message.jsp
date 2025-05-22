<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirm</title>
    <link rel="stylesheet" href="css/message.css">
</head>
<body onload="openPopup()">
    <div class="container">
        <div class="popup" id="popup">
            <img src="image/tick.png">
            <h2> Successfull </h2>
            <p> Product is added sucessfully!!</p>
            <button type="button" onclick="closePopup()"> OK </button>
        </div>
    </div>

<script>
let popup = document.getElementById("popup");
function openPopup(){
    popup.classList.add("open-popup");
}

function closePopup(){
	window.location.href = "AddProduct";
}
</script>
</body>
</html>
