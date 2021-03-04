document.getElementById("show-fecuency-btn").addEventListener("click", function() {
  document.getElementById("result").innerHTML = makeTableHTML(gon.frecuency_count);
});

document.getElementById("show-duplicated-btn").addEventListener("click", function() {
  document.getElementById("result").innerHTML = makeTableHTML(gon.duplicated_people);
});

function people_list_table() {
  document.getElementById("people_table").innerHTML = makeTableHTML(gon.people_list);
}

people_list_table()