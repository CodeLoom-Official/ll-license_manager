window.addEventListener('message', function (event) {
    var item = event.data;
    var ourDiv = document.querySelector('.OurDiv');

    if (item.showUI) {
        ourDiv.style.opacity = '1';
        ourDiv.classList.add('show');
    } else {
        ourDiv.style.opacity = '0';
        ourDiv.classList.remove('show');
    }
});

function closeUI() {
    var ourDiv = document.querySelector('.OurDiv');
    ourDiv.style.opacity = '0';
    ourDiv.classList.remove('show');
}

document.addEventListener('DOMContentLoaded', function () {
    function closeUI() {

        var ourDiv = document.querySelector('.OurDiv');
        ourDiv.style.opacity = '0';
        ourDiv.classList.remove('show');


        var data = { closeUI: true };
        SendNUIMessage(data);
    }
});

function selectAction(action) {
    document.getElementById("actionDropdownButton").textContent = action;
    var selectedAction = action;
}

function selectLicense(license) {
    document.getElementById("licenseDropdownButton").textContent = license
    var selectedLicense = license
}

function toggleLicenseDropdown() {
    const licenseDropdown = document.getElementById("licenseDropdown");
    licenseDropdown.classList.toggle("show");
}

function toggleActionDropdown() {
    const actionDropdown = document.getElementById("actionDropdown");
    actionDropdown.classList.toggle("show");
}

function toggleTargetDropdown() {
    const actionDropdown = document.getElementById("targetDropdown");
    actionDropdown.classList.toggle("show");
}