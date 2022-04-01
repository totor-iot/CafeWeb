"use strict";

function GetOrgRow(row) {
    $(document).ready(function () {

        var gridRow = row.parentNode.parentNode.parentNode;
        $('#OrgUpdateId').val(gridRow.cells[0].textContent);
        $('#OrgUpdateId').prop('readonly', true);
        $('#OrgUpdateName').val(gridRow.cells[1].textContent);
        var chkBox = (gridRow.cells[2].textContent == "Evet") ? true : false;
        $('#OrgUpdateActive').prop('checked', chkBox);
    });
}

function UpdatePopup() {
    let resultEl = document.getElementById('resultEl');
    let result = resultEl.textContent;
    let resultList = result.split(':');

    if (resultList[0] != '0') {
        ErrorPopup(resultList[1]);
    }
    else {
        Swal.fire(
            'Başarılı',
            'Başarıyla güncellenmiştir.',
            'success'
        )
    }
    resultEl.innerText = '';
}

function SavePopup() {
    let resultEl = document.getElementById('resultEl');
    let result = resultEl.textContent;
    let resultList = result.split(':');

    if (resultList[0] != '0') {
        ErrorPopup(resultList[1]);
    }
    else {
        Swal.fire(
            'Başarılı',
            'Başarıyla kaydedilmiştir.',
            'success'
        )
    }
    resultEl.innerText = '';
}

function ErrorPopup(message) {
    Swal.fire(
        'Hata!',
        message,
        'error'
    )
}

var app = new Vue({
    el: '#app',
    data: {
        showOrg: false,
        showPers: false,
        save: true,
        edit: false,
        orgPop: false,
        persPop: false,
        isPostBack: false,
        isPop: false
    },
    mounted() {
        this.getState();
    },
    methods: {
        focusBtn: function (typ) {
            var dataEl = document.getElementById(typ);
            dataEl.className = 'btn';
            dataEl.classList.add('btn-primary');
            switch (typ) {
                case 'saveBtn':
                    this.dynamicClass(['editBtn']);
                    break;

                case 'editBtn':
                    this.dynamicClass(['saveBtn']);
                    break;

                default:
                    break;
            }
        },
        dynamicClass: function (btnList) {
            for (let i = 0; i < btnList.length; i++) {
                document.getElementById(btnList[i]).className = 'btn';
                document.getElementById(btnList[i]).classList.add('btn-light');
            }
        },
        userFormCheck: function () {
            let orgFk = document.getElementById('UserOrgId');
            let userName = document.getElementById('UserSetName');
            let userYetki = document.getElementById('UserYetki');
            let password = document.getElementById('UserSetPassword');
            let passConf = document.getElementById('UserSetPassConfirm');
            let yetki = userYetki.options[userYetki.selectedIndex].value;
            if (yetki == null || yetki == "") {
                ErrorPopup('Yetkilendirme boş geçilemez!');
                return null;
                
            }
            else {
                if (orgFk.value == null || orgFk.value == "") {
					ErrorPopup("İşletme Id'si boş bırakılamaz!");
                    return null;
                }
                if (userName.value == null || userName.value == "") {
					ErrorPopup("Kullanıcı adı boş geçilemez!");
                    return null;
                }
                if ((password.value == "" || passConf.value == "") || (password.value != passConf.value)) {
                    ErrorPopup("Şifreler boş veya uyumsuz!");
                    return null;
                }
                else {
                    this.isPop = true;
                }
            }
        },
        setState: function (showOrg, showPers, save, edit, isPostBack) {
            sessionStorage.setItem('showOrg', showOrg);
            sessionStorage.setItem('showPers', showPers);
            sessionStorage.setItem('save', save);
            sessionStorage.setItem('edit', edit);
            sessionStorage.setItem('isPostBack', isPostBack);
        },
        getState: function () {
            if (sessionStorage.getItem('isPostBack') != null || sessionStorage.getItem('isPostBack') != "") {
                this.isPostBack = sessionStorage.getItem('isPostBack') == "true" ? true : false;

                if (this.isPostBack) {
                    if (sessionStorage.getItem('showOrg') != null || sessionStorage.getItem('showOrg') != "") {
                        this.showOrg = sessionStorage.getItem('showOrg') == "true" ? true : false;
                    }
                    if (sessionStorage.getItem('showPers') != null || sessionStorage.getItem('showPers') != "") {
                        this.showPers = sessionStorage.getItem('showPers') == "true" ? true : false;
                    }
                    if (sessionStorage.getItem('save') != null || sessionStorage.getItem('save') != "") {
                        this.save = sessionStorage.getItem('save') == "true" ? true : false;
                    }
                    if (sessionStorage.getItem('edit') != null || sessionStorage.getItem('edit') != "") {
                        this.edit = sessionStorage.getItem('edit') == "true" ? true : false;
                    }

                    if (this.edit) {
                        this.focusBtn('editBtn');
						UpdatePopup();
                    }
                    else {
                        this.focusBtn('saveBtn');
						SavePopup();
                    }

                    this.isPostBack = false;
                    sessionStorage.setItem('isPostBack', this.isPostBack);

                    if (window.history.replaceState) {
                        window.history.replaceState(null, null, window.location.href);
                    }
                }
            }
        }
    },
    watch: {
        showOrg: function (val) {
            if (!val && !this.showPers) {
                this.save = true;
                this.edit = false;
                this.focusBtn('saveBtn');
            }
        },
        showPers: function (val) {
            if (!val && !this.showOrg) {
                this.save = true;
                this.edit = false;
                this.focusBtn('saveBtn');
            }
        }
    }
})