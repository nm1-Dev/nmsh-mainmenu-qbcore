$(function () {

    function display(bool) {
        if (bool) {
            $("html").show();
        } else {
            $("html").hide();
        }
    }

    function displaylevel(bool) {
        if (bool) {
            $("#level").show();
        } else {
            $("#level").hide();
        }
    }
    
    function displayadmincontact(bool) {
        if (bool) {
            $("#administratorcontact").show();
        } else {
            $("#administratorcontact").hide();
        }
    }

    display(false)
    displaylevel(false)
    displayadmincontact(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "show") {
            if (item.status == true) {
                $("html").fadeIn();
                display(true)
            } else {
                display(false)
            }
        }
        if (item.type === "showlevel") {
            if (item.status == true) {
                displaylevel(true)
            } else {
                displaylevel(false)
            }
        }
        if (item.type === "showadmincontact") {
            if (item.status == true) {
                displayadmincontact(true)
            } else {
                displayadmincontact(false)
            }
        }
    })

    window.addEventListener('message', function (event) {
        try {
            switch(event.data.action) {
                case 'playername':
                    if (event.data.value != null) playername.innerHTML = event.data.value;
                break;

                case 'phonenumber':
                    if (event.data.value != null) phonenumber.innerHTML = event.data.value;
                break;

                case 'jobname':
                    if (event.data.value != null) jobname.innerHTML = event.data.value;
                break;

                case 'walletamount':
                    if (event.data.value != null) walletamount.innerHTML = '$' + event.data.value.toLocaleString('en-US');
                break;

                case 'bankamount':
                    if (event.data.value != null) bankamount.innerHTML = '$' + event.data.value.toLocaleString('en-US');
                break;

                case 'whatlevel':
                    if (event.data.value != null) whatlevel.innerHTML = event.data.value;
                break;
            }
    } catch(err) {}
    });
    
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $("html").fadeOut("slow");
            $.post('https://nmsh-mainmenu/close', JSON.stringify({}));
            return
        }
    };

    $("#inventory").click(function () {
        $.post('https://nmsh-mainmenu/inventory', JSON.stringify({}));
        return
    })

    $("#billing").click(function () {
        $.post('https://nmsh-mainmenu/billing', JSON.stringify({}));
        return
    })

    $("#cardealership").click(function () {
        $.post('https://nmsh-mainmenu/cardealership', JSON.stringify({}));
        return
    })
    
    $("#shop").click(function () {
        $.post('https://nmsh-mainmenu/shop', JSON.stringify({}));
        return
    })
    
    $("#administratorcontact").click(function () {
        $.post('https://nmsh-mainmenu/administratorcontact', JSON.stringify({}));
        return
    })
    
    $("#jobcenter").click(function () {
        $.post('https://nmsh-mainmenu/jobcenter', JSON.stringify({}));
        return
    })
})