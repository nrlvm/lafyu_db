dateUtil(int n){
  String s ='';
  if (n < 9){
    s = '0$n';
  }else{
    s = n.toString();
  }
  return s;
}