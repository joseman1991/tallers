/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(function () {

    // We can attach the `fileselect` event to all file inputs on the page
    $(document).on('change', ':file', function () {
        var input = $(this),
                numFiles = input.get(0).files ? input.get(0).files.length : 1,
                label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
        input.trigger('fileselect', [numFiles, label]);
    });

    // We can watch for our custom `fileselect` event like this
    $(document).ready(function () {
        $(':file').on('fileselect', function (event, numFiles, label) {

            var input = $(this).parents('.input-group').find(':text'),
                    log = numFiles > 1 ? numFiles + ' files selected' : label;

            if (input.length) {
                input.val(log);
                
            } else {
                if (log)
                    alert(log);
            }
        });      
    });
    
    
    $("#imputImg").change(function () {
        readURL(this,$("div.imgAt"));
    });
    

    function readURL(input,selector) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();             
            reader.onload = function (e) {
                selector.parent().data("thumb", "images/banner-14.jpg"); 
                selector.find("img").attr('src', e.target.result);              
            };
            reader.readAsDataURL(input.files[0]);            
        }
    }


});