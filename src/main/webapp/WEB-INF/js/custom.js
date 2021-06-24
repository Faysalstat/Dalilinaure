function uploadImage() {
    var formData = new FormData();
    var fileSelect = document.getElementById("fileSelect");
    if (fileSelect.files && fileSelect.files.length === 1) {
        var file = fileSelect.files[0];
        formData.set("image", file, file.name);
    }
    console.log("Hello");
    var request = new XMLHttpRequest();
    request.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            console.log(this.responseText);
            var data = JSON.parse(this.responseText);
            document.getElementById("imgsrc").src = "${base}img/profiles/" + data.iname;
            document.getElementById("imagename").value = data.iname;
        }
    };
    request.open("POST", "imageupload", true);
    request.send(formData);
}

// class Message{
//     id;
//     roomid;
//     messagefrom;
//     messageto;
//     content;
//     date;
// }
    




   