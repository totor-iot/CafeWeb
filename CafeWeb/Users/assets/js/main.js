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

function GetRowForDel (type, row) {
    var gridRow = row.parentNode.parentNode.parentNode;
    var id = gridRow.cells[0].textContent;
    sessionStorage.setItem('delId', `${type}:${id}`);
    document.getElementById('aspHidden').value = sessionStorage.getItem('delId');
}

function GetPersRow(row) {
    $(document).ready(function () {

        var gridRow = row.parentNode.parentNode.parentNode;
        $('#PersUpdateId').val(gridRow.cells[0].textContent);
        $('#PersUpdateId').prop('readonly', true);
        $('#PersUpdateOrgId').val(gridRow.cells[6].textContent);
        $('#PersUpdateName').val(gridRow.cells[1].textContent);
        $('#PersUpdateYetki').val(gridRow.cells[2].textContent == 'Yetkili' ? "2" : "3");
        var chkBox = (gridRow.cells[5].textContent == "Evet") ? true : false;
        $('#PersUpdateActive').prop('checked', chkBox);
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

function DelPopup() {
    let resultEl = document.getElementById('resultEl');
    let result = resultEl.textContent;
    let resultList = result.split(':');

    if (resultList[0] != '0') {
        ErrorPopup(resultList[1]);
    }
    else {
        Swal.fire(
            'Başarılı',
            'Başarıyla silinmiştir.',
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
        showMenus: false,
        showFinancial: false,
        save: true,
        edit: false,
        del: false,
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
        clearResultEl: function () {
            document.getElementById('resultEl').innerText = '';
        },
        persFormCheck: function () {
            let orgFk = document.getElementById('PersUpdateOrgId');
            let persName = document.getElementById('PersUpdateName');
            let persYetki = document.getElementById('PersUpdateYetki');
            let yetki = persYetki.options[persYetki.selectedIndex].value;
            if (yetki == null || yetki == "") {
                ErrorPopup('Yetkilendirme boş geçilemez!');
                return null;

            }
            if (orgFk.value == null || orgFk.value == "") {
                ErrorPopup("İşletme Id'si boş bırakılamaz!");
                return null;
            }
            if (persName.value == null || persName.value == "") {
                ErrorPopup("Kullanıcı adı boş geçilemez!");
                return null;
            }

            this.isPop = true;
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

            this.isPop = true;
        },
        preventPostBack: function () {
            if (window.history.replaceState) {
                window.history.replaceState(null, null, window.location.href);
            }
        },
        setState: function (showOrg, showPers, save, edit, del, isPostBack) {
            sessionStorage.setItem('showOrg', showOrg);
            sessionStorage.setItem('showPers', showPers);
            sessionStorage.setItem('save', save);
            sessionStorage.setItem('edit', edit);
            sessionStorage.setItem('del', del);
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
                    if (sessionStorage.getItem('del') != null || sessionStorage.getItem('del') != "") {
                        this.del = sessionStorage.getItem('del') == "true" ? true : false;
                    }


                    if (this.save && !this.del) {
                        this.focusBtn('saveBtn');
                        SavePopup();
                    }
                    else if (this.edit && !this.del) {
                        this.focusBtn('editBtn');
                        UpdatePopup();
                    }
                    else if (this.del) {
                        document.getElementById('aspHidden').value = sessionStorage.getItem('delId');
                        this.focusBtn('editBtn');
                        this.del = false;
                        DelPopup();
                    }

                    this.isPostBack = false;
                    sessionStorage.setItem('isPostBack', this.isPostBack);

                    this.preventPostBack();
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
        },
        showMenus: function (val) {
            if (!val && !this.showOrg) {
                this.save = true;
                this.edit = false;
                this.focusBtn('saveBtn');
            }
        },
        showFinancial: function (val) {
            if (!val && !this.showOrg) {
                this.save = true;
                this.edit = false;
                this.focusBtn('saveBtn');
            }
        }
    }
})
