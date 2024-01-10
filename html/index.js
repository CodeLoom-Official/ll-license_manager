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

function selectTarget(target) {
    document.getElementById("targetDropdownButton").textContent = target
    var selectedLicense = target

    console.log('Selected Action:', action);
    console.log('Selected Player ID:', playerId);
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










window.addEventListener('message', function (event) {
    let data = event.data

    if (data.type === 'updateLicenses') {

        let ll_type = data.ll_license_type
        let ll_label = data.ll_license_label

        // Combine the findings for testing purposes.
        let combiner = ll_type + " | " + ll_label;

        //console.log('COMBINER:', combiner);

        // Split combiner into ll_type and ll_label when needed
        let [restored_ll_type, restored_ll_label] = combiner.split(" | ");
        console.log('Restored ll_type:', restored_ll_type);
        console.log('Restored ll_label:', restored_ll_label);
        console.log('------------------------------------')
    }
});