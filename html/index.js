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
    document.getElementById("actionDropdownButton").innerHTML = '';
    let icon;
    switch (action) {
        case 'Revoke':
            icon = createFontAwesomeIcon('fa-trash', '#ff6666');
            break;
        case 'Award':
            icon = createFontAwesomeIcon('fa-hand-holding-heart', '#66ff66');
            break;
    }
    document.getElementById("actionDropdownButton").appendChild(icon);
    document.getElementById("actionDropdownButton").appendChild(document.createTextNode(' ' + action));
    var selectedAction = action;
}

function createFontAwesomeIcon(className, color) {
    let icon = document.createElement('i');
    icon.className = 'fa-solid ' + className;
    icon.style.color = color;
    return icon;
}

function selectLicense(license) {
    document.getElementById("licenseDropdownButton").innerHTML = '';
    let icon = document.createElement('i');
    icon.className = 'fa-solid fa-id-card-clip';
    icon.style.color = '#ff9900';
    document.getElementById("licenseDropdownButton").appendChild(icon);
    document.getElementById("licenseDropdownButton").appendChild(document.createTextNode(' ' + license));
    var selectedLicense = license;
}

function selectTarget(target) {
    document.getElementById("targetDropdownButton").innerHTML = '';
    let icon = createFontAwesomeIcon('fa-hashtag', '#ff9900');
    document.getElementById("targetDropdownButton").appendChild(icon);
    document.getElementById("targetDropdownButton").appendChild(document.createTextNode(' ' + target));
    var selectedTarget = target;
    console.log('Selected Target:', target);
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

window.addEventListener('message', function (event) {
    let data = event.data;
    if (data.type === 'updatePlayerIds') {
        let playerIds = data.playerIds;
        document.getElementById('targetDropdown').innerHTML = '';
        playerIds.forEach(playerId => {
            let aTag = document.createElement('a');
            aTag.href = '#';
            aTag.onclick = function () {
                selectTarget(playerId);
            };
            let icon = document.createElement('i');
            icon.className = 'fa-solid fa-hashtag';
            icon.style.color = '#ff9900';
            aTag.appendChild(icon);
            aTag.appendChild(document.createTextNode(' ' + playerId));
            let listItem = document.createElement('div');
            listItem.appendChild(aTag);
            document.getElementById('targetDropdown').appendChild(listItem);
        });
    }
});

window.addEventListener('message', function (license_event) {
    let license_data = license_event.data;
    if (license_data.type === 'updateLicenses') {
        document.getElementById('licenseDropdown').innerHTML = '';
        license_data.license_data.forEach(license_label => {
            console.log(license_label)
            let aTag = document.createElement('a');
            aTag.href = '#';
            aTag.onclick = function () {
                selectLicense(license_label);
            };
            let icon = document.createElement('i');
            icon.className = 'fa-solid fa-id-card-clip';
            icon.style.color = '#ff9900';
            aTag.appendChild(icon);
            aTag.appendChild(document.createTextNode(' ' + license_label));
            let listItem = document.createElement('div');
            listItem.appendChild(aTag);
            document.getElementById('licenseDropdown').appendChild(listItem);
        });
    }
});

function processInformation() {
    let actionFinal = document.getElementById("actionDropdownButton").textContent.trim();
    let licenseFinal = document.getElementById("licenseDropdownButton").textContent.trim();
    let targetFinal = document.getElementById("targetDropdownButton").textContent.trim()
    console.log("you want to " + actionFinal + ", " + licenseFinal + " from " + targetFinal);
}