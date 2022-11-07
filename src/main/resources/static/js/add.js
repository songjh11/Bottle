{/* <div class="mb-3">
<label for="contents" class="form-label">File</label>
<input type="file" name="files">
<button>X</button>
</div>
*/}

let count = 0;

let titleResult=false;
let writerResult=false;

//title, writer
let results = [false, false];

$("#fileAdd").click(function(){
   let file = '<div class="mb-3">';
   file = file+'<label for="contents" class="form-label">File</label>';
   file = file+'<input type="file" name="files" class="files">';
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
    let result = nullcheck($("#title").val(), "#titleResult", "제목 ");
    results[0] = result;
})

$("#writer").blur(function(){
    let result = nullcheck($("#writer").val(), "#writerResult", "작성자 ");
    results[1] = result;
})

$("#addBtn").click(function(){
    titleResult = nullcheck($("#title").val(), "#titleResult", "제목 ");
    writerResult = nullcheck($("#writer").val(), "#writerResult", "작성자 ");

    if(!titleResult||!writerResult){
        alert("필수 정보 입력이 필요합니다");
    } else {
        let lastCheck = window.confirm("게시글을 등록하시겠습니까?") 
        if(lastCheck){
            $("#addFrm").submit();
        } else{
            return;
        }
        
    }
});