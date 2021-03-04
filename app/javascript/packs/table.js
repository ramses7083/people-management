window.makeTableHTML = function(myArray) {
  var result = "<table class='table table-striped'>";
  for(var i=0; i<myArray.length; i++) {
    result += "<tr>";
    for(var j=0; j<myArray[i].length; j++){
      result += "<td>"+myArray[i][j]+"</td>";
    }
    result += "</tr>";
  }
  result += "</table>";

  return result;
}
