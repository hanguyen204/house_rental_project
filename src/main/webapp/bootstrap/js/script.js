function redirectToHomePage() {
    window.location.href = "/home-page";
}
function redirectToLogin() {
    window.location.href = "login.jsp";
}
function redirectToRegister() {
    window.location.href = "register.jsp";
}
function redirectToProperties() {
    window.location.href = "/listHouse";
}
function redirectToSubmitProperties() {
    window.location.href = "/submit-properties.jsp";
}
function formatRevenue() {
    var revenueElement = document.getElementById("revenueValue");
    var revenue = parseInt(revenueElement.textContent);

    if (revenue >= 1000000) {
        var revenueInMillions = Math.floor(revenue / 1000000);
        revenueElement.textContent = revenueInMillions + " Triệu";
    }
}
window.onload = formatRevenue;

function previewImage(event) {
    var reader = new FileReader();
    reader.onload = function() {
        var output = document.getElementById('wizardPicturePreview');
        output.src = reader.result;
    };
    reader.readAsDataURL(event.target.files[0]);
}