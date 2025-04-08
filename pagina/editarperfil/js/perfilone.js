document.getElementById('guardar-btn').addEventListener('click', function() {
    alert('Los cambios han sido guardados.');
});

document.getElementById('cambiar-foto').addEventListener('change', function(event) {
    const reader = new FileReader();
    reader.onload = function() {
        const output = document.getElementById('foto-perfil');
        output.src = reader.result;
    };
    reader.readAsDataURL(event.target.files[0]);
});

function toggleEdit(fieldId) {
    const field = document.getElementById(fieldId);
    if (field.disabled) {
        field.disabled = false;
        field.focus();
    } else {
        field.disabled = true;
    }
}
