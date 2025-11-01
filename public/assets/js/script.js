
function showObject(objects) {
    // jika object not visible, make it visible, and otherwise make it hidden
    if (document.getElementById(objects).style.display === 'none') {
        document.getElementById(objects).style.display = 'block';
    } else {
        document.getElementById(objects).style.display = 'none';
    }
}