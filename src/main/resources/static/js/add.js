{/* <div class="mb-3">
<label for="contents" class="form-label">File</label>
<input type="file" name="files">
<button>X</button>
</div>
*/}

let count = 0;
let titleCheck = false;
let writerCheck = false;
let contentsCheck = false;

//title, writer, contents
let results = [false, false, false];

$("#fileAdd").click(function(){
   let file = '<div class="mb-3">';
   file = file+'<label for="contents" class="form-label">File</label>';
   file = file+'<input type="file" name="files">';
   file = file+'<button type="button" class="fileDel">X</button>';
   file = file+'</div>';
   if(count<5){
       $("#fileArea").append(file);
        count++;
   } else{
    alert("파일추가는 5개까지만");
    return;
   } 
});

$("#fileArea").on("click",".fileDel", function(event){
    let check = window.confirm("사진 삭제??");
    if(check){
        console.log(event.target);
       $(event.target).parent().remove();
       count--;
    }
});

$("#title").blur(function(){
    
    
})

$("#addBtn").click(function(){


    if(titleCheck&&writerCheck&&contentsCheck){
        $("#idFrm").submit();
    }
});

function nullcheck(data, dest, kind){
    if(data==null||data==''){
        $(dest).text(kind+" 입력은 필수입니다");
        return false;
    } else{
        $(dest).text("");
        return true;
    }
}