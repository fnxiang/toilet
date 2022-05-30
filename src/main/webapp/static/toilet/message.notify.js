function show(msg) {
    document.getElementById("dialog_text").innerHTML = msg;
    $(".dialog").css("display", "block");
}

function close() {
    $(".dialog").css("display", "none");
}