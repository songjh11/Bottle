function nullcheck(data, dest, kind){
    if(data==null||data==''){
        $(dest).text(kind+" 입력은 필수입니다");
        return false;
    } else{
        $(dest).text("");
        return true;
    }
}

function equals(data, data2){
    if(data==data2){
        return true;
    } else{
        return false;
    }
}
