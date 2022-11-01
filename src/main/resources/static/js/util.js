function nullcheck(data, dest, kind){
    if(data==null||data==''){
        $(dest).text(kind+" 입력은 필수입니다");
        return false;
    } else{
        $(dest).text("");
        return true;
    }
}