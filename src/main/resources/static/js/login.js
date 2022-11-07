let passwordResult = false;
let idResult = false;

$("#lgBtn").click(function(){
    idResult = nullcheck($("#floatingInput").val(), "#idResult", "ID ");
    passwordResult = nullcheck($("#floatingPassword").val(), "#passwordResult", "패스워드 ");

    if(idResult&&passwordResult){
        alert("로그인 성공");
        $("#lgFrm").submit();
    } else{
        alert("필수 정보 입력 후 다시 시도해주세요");
        return;
    }


})

