//id, pw, pwEquals, name, email
let results = [false, false, false, false, false, false, false];

// ID check
$("#id").blur(function(){
    let id = $("#id").val();
    let result = nullcheck($("#id").val(), "#inputIdResult", "ID");
    results[0] = result;
    
    //단 id가 비어있지 않을때 사용
    
    // $.get("./idCheck?id="+id, function(data){
    //     console.log(data);
    //     if(data=='0'){
    //         $("#inputIdResult").text("사용 가능한 ID입니다")
    //         results[0] = true;
    //     }else{
    //         $("#id").val("");
    //         $("#inputIdResult").text("이미 사용중인 ID입니다")
    //         results[0] = false;
    //     }
    // })
}); 

// PW check
$("#pw").on({
    blur: function(){
        let result = nullcheck($("#pw").val(), "#inputPwResult","Password");
        results[1] = result;
    },
    change: function(){
    $("#pw2").val("");
    results[2] = false;
    $("#inputPw2Result").text("");
    }
}); 

// PW equal check
$("#pw2").blur(function(){
    console.log("pw2");
    let result = equals($("#pw").val(), $("#pw2").val());
        if(result){
            $("#inputPw2Result").text("입력 확인");
        } else{
            $("#inputPw2Result").text("Password를 다시 입력하세요.");
        }
    results[2] = result;
}); 
    
// name check
$("#name").blur(function(){
    let result = nullcheck($("#name").val(), "#inputNameResult", "이름")
    results[3] = result;
}); 

// email check
$("#email").blur(function(){
    let result = nullcheck($("#email").val(), $("#inputEmailResult"), "이메일")
    results[4] = result;
}); 

// age check
$("#age").blur(function(){
    let result = false;
    if($("#age").val()===0){
        $("#inputAgeResult").text("나이를 다시 확인해주세요");
        result = false;
    } else{
        $("#inputAgeResult").text("");
        result = true;
    }
    results[5] = result;
}); 

//  check
$("#birth").blur(function(){
    let result = nullcheck($("#birth").val(), $("#inputBirthResult"), "생일")
    results[6] = result;
}); 


$("#joinBtn").click(function(){
    let result = false;
    if($("#age").val()==0){
        $("#inputAgeResult").text("나이를 다시 확인해주세요");
        result = false;
    } else{
        $("#inputAgeResult").text("");
        result = true;
    }
    results[5] = result;

    let result6 = nullcheck($("#birth").val(), $("#inputBirthResult"), "생일")
    results[6] = result6;

    if(results.includes(false)){
        alert("필수 정보 입력이 필요합니다");
    } else {
        alert("전송");
        $("#joinFrm").submit();
    }
});